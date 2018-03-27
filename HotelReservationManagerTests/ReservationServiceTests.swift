//
//  ReservationServiceTests.swift
//  HotelReservationManagerTests
//
//  Created by Mazharul Huq on 3/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import XCTest
import CoreData
@testable import HotelReservationManager

class ReservationServiceTests: XCTestCase {
    
    var customerService:CustomerService!
    var hotelService:HotelService!
    var reservationService:ReservationService!
    var coreDataStack:CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        reservationService = ReservationService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
        customerService = CustomerService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
        hotelService = HotelService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
    }
    
    override func tearDown() {
        super.tearDown()
        customerService = nil
        hotelService = nil
        reservationService = nil
        coreDataStack = nil
    }
    
    func testAddReservation(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let date = dateFormatter.date(from: "01/01/01")
        
        let customer = customerService.addCustomer(name: "John Smith")
        let hotel = hotelService.addHotel(name: "Sheraton", location: "Dallas")
        let (reservation, _) = reservationService.addReservation(customer: customer, hotel: hotel, date: date! as NSDate, noOfDays: 1, confirmed: true)
        
        XCTAssertNotNil(reservation, "Reservation cannot be nil")
        XCTAssertTrue(reservation?.customer?.name == "John Smith")
        XCTAssertTrue((reservation!.confirmed))
        
    }
    
    func testHotelNil(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let date = dateFormatter.date(from: "01/01/01")
        
        let customer = customerService.addCustomer(name: "John Henry")
        let (reservation, _) = reservationService.addReservation(customer: customer, hotel: nil, date: date! as NSDate, noOfDays: 1, confirmed: true)
        
        XCTAssertNil(reservation, "Reservation must be nil")
        //XCTAssertTrue(reservation?.customer?.name == "John Henry")
        //XCTAssertTrue((reservation!.confirmed))
        
    }
    
    func testCustomerNil(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let date = dateFormatter.date(from: "01/01/01")
        
        let hotel = hotelService.addHotel(name: "Hilton", location: "New York")
        let (reservation, _) = reservationService.addReservation(customer: nil, hotel: hotel, date: date! as NSDate, noOfDays: 2, confirmed: true)
        
        XCTAssertNil(reservation, "Reservation must be nil")
        //XCTAssertTrue(reservation?.hotel?.name == "Hilton")
        //XCTAssertTrue((reservation!.confirmed))
        
    }
    
    func testReservationNegativeNoOfDays(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let date = dateFormatter.date(from: "01/01/01")
        let customer = customerService.addCustomer(name: "John Henry")
        let hotel = hotelService.addHotel(name: "Hilton", location: "New York")
        let result = reservationService.addReservation(customer: customer, hotel: hotel, date: date! as NSDate, noOfDays: -1, confirmed: true)
        XCTAssertNil(result.reservation, "Reservation should  be nil")
        
        XCTAssertTrue(result.error?.userInfo["Problem"] as? String
            == "Invalid number of days", "Error problem should be present")
        
        
    }
    
    
}


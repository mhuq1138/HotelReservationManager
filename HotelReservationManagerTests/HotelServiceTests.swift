//
//  HotelServiceTests.swift
//  HotelReservationManagerTests
//
//  Created by Mazharul Huq on 3/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import XCTest
import CoreData
@testable import HotelReservationManager

class HotelServiceTests: XCTestCase {
    
    var hotelService:HotelService!
    var coreDataStack:CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        hotelService = HotelService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
    }
    
    override func tearDown() {
        
        super.tearDown()
        self.coreDataStack = nil
        self.hotelService = nil
    }
    
    func testAddHotel(){
        let hotel = hotelService.addHotel(name: "Sheraton", location: "Dallas")
        
        XCTAssertNotNil(hotel, "Hotel cannot be nil")
        XCTAssertTrue(hotel?.name == "Sheraton")
        XCTAssertTrue(hotel?.location == "Dallas")
        
    }

    
    func testGetHotelWithMatchingName(){
        _ = hotelService.addHotel(name: "Sheraton", location: "Dallas")
        
        let hotel = hotelService.getHotel(name:"Sheraton")
        XCTAssertNotNil(hotel,"A hotel should be returned")
    }
    
    func testGetHotelWithNoMatchingName(){
        _ = hotelService.addHotel(name: "Sheraton", location: "Dallas")
        
        let hotel = hotelService.getHotel(name:"Hilton")
        XCTAssertNil(hotel,"No hotel should be returned")
    }
    
    
}

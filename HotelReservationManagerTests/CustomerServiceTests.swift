//
//  CustomerServiceTests.swift
//  HotelReservationManagerTests
//
//  Created by Mazharul Huq on 3/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import XCTest
import CoreData
@testable import HotelReservationManager

class CustomerServiceTests: XCTestCase {
    
    var customerService:CustomerService!
    var coreDataStack:CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        customerService = CustomerService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
    }
    
    override func tearDown() {
        super.tearDown()
        self.coreDataStack = nil
        self.customerService = nil
    }
    
    func testAddCustomer(){
        let customer = customerService.addCustomer(name: "John King")
        
        XCTAssertNotNil(customer, "Customer cannot be nil")
        XCTAssertTrue(customer?.name == "John King")
        
    }
    
    func testRootContextIsSavedAfterAddingCustomer(){
        
        //1
        let derivedContext = coreDataStack.newDerivedContext()
        customerService = CustomerService(
            managedObjectContext: derivedContext,
            coreDataStack: coreDataStack)
        //2
        expectation(
            forNotification: .NSManagedObjectContextDidSave,
            object: coreDataStack.mainContext) {
                notification in
                return true
        }
        //3
        derivedContext.perform {
            let customer = self.customerService.addCustomer(name: "Mary Jane")
            XCTAssertNotNil(customer, "Customer cannot be nil")
            
        }

        //4
        waitForExpectations(timeout: 2.0) { error in
            XCTAssertNil(error, "Save did not occur")
        }
        
    }
}

//
//  CustomerService.swift
//  HotelReservationManager
//
//  Created by Mazharul Huq on 3/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import Foundation
import CoreData

final class CustomerService{
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
    
    func addCustomer(name:String)-> Customer?{
        let customer = Customer(context: self.managedObjectContext)
        customer.name = name
        self.coreDataStack.saveContext(self.managedObjectContext)
        return customer
    }
    
}

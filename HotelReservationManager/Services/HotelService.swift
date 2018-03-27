//
//  HotelService.swift
//  HotelReservationManager
//
//  Created by Mazharul Huq on 3/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class HotelService{
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
    
    func addHotel(name:String, location:String)-> Hotel?{
        let hotel = Hotel(context: self.managedObjectContext)
        hotel.name = name
        hotel.location = location
        self.coreDataStack.saveContext(self.managedObjectContext)
        return hotel
    }
    
    func getHotel(name:String)-> Hotel?{
        let fetchRequest: NSFetchRequest<Hotel> = Hotel.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "name == %@",
                                             argumentArray: [name])
        let results: [Hotel]?
        do {
            results = try managedObjectContext.fetch(fetchRequest)
        } catch {
            return nil
        }
        return results?.first
    }
}

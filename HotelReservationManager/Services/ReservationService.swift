//
//  ReservationService.swift
//  HotelReservationManager
//
//  Created by Mazharul Huq on 3/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import Foundation
import CoreData

final class ReservationService {
    
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
    
    func addReservation(customer:Customer?, hotel:Hotel?, date:NSDate,noOfDays:Int16,confirmed:Bool)->(reservation:Reservation?, error:NSError?){
        
        let reservation = Reservation(context: self.managedObjectContext)
        reservation.date = date
        reservation.days = noOfDays
        reservation.confirmed = confirmed
        guard let customerExists = customer else{
            let customerError = NSError(domain: "HotelReservationManager", code: 1, userInfo: ["Problem":"No customer"])
            return (nil,customerError)
        }
        guard let hotelExists = hotel else{
            let hotelError = NSError(domain: "HotelReservationManager", code: 1, userInfo: ["Problem":"No hotel"])
            return (nil,hotelError)
        }
        guard noOfDays > 0 else{
            
            let daysError = NSError(domain: "HotelReservationManager", code: 1, userInfo: ["Problem":"Invalid number of days"])
            return (nil,daysError)
        }
        
        reservation.hotel = hotelExists
        reservation.customer = customerExists
        coreDataStack.saveContext(self.managedObjectContext)
        return (reservation,nil)
    }
}


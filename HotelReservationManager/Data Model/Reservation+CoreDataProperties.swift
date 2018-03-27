//
//  Reservation+CoreDataProperties.swift
//  HotelReservationManager
//
//  Created by Mazharul Huq on 3/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//
//

import Foundation
import CoreData


extension Reservation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reservation> {
        return NSFetchRequest<Reservation>(entityName: "Reservation")
    }

    @NSManaged public var confirmed: Bool
    @NSManaged public var date: NSDate?
    @NSManaged public var days: Int16
    @NSManaged public var customer: Customer?
    @NSManaged public var hotel: Hotel?

}

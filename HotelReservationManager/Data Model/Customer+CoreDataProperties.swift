//
//  Customer+CoreDataProperties.swift
//  HotelReservationManager
//
//  Created by Mazharul Huq on 3/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var name: String?
    @NSManaged public var reservations: NSSet?

}

// MARK: Generated accessors for reservations
extension Customer {

    @objc(addReservationsObject:)
    @NSManaged public func addToReservations(_ value: Reservation)

    @objc(removeReservationsObject:)
    @NSManaged public func removeFromReservations(_ value: Reservation)

    @objc(addReservations:)
    @NSManaged public func addToReservations(_ values: NSSet)

    @objc(removeReservations:)
    @NSManaged public func removeFromReservations(_ values: NSSet)

}

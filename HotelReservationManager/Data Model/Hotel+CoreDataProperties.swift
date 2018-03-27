//
//  Hotel+CoreDataProperties.swift
//  HotelReservationManager
//
//  Created by Mazharul Huq on 3/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//
//

import Foundation
import CoreData


extension Hotel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hotel> {
        return NSFetchRequest<Hotel>(entityName: "Hotel")
    }

    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var reservations: NSSet?

}

// MARK: Generated accessors for reservations
extension Hotel {

    @objc(addReservationsObject:)
    @NSManaged public func addToReservations(_ value: Reservation)

    @objc(removeReservationsObject:)
    @NSManaged public func removeFromReservations(_ value: Reservation)

    @objc(addReservations:)
    @NSManaged public func addToReservations(_ values: NSSet)

    @objc(removeReservations:)
    @NSManaged public func removeFromReservations(_ values: NSSet)

}

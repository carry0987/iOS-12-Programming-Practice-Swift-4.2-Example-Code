//
//  UserData+CoreDataProperties.swift
//  Design_CoreData
//
//  Created by KoKang Chu on 2017/7/24.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var cname: String?
    @NSManaged public var iid: String?
    @NSManaged public var image: NSData?
    @NSManaged public var own: NSSet?

}

// MARK: Generated accessors for own
extension UserData {

    @objc(addOwnObject:)
    @NSManaged public func addToOwn(_ value: Car)

    @objc(removeOwnObject:)
    @NSManaged public func removeFromOwn(_ value: Car)

    @objc(addOwn:)
    @NSManaged public func addToOwn(_ values: NSSet)

    @objc(removeOwn:)
    @NSManaged public func removeFromOwn(_ values: NSSet)

}

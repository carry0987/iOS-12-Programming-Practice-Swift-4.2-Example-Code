//
//  Car+CoreDataProperties.swift
//  Design_CoreData
//
//  Created by KoKang Chu on 2017/7/24.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var plate: String?
    @NSManaged public var belongto: UserData?

}

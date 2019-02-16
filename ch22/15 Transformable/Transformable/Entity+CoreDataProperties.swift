//
//  Entity+CoreDataProperties.swift
//  Transformable
//
//  Created by ChuKoKang on 2016/8/3.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import Foundation
import CoreData

extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity");
    }

    @NSManaged public var photoObject: NSObject?

}

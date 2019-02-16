//
//  PhotoTransformer.swift
//  Transformable
//
//  Created by ChuKoKang on 2016/8/3.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class PhotoTransformer: ValueTransformer {
    // 將自訂類別（型態）轉成 Data
    override func transformedValue(_ value: Any?) -> Any? {
        if let value = value {
            return NSKeyedArchiver.archivedData(withRootObject: value)
        }
        
        return nil
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        if let value = value {
            return NSKeyedUnarchiver.unarchiveObject(with: value as! Data)
        }
        
        return nil
    }
}

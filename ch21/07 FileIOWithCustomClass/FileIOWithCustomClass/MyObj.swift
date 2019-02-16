//
//  MyObj.swift
//  FileIOWithCustomClass
//
//  Created by ChuKoKang on 2016/7/19.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class MyObj: NSObject, NSCoding {
    var image: UIImage
    var text: String?
    
    init(image: UIImage, text: String?) {
        self.image = image
        self.text = text
    }

    // 編碼
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "text")
        aCoder.encode(UIImagePNGRepresentation(image), forKey: "image")
    }

    // 解碼
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "text") as? String
        let data = aDecoder.decodeObject(forKey: "image") as! Data
        image = UIImage(data: data)!
    }
}

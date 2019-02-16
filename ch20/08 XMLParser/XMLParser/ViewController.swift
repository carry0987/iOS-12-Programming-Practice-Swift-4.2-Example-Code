//
//  ViewController.swift
//  XMLParser
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {

    var tagName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = Bundle.main.url(forResource: "test", withExtension: "xml")
        if let xml = XMLParser(contentsOf: url!) {
            xml.delegate = self
            xml.parse()
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        tagName = nil
        
        switch elementName {
        case "student":
            /* 印出
             begin_year: 2016
             end_year: 2020
             */

            for key in attributeDict.keys {
                let value = attributeDict[key]
                print("\(key): \(value!)")
            }
            
        default:
            tagName = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard tagName != nil else {
            return
        }
        
        /* 印出
         id: A01
         name: John
         tel: 1234567
        */
        print("\(tagName!): \(string)")
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        tagName = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


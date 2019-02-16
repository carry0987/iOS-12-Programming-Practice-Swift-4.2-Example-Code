//
//  ViewController.swift
//  KVO
//
//  Created by KoKang Chu on 2017/7/18.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @objc dynamic var str = ""
    let observer = ObserverObject()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addObserver(observer, forKeyPath: "str", options: .new, context: nil)
        
        str = "hello"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


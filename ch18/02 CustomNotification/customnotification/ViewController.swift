//
//  ViewController.swift
//  CustomNotification
//
//  Created by KoKang Chu on 2017/7/18.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @objc let myObj = MyObj()
    var n = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(
            myObj,
            selector: #selector(MyObj.receiveNotification(_:)),
            name: NSNotification.Name("MYKEY"),
            object: nil
        )
    }

    @IBAction func onClick(_ sender: Any) {
        NotificationCenter.default.post(
            name: NSNotification.Name("MYKEY"),
            object: NSNumber(value: n)
        )
        n = n + 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


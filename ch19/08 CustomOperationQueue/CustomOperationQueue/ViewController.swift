//
//  ViewController.swift
//  CustomOperationQueue
//
//  Created by ChuKoKang on 2016/7/6.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let op1 = MyOperation(from: 1, to: 5)
        let op2 = MyOperation(from: 6, to: 10)
        
        OperationQueue().addOperations([op1, op2], waitUntilFinished: true)
        
        print("done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Delegate
//
//  Created by ChuKoKang on 2016/7/17.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyObjectDelegate {

    let myObj = MyObject()
    
    func returnAnswer(object: MyObject, answer: Float) {
        print(answer)
    }

    func returnError(error: NSError?) {
        if let error = error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myObj.delegate = self
        myObj.divide(5, by: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


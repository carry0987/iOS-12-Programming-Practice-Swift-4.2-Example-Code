//
//  ViewController.swift
//  Stepper
//
//  Created by KoKang Chu on 2017/6/23.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func stepper(_ sender: UIStepper) {
        print(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


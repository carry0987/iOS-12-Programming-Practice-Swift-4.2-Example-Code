//
//  ViewController.swift
//  Toolbar
//
//  Created by KoKang Chu on 2017/6/23.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionButtonClick(_ sender: Any) {
        print("按下動作按鈕")
    }
    
    @IBAction func trashButtonClick(_ sender: Any) {
        print("按下垃圾桶按鈕")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


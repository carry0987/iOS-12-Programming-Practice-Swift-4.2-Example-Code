//
//  ViewController.swift
//  Activity
//
//  Created by KoKang Chu on 2017/6/22.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender.isOn {
            activity.startAnimating()
        } else {
            activity.stopAnimating()
        }
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


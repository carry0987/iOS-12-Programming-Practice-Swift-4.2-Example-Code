//
//  ViewController.swift
//  Safari
//
//  Created by KoKang Chu on 2017/6/15.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onClick(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.apple.com")!)
        show(vc, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


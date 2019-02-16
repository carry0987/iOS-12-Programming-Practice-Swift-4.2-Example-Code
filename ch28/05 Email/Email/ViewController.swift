//
//  ViewController.swift
//  Email
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let to = "to@emai.com"
        let cc = "cc@email.com"
        let bcc = "bcc@email.com"
        let subject = "信件主旨"

        let mail = "mailto:\(to)?subject=\(subject)&cc=\(cc)&bcc=\(bcc)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let url = URL(string: mail!)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//
//  ViewController.swift
//  ActivityController
//
//  Created by KoKang Chu on 2017/9/5.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onClick(_ sender: Any) {
        let string = "hello"
        let image = UIImage(named: "IMG_8800.jpg")
        
        let vc = UIActivityViewController(
            activityItems: [string, image!],
            applicationActivities: nil
        )
        present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


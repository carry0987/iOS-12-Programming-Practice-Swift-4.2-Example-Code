//
//  ViewController.swift
//  CountDown
//
//  Created by KoKang Chu on 2017/6/27.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onClick(_ sender: Any) {
        var second = datePicker.countDownDuration
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            print("剩餘 \(second) 秒")
            second = second - 1
            
            if second < 0 {
                timer.invalidate()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


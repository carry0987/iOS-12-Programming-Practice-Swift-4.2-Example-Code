//
//  ViewController.swift
//  Touch
//
//  Created by KoKang Chu on 2017/7/30.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchToggle(_ sender: UISwitch) {
        if let device = AVCaptureDevice.default(for: .video) {
            // device 為後置廣角鏡頭
            if device.hasTorch {
                // 確認後置廣角鏡頭支援火炬功能
                do {
                    // 控制 LED 亮滅
                    try device.lockForConfiguration()
                    if sender.isOn {
                        device.torchMode = .on
                    } else {
                        device.torchMode = .off
                    }
                    device.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


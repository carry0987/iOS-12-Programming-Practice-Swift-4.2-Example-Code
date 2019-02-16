//
//  ViewController.swift
//  Notify
//
//  Created by KoKang Chu on 2017/7/18.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(receiveNotification(_:)),
            name: .UIDeviceOrientationDidChange,
            object: nil
        )
    }
    
    @objc func receiveNotification(_ notificaton: Notification) {
        let device = UIDevice.current
        switch device.orientation {
        case .faceUp:
            print("手機面朝上")
            break
            
        case .faceDown:
            print("手機面朝下")
            break
            
        case .portraitUpsideDown:
            print("手機上下顛倒時，取消訊息通知")
            NotificationCenter.default.removeObserver(
                self,
                name: .UIDeviceOrientationDidChange,
                object: nil
            )
            break
            
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


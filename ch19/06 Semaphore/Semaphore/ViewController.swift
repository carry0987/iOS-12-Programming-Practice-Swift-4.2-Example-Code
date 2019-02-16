//
//  ViewController.swift
//  Semaphore
//
//  Created by ChuKoKang on 2016/7/6.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DispatchQueue.global().async { 
            for i in 1 ... 10 {
                // 建立信號燈
                let semaphore = DispatchSemaphore(value: 0)
                if i == 3 {
                    DispatchQueue.main.async(execute: {
                        self.showAlert(semaphore: semaphore)
                    })
                } else {
                    // 產生放行信號
                    semaphore.signal()
                }

                // 等待放行信號
                _ = semaphore.wait(timeout: DispatchTime.distantFuture)

                print(i)
                sleep(1)
            }
        }
    }

    func showAlert(semaphore: DispatchSemaphore) {
        let alert = UIAlertController(title: "警告", message: "按確定繼續", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確定", style: .default) { (action) in
            // 產生放行信號
            semaphore.signal()
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        DispatchQueue.global().async {
//            for i in 1 ... 10 {
//                if i == 3 {
//                    DispatchQueue.main.async(execute: {
//                        self.showAlert()
//                    })
//                }
//                
//                print(i)
//                sleep(1)
//            }
//        }
//    }
//
//    func showAlert() {
//        let alert = UIAlertController(title: "警告", message: "按確定繼續", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "確定", style: .default) { (action) in
//            self.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Alert
//
//  Created by KoKang Chu on 2017/7/9.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        // 有 .alert 與 .actionSheet 兩種風格
        let alertController = UIAlertController(
            title: "標題",
            message: "Action Sheet 風格",
            preferredStyle: .actionSheet)
        
        // 宣告一個「確定」按鈕
        let okAction = UIAlertAction(title: "確定", style: .default)
        { (action) in
            // 按鈕按下去後要做的事情寫在這
        }
        
        // 將確定按鈕加到UIAlertController
        alertController.addAction(okAction)
        
        // 設定 popover
        alertController.modalPresentationStyle = .popover
        let pop = alertController.popoverPresentationController
        pop?.sourceView = sender
        pop?.sourceRect = sender.bounds
        
        // 顯示訊息框
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 有 .alert 與 .actionSheet 兩種風格
        let alertController = UIAlertController(
            title: "標題",
            message: "Alert 風格",
            preferredStyle: .alert)
        
        // 宣告一個「確定」按鈕
        let okAction = UIAlertAction(title: "確定", style: .default)
        { (action) in
            // 按鈕按下去後要做的事情寫在這
        }
                
        // 將確定按鈕加到UIAlertController
        alertController.addAction(okAction)
        
        // 顯示訊息框
        present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


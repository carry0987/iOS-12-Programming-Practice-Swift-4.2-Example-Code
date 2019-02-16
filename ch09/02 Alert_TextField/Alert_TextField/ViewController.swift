//
//  ViewController.swift
//  Alert_TextField
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alert = UIAlertController(title: "登入", message: "請輸入登入資訊", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        let loginAction = UIAlertAction(title: "登入", style: .default)
        { (action) in
            let uid = alert.textFields![0].text
            let pwd = alert.textFields![1].text
            
            print("帳號: \(uid!)")
            print("密碼: \(pwd!)")
        }
        
        // 產生第一個文字輸入框
        alert.addTextField { (textField) in
            // 顯示淡淡的email字串
            textField.placeholder = "email"
        }
        
        // 產生第二個文字輸入框
        alert.addTextField { (textField) in
            // 顯示淡淡的password字串
            textField.placeholder = "password"
            // 密碼型態
            textField.isSecureTextEntry = true
        }
        
        alert.addAction(cancelAction)
        alert.addAction(loginAction)
        
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


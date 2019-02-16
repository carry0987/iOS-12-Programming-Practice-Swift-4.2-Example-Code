//
//  ViewController.swift
//  CreateButton
//
//  Created by KoKang Chu on 2017/6/22.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .system)
        button.setTitle("按鈕", for: .normal)
        
        // 連結「點下去」的 IBAction 函數
        button.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        
        // 必須先加到「父容器」後才能修改大小與設定 constraint
        view.addSubview(button)
        
        // 將按鈕大小調到適當大小
        button.sizeToFit()
        // 關掉 autoresizing
        button.translatesAutoresizingMaskIntoConstraints = false
        // 用 constraint 設定將按鈕位置改到距離右下角50點
        button
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor, constant: -50)
            .isActive = true
        
        button
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor, constant: -50)
            .isActive = true
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        print("hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


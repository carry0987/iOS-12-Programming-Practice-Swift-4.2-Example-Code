//
//  ViewController.swift
//  ProgramConstraint
//
//  Created by KoKang Chu on 2017/7/11.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        // 設定 label 高度
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        // 設定 label 的「左」「上」「右」這三個 constraint
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


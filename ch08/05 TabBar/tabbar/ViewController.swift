//
//  ViewController.swift
//  TabBar
//
//  Created by KoKang Chu on 2017/2/18.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "favorite")
        tabBarController?.viewControllers?.append(vc!)

        vc?.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc?.tabBarItem.title = "我的最愛"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


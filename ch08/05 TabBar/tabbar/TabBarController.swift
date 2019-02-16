//
//  TabBarController.swift
//  TabBar
//
//  Created by KoKang Chu on 2017/2/24.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        selectedIndex == 0
        if viewController == viewControllers?[0] {
            print("第一個標籤頁")
        }
            
        else if viewController == viewControllers?[1] {
            print("第二個標籤頁")
        }
    }
    
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    
//    
//        if viewController == viewControllers?[0] {
//            print("item1")
//        }
//            
//        else if viewController.restorationIdentifier == "item2" {
//            print("item2")
//        }
//            
//        else if viewController.restorationIdentifier == "item3" {
//            print("item3")
//        }
//            
//        else if viewController.restorationIdentifier == "item4" {
//            print("item4")
//        }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

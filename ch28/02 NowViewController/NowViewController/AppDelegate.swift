//
//  AppDelegate.swift
//  NowViewController
//
//  Created by KoKang Chu on 2017/7/30.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func findViewController() -> UIViewController? {
        guard let window = window else {
            return nil
        }
        
        guard var lastVC = window.rootViewController else {
            return nil
        }
        
        while (lastVC.presentedViewController != nil) {
            // 這個迴圈用來找到最後一個視圖控制器
            lastVC = lastVC.presentedViewController!
        }

        if lastVC is UINavigationController {
            return (lastVC as! UINavigationController).topViewController
        }
        
        else if lastVC is UITabBarController {
            return (lastVC as! UITabBarController).selectedViewController
        }
        
        else if lastVC is UISplitViewController {
            // first 為 master
            // last 為 detail
            return (lastVC as! UISplitViewController).viewControllers.last
        }
        
        else {
            return lastVC
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


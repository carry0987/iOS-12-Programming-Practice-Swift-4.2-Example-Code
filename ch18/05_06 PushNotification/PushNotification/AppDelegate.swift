//
//  AppDelegate.swift
//  PushNotification
//
//  Created by ChuKoKang on 2016/7/17.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted == false {
                print("使用者未授權")
            }
        }
        
        center.setNotificationCategories(setCategories())
        center.delegate = self
        
        // 推播通知
        sendNotification()

        return true
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "c1"
        content.title = "推播測試"
        content.body = "Hello"
        content.badge = 3
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "myid", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
    func setCategories() -> Set<UNNotificationCategory> {
        var set = Set<UNNotificationCategory>()
        
        let a1 = UNNotificationAction(
            identifier: "a1",
            title: "按鈕1",
            options: []
        )
        let a2 = UNNotificationAction(
            identifier: "a2",
            title: "按鈕2",
            options: [.foreground]
        )
        let a3 = UNNotificationAction(
            identifier: "a3",
            title: "按鈕3",
            options: [.destructive, .authenticationRequired]
        )
        let a4 = UNTextInputNotificationAction(
            identifier: "a4",
            title: "回覆",
            options: []
        )
        
        let c1 = UNNotificationCategory(
            identifier: "c1",
            actions: [a1, a2, a3, a4],
            intentIdentifiers: [],
            options: []
        )
        
        set.insert(c1)
        
        return set
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping(UNNotificationPresentationOptions) -> Void) {
        
        // 透過 notification.request.identifier 得知是哪個推播
        
        // 若前景也要顯示訊息框，執行以下程式碼即可
        completionHandler([.alert])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.notification.request.content.categoryIdentifier)
        print(response.actionIdentifier)
        if response.actionIdentifier == "a4" {
            // a4 允許使用者可以回覆訊息
            if let r = response as? UNTextInputNotificationResponse {
                print(r.userText)
            }
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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


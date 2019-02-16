//
//  ViewController.swift
//  Calendar
//
//  Created by ChuKoKang on 2016/8/9.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let store = EKEventStore()
        // 請求使用者授權存取行事曆
        store.requestAccess(to: .event, completion: { (granted, error) in
            guard granted else {
                return
            }
            
            // 設定要讀取行事曆中未來24小時的資料
            let startDate = Date()
            let endData = Date().addingTimeInterval(24 * 60 * 60)
            let predicate = store.predicateForEvents(
                withStart: startDate,
                end: endData,
                calendars: nil
            )
            let events = store.events(matching: predicate)
            
            let formatter = DateFormatter()
            
            for event in events {
                // 判斷此事件的起迄時間是否為整天
                if event.isAllDay {
                    formatter.dateFormat = "yyyy/M/d [整天]"
                } else {
                    formatter.dateFormat = "yyyy/M/d H:m"
                }
                
                // 行事曆中的每個事件都可以設定提醒時間，
                // 例如5分鐘前、15分鐘前…等，如果要取得提醒時間，
                // 可以執行以下迴圈。
                if event.hasAlarms {
                    for alarm in event.alarms! {
                        let offset = alarm.relativeOffset
                        let alarmDate = event.startDate.addingTimeInterval(offset)
                        
                        formatter.dateFormat = "yyyy/M/d H:m"
                        print("提醒時間: \(formatter.string(from: alarmDate))")
                    }
                }
                
                print(formatter.string(from: event.startDate) + ":" + event.title)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


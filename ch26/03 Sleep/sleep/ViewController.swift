//
//  ViewController.swift
//  Sleep
//
//  Created by ChuKoKang on 2016/7/20.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    let health = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 確認裝置是否支援HeadthKit
        if HKHealthStore.isHealthDataAvailable() {
            // 設定哪些資料可以寫入Health Store
            let shareTypes = self.dataTypesToShare()
            // 設定哪些資料可以從Health Store讀出
            let readTypes = self.dataTypesToRead()
            
            // 跳出授權畫面請使用者授權
            health.requestAuthorization(toShare: shareTypes, read: readTypes, completion: { (success, error) in
                if success {
                    // 注意這個區段的程式碼已非在主執行緒中執行，如果要將結果顯示到UI元件上，
                    // 務必將程式碼放到主執行緒中
                    print("授權成功")
                    
                    // 寫入「躺在床上時間」
                    var startDate = Date().addingTimeInterval(-8 * 60 * 60)
                    var endDate = startDate
                    self.setData(sleepAnalysis: .inBed, startDate: startDate, endDate: endDate)

                    // 寫入「睡眠時間」
                    startDate = Date().addingTimeInterval(-7 * 60 * 60)
                    endDate = Date().addingTimeInterval(-1 * 60 * 60)
                    self.setData(sleepAnalysis: .asleep, startDate: startDate, endDate: endDate)

                    // 寫入「起床時間」
                    self.setData(sleepAnalysis: .awake, startDate: Date(), endDate: Date())

                    // 查詢資料
                    self.getSleepInfo()
                    
                } else {
                    print("授權失敗。Error: \(error!)")
                }
            })
        }
    }
    
    func setData(sleepAnalysis: HKCategoryValueSleepAnalysis, startDate: Date, endDate: Date) {
        let type = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)
        
        let sample = HKCategorySample(
            type: type!,
            value: sleepAnalysis.rawValue,
            start: startDate,
            end: endDate
        )
        
        health.save(sample) { (success, error) in
            if success {
                print("寫入成功")
            }
        }
    }
    
    func getSleepInfo() {
        let type = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)
        let query = HKSampleQuery(
            sampleType: type!,
            predicate: nil,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: nil)
        { (query, results, error) in
            // 注意：這個區段的程式碼已經不在主執行緒
            if let results = results {
                
                for p in results as! [HKCategorySample] {
                    // 開始時間
                    let startDate = p.startDate.description(with: Locale.current)
                    // 結束時間
                    let endDate = p.endDate.description(with: Locale.current)
                    
                    switch HKCategoryValueSleepAnalysis(rawValue: p.value)! {
                    case .inBed:
                        print("躺在床上時間: \(startDate) ~ \(endDate)")
                        
                    case .asleep:
                        print("睡眠時間: \(startDate) ~ \(endDate)")
                        
                    case .awake:
                        print("起床時間: \(startDate) ~ \(endDate)")
                    }
                }
            }
        }
        
        // 開始查詢
        health.execute(query)
    }

    func dataTypesToShare() -> Set<HKSampleType>? {
        var set = Set<HKSampleType>()
        // 睡眠分析
        set.insert(HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!)
        
        return set
    }

    func dataTypesToRead() -> Set<HKObjectType>? {
        var set = Set<HKObjectType>()
        // 睡眠分析
        set.insert(HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!)
        
        return set
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


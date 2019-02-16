//
//  ViewController.swift
//  HeartRate
//
//  Created by ChuKoKang on 2016/7/20.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    let health = HKHealthStore()
    
    func getPredicate() -> NSPredicate? {
//        // 查詢過去24小時以內的資料
//        let startDate = Date().addingTimeInterval(-24 * 60 * 60)
//        let predicate = HKQuery.predicateForSamples(
//            withStart: startDate,
//            end: Date(),
//            options: []
//        )
//
//        // 查詢特定時段資料
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
//
//        let startDate = formatter.date(from: "2016/2/1 22:0:0")
//        let endDate = formatter.date(from: "2016/2/2 7:0:0")
//        let predicate = HKQuery.predicateForSamples(
//            withStart: startDate,
//            end: endDate,
//            options: []
//        )
//
//        // 查詢心跳大於80的資料
//        let unit = HKUnit.count().unitDivided(by: .minute())
//        let quantity = HKQuantity(unit: unit, doubleValue: 80)
//        let predicate = NSPredicate(format: "%K > %@", HKPredicateKeyPathQuantity, quantity)
//
        // 查詢心跳大於80的資料
        let unit = HKUnit.count().unitDivided(by: .minute())
        let quantity = HKQuantity(unit: unit, doubleValue: 80)
        let predicate = HKQuery.predicateForQuantitySamples(
            with: .greaterThanOrEqualTo,
            quantity: quantity
        )

        return predicate
    }

    // 此函數為自訂函數
    func statisticsQuery() {
        // 心跳單位為 次數/每分鐘
        let unit = HKUnit.count().unitDivided(by: .minute())
        // 設定讀取型態為心跳
        let type = HKQuantityType.quantityType(forIdentifier: .heartRate)
        
        let min = HKStatisticsQuery(
            quantityType: type!,
            quantitySamplePredicate: nil,
            options: .discreteMin)
        { (query, result, error) in
            if error == nil {
                let value = result?.minimumQuantity()?.doubleValue(for: unit)
                print("最小心跳值為: \(value!)")
            }
        }
        
        // 開始查詢
        health.execute(min)
    }
    
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
                    
                    // 寫入三筆心跳資料
                    self.setHeartRate(72)
                    sleep(1)
                    
                    self.setHeartRate(80)
                    sleep(1)

                    self.setHeartRate(76)
                    sleep(1)
                    
                    // 讀取心跳資料
                    self.getHeartRate(completion: { (results) in
                        if let results = results {
                            // 設定心跳單位
                            let unit = HKUnit.count().unitDivided(by: .minute())
                            var value: Double
                            // 利用迴圈將資料讀出
                            for p in results as! [HKQuantitySample] {
                                value = p.quantity.doubleValue(for: unit)
                                print("心跳為: \(value)")
                            }
                        }
                    })
                } else {
                    print("授權失敗。Error: \(error!)")
                }
            })
        }
    }

    func dataTypesToShare() -> Set<HKSampleType>? {
        var set = Set<HKSampleType>()

        // 心跳
        set.insert(HKQuantityType.quantityType(forIdentifier: .heartRate)!)

        return set
    }

    func dataTypesToRead() -> Set<HKObjectType>? {
        var set = Set<HKObjectType>()

        // 心跳
        set.insert(HKQuantityType.quantityType(forIdentifier: .heartRate)!)
        
        return set
    }
    
    func setHeartRate(_ heartRate: Double) {
        // 心跳單位為 次數/每分鐘
        let unit = HKUnit.count().unitDivided(by: .minute())
        // 設定寫入型態為心跳
        let type = HKQuantityType.quantityType(forIdentifier: .heartRate)
        // 將欲寫入的數值與單位合在一起
        let quantity = HKQuantity(unit: unit, doubleValue: heartRate)
        let sample = HKQuantitySample(
            type: type!,
            quantity: quantity,
            start: Date(),
            end: Date()
        )

        health.save(sample) { (success, error) in
            if success {
                print("心跳寫入成功")
            } else {
                print("心跳寫入失敗。Error: \(error!)")
            }
        }
    }
    
    func getHeartRate(completion: @escaping (_ results: [HKSample]?) -> Void) {
        // 設定讀取型態為心跳
        let type = HKQuantityType.quantityType(forIdentifier: .heartRate)
        // 排序方式是將最新資料放在陣列的第一筆
        let sort = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(
            sampleType: type!,
            predicate: nil, // 這裡設定查詢條件
            limit: HKObjectQueryNoLimit,
            sortDescriptors: [sort])
        { (query, results, error) in
            // 注意：這個區段的程式碼已經不在主執行緒
            if error == nil {
                completion(results)
            }
        }
        
        // 開始查詢
        health.execute(query)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


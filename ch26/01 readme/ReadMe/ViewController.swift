//
//  ViewController.swift
//  ReadMe
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
                    self.readDataOfMe()
                } else {
                    print("授權失敗。Error: \(error!)")
                }
            })
        }

    }
    
    func dataTypesToShare() -> Set<HKSampleType>? {
        return nil
    }
    
    func dataTypesToRead() -> Set<HKObjectType>? {
        var set = Set<HKObjectType>()
        // 生日
        set.insert(HKCharacteristicType.characteristicType(forIdentifier: .dateOfBirth)!)
        // 性別
        set.insert(HKCharacteristicType.characteristicType(forIdentifier: .biologicalSex)!)
        // 血型
        set.insert(HKCharacteristicType.characteristicType(forIdentifier: .bloodType)!)
        // 費氏皮膚類型
        set.insert(HKCharacteristicType.characteristicType(forIdentifier: .fitzpatrickSkinType)!)
        // 是否使用輪椅
        set.insert(HKCharacteristicType.characteristicType(forIdentifier: .wheelchairUse)!)

        return set
    }

    func readDataOfMe() {
        // 取得生日資料
        if let dateOfBirth = try? health.dateOfBirthComponents().date {
            let format = DateFormatter()
            format.dateFormat = "yyyy/M/dd"
            print("生日為: \(format.string(from: dateOfBirth!))")
        } else {
            print("讀取生日資料錯誤，請先到健康App填寫資料或授權讀取")
        }
        
        // 取得性別資料
        if let sex = try? health.biologicalSex() {
            switch sex.biologicalSex {
            case .female:
                print("女性")
                
            case .male:
                print("男性")
                
            case .other:
                print("其它")
                
            case .notSet:
                print("未設定")
            }
        } else {
            print("讀取性別資料錯誤。")
        }
        
        // 取得血型資料
        if let bloodType = try? health.bloodType() {
            switch bloodType.bloodType {
            case .abNegative:
                print("AB-")
                
            case .abPositive:
                print("AB+")
                
            case .notSet:
                print("未設定")
                
            default:
                print("其餘血型")
            }
        } else {
            print("讀取血型資料錯誤")
        }
        
        // 取得費氏皮膚類型
        if let skinType = try? health.fitzpatrickSkinType() {
            switch skinType.skinType {
            case .I:
                print("第一型")
                
            case .II:
                print("第二型")
                
            case .notSet:
                print("未設定")
                
            default:
                print("其餘類型")
            }
        } else {
            print("讀取費氏皮膚資料錯誤")
        }
        
        // 取得輪椅設定
        if let wheelchairUse = try? health.wheelchairUse() {
            switch  wheelchairUse.wheelchairUse {
            case .yes:
                print("使用輪椅")
            
            case .no:
                print("不使用輪椅")

            case .notSet:
                print("輪椅未設定")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  CloudKitDemo
//
//  Created by ChuKoKang on 2016/8/1.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    var subsript: CKSubscription? = nil
    let containerID = "iCloud.com.ckk.CloudKitDemo"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var noteText: UITextField!
    
    //////////////////////////////////////////////////////
    // MARK: 異動通知
    @IBAction func subscriptButton(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let subscribe = CKQuerySubscription(
            recordType: "MyNote",
            predicate: predicate,
            options: .firesOnRecordCreation
        )
        
        let note = CKNotificationInfo()
        note.alertBody = "MyNote 新增了一筆資料"
        subscribe.notificationInfo = note
        
        db.save(subscribe)
        { (subscribe, error) in
            if error == nil {
                print("訂閱成功")
            } else {
                print("訂閱失敗: \(error!)")
            }
        }
    }
    
    @IBAction func unsubscriptButton(_ sender: Any) {
        // 需先按 checkButton
        guard subsript != nil else {
            print("無訂閱通知可刪除")
            return
        }
        
        let db = CKContainer.default().publicCloudDatabase
        db.delete(withSubscriptionID: subsript!.subscriptionID)
        { (subscriptionID, error) in
            if error == nil {
                print("刪除訂閱通知成功")
            } else {
                print("刪除訂閱通知失敗: \(error!)")
            }
        }
    }
    
    @IBAction func checksubscriptionButton(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        db.fetchAllSubscriptions { (subscriptions, error) in
            guard error == nil else {
                self.subsript = nil
                print("查詢訂閱狀態失敗: \(error!)")
                return
            }
            
            guard subscriptions!.count > 0 else {
                self.subsript = nil
                print("無訂閱任何類型的通知")
                return
            }
            
            for subscription in subscriptions as! [CKQuerySubscription] {
                if subscription.recordType == "MyNote" {
                    switch subscription.querySubscriptionOptions {
                    case CKQuerySubscriptionOptions.firesOnRecordCreation:
                        self.subsript = subscription
                        print("已經訂閱了新增通知")
                        
                    default:
                        self.subsript = nil
                        print("訂閱了其餘種類的通知")
                    }
                }
            }
        }
    }
    //////////////////////////////////////////////////////

    
    
    //////////////////////////////////////////////////////
    // MARK: 關聯處理
    @IBAction func insertButton_UserData_Car(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        let userRecord = CKRecord(recordType: "UserData")
        // 參數 action 為 .none 表示不設定串接刪除
        // 參數 action 為 .deleteSelf 表示串接刪除
        let ref = CKReference(record: userRecord, action: .none)
        
        userRecord["cname"] = "王大明" as CKRecordValue?
        
        db.save(userRecord) { (record, error) in
            if error == nil {
                print("UserData 資料儲存成功")
            } else {
                print("UserData 資料儲存失敗: \(error!)")
            }
        }
        
        let carRecord1 = CKRecord(recordType: "Car")
        carRecord1["plate"] = "AA-1111" as CKRecordValue?
        carRecord1["belongto"] = ref
        db.save(carRecord1) { (record, error) in
            if error == nil {
                print("第一部車資料儲存成功")
            } else {
                print("第一部車資料儲存失敗: \(error!)")
            }
        }
        
        let carRecord2 = CKRecord(recordType: "Car")
        carRecord2["plate"] = "BB-2222" as CKRecordValue?
        carRecord2["belongto"] = ref
        
        db.save(carRecord2) { (record, error) in
            if error == nil {
                print("第二部車資料儲存成功")
            } else {
                print("第二部車資料儲存失敗: \(error!)")
            }
        }
    }
    
    @IBAction func queryButton_UserData_Car(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        let predicate = NSPredicate(format: "cname = %@", "王大明")
        let query = CKQuery(recordType: "UserData", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        
        // 先查出 Customer 的資料
        operation.recordFetchedBlock = { (record : CKRecord?) in
            guard let record = record else {
                return
            }
            
            let cname = record["cname"]
            print("姓名: \(cname!)")
            
            let ref = CKReference(record: record, action: .none)
            let predicate = NSPredicate(format: "belongto = %@", ref)
            let query = CKQuery(recordType: "Car", predicate: predicate)
            let operation = CKQueryOperation(query: query)
            
            // 再查出 Car 的資料
            operation.recordFetchedBlock = { (record : CKRecord?) in
                guard let record = record else {
                    return
                }
                let plate = record["plate"]
                print("車牌: \(plate!)")
            }
            
            operation.queryCompletionBlock = { (cursor, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                
                print("查詢完成")
            }
            
            db.add(operation)
        }
        
        // 執行
        db.add(operation)
    }
    //////////////////////////////////////////////////////

    
    //////////////////////////////////////////////////////
    // MARK: 刪除與修改資料
    @IBAction func deleteButton(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        let predicate = NSPredicate(format: "iid = %@", "a01")
        let query = CKQuery(recordType: "UserData", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { (record : CKRecord?) in
            guard let record = record else {
                return
            }
            
            db.delete(withRecordID: record.recordID, completionHandler: { (recordID, error) in
                if error == nil {
                    print("資料刪除成功")
                } else {
                    print("資料刪除失敗: \(error!)")
                }
            })
        }
        
        operation.queryCompletionBlock = { (cursor, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            print("查詢完成")
        }
        
        // 執行
        db.add(operation)
    }
    
    @IBAction func modifyButton(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        // 將 a02 的姓名改為李大媽
        let predicate = NSPredicate(format: "iid = %@", "a02")
        let query = CKQuery(recordType: "UserData", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { (record : CKRecord?) in
            guard let record = record else {
                return
            }
            
            record["cname"] = "李大媽" as CKRecordValue?
            let array = [record]
            let modifyOP = CKModifyRecordsOperation(recordsToSave: array,
                                                    recordIDsToDelete: nil)
            
            modifyOP.perRecordCompletionBlock = { (record, error) in
                if error == nil {
                    print("資料修改完成")
                } else {
                    print("資料修改失敗: \(error!)")
                }
            }
            
            db.add(modifyOP)
        }
        
        operation.queryCompletionBlock = { (cursor, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            print("查詢完成")
        }
        
        // 執行
        db.add(operation)
    }
    //////////////////////////////////////////////////////

    
    //////////////////////////////////////////////////////
    // MARK: 二位元資料
    @IBAction func uploadButton(_ sender: Any) {
        let db = CKContainer(identifier: containerID).publicCloudDatabase
        let path = Bundle.main.path(forResource: "sample", ofType: "jpg")
        let url = URL(fileURLWithPath: path!)
        
        let record = CKRecord(recordType: "MyPicture")
        let asset = CKAsset(fileURL: url)
        record["image"] = asset
        
        db.save(record, completionHandler: { (record, error) in
            if error == nil {
                print("圖片上傳成功")
            } else {
                print("圖片上傳失敗")
            }
        })
    }
    
    @IBAction func downloadButton(_ sender: Any) {
        let db = CKContainer(identifier: containerID).publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "MyPicture", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { (record : CKRecord?) in
            // 如果有三筆資料，這個區段會被呼叫三次
            guard let record = record else {
                return
            }
            
            let asset = record["image"] as! CKAsset
            let image = UIImage(contentsOfFile: asset.fileURL.path)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        operation.queryCompletionBlock = { (cursor, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            print("查詢完成")
        }
        
        // 執行
        db.add(operation)
    }
    //////////////////////////////////////////////////////

    
    //////////////////////////////////////////////////////
    // MARK: 新增資料與查詢
    @IBAction func insertButton(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        let record = CKRecord(recordType: "MyNote")
        
        record["note"] = noteText.text as CKRecordValue?
        record["date"] = Date() as CKRecordValue?
        
        db.save(record) { (record, error) in
            if error == nil {
                print("資料儲存成功")
            } else {
                print("資料儲存失敗: \(error!)")
            }
        }
    }
    
    @IBAction func queryButton(_ sender: Any) {
        let db = CKContainer.default().publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "date", ascending: true)
        let query = CKQuery(recordType: "MyNote", predicate: predicate)
        
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { (record : CKRecord?) in
            // 如果有三筆資料，這個區段會被呼叫三次
            guard let record = record else {
                return
            }
            
            // 時間為格林威治時間
            print("日期: \(record["date"]!.description) 記事: \(record["note"]!)")
        }
        
        operation.queryCompletionBlock = { (cursor, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            print("查詢完成")
        }
        
        // 執行
        db.add(operation)
    }
    //////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 使用預設的 container
        let c = CKContainer.default()
        
        // 要求使用者授權登入 iCloud
        c.requestApplicationPermission(.userDiscoverability)
        { (status, error) in

            switch status {
            case .initialState:
                print("使用者尚未決定是否要授權")
                
            case .granted:
                print("使用者已經授權")
                
                c.fetchUserRecordID(completionHandler: { (recordID, error) in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                    
                    guard recordID != nil else {
                        return
                    }
                    
                    c.discoverUserIdentity(withUserRecordID: recordID!, completionHandler: { (userIdentity, error) in
                        // 這個區段的程式已經不在主執行緒
                        self.getUserInfo(userIdentify: userIdentity, error: error)
                    })
                })
                
            case .denied:
                print("使用者拒絕授權")
                
            case .couldNotComplete:
                print(error!)
            }
        }
    }

    func getUserInfo(userIdentify: CKUserIdentity?, error: Error?) {
        guard error == nil else {
            print(error!)
            return
        }
        
        guard userIdentify != nil else {
            return
        }
        
        let lookupInfo = userIdentify?.lookupInfo
        let nameComponents = userIdentify?.nameComponents
        
        print("email: \(lookupInfo?.emailAddress)")
        print("phone: \(lookupInfo?.phoneNumber)")
        
        print("givenName: \(nameComponents?.givenName)")
        print("familyName: \(nameComponents?.familyName)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


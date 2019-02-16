//
//  ViewController.swift
//  Design_CoreData
//
//  Created by KoKang Chu on 2017/7/24.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewContext = app.persistentContainer.viewContext
        
        // 若在模擬器中執行，可顯示資料實際儲存位置
        print(NSPersistentContainer.defaultDirectoryURL())
        
//        insertUserData()
//        queryUserData()
//        queryWithPredicate()
//        storedFetch()
//        storedFetchWithArgument()
        
//        insert_onetooMany()
//        query_onetooMany()
        
        saveImage()
        loadImage()
    }
    
    func insertUserData() {
        // 插入第一筆資料
        var user = NSEntityDescription.insertNewObject(forEntityName: "UserData",
                                                       into: viewContext) as! UserData
        user.iid = "A01"
        user.cname = "王大明"
        
        // 插入第二筆資料
        user = NSEntityDescription.insertNewObject(forEntityName: "UserData", into:
            viewContext) as! UserData
        user.iid = "A02"
        user.cname = "李大媽"
        
        // 存檔
        app.saveContext()
    }
    
    func queryUserData() {
        do {
            let allUsers = try viewContext.fetch(UserData.fetchRequest())
            for user in allUsers as! [UserData] {
                print("\(user.iid), \(user.cname)")
            }
        } catch {
            print(error)
        }
    }
    
    func queryWithPredicate() {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        // 搜尋所有姓王的使用者
        let predicate = NSPredicate(format: "cname like '王*'")
        fetchRequest.predicate = predicate
        // 搜尋結果按照 iid 做反向排序
        let sort = NSSortDescriptor(key: "iid", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let allUsers = try viewContext.fetch(fetchRequest)
            for user in allUsers {
                print("\(user.iid), \(user.cname)")
            }
        } catch {
            print(error)
        }
    }
    
    func storedFetch() {
        let model = app.persistentContainer.managedObjectModel
        
        if let fetchRequest = model.fetchRequestTemplate(forName:
            "Fetch_iid_is_A01") {
            do {
                let allUsers = try viewContext.fetch(fetchRequest)
                for user in allUsers as! [UserData] {
                    print("\(user.iid), \(user.cname)")
                }
            } catch {
                print(error)
            }
        }
    }
    
    func storedFetchWithArgument() {
        let model = app.persistentContainer.managedObjectModel
        
        if let fetchRequest = model.fetchRequestFromTemplate(
            withName: "Fetch_by_cname",
            substitutionVariables: ["CNAME": "大"]
            )
        {
            do {
                let allUsers = try viewContext.fetch(fetchRequest)
                for user in allUsers as! [UserData] {
                    print("\(user.iid), \(user.cname)")
                }
            } catch {
                print(error)
            }
        }
    }
    
    func deleteUserData_Onebyone() {
        do {
            let allUsers = try viewContext.fetch(UserData.fetchRequest())
            for user in allUsers as! [UserData] {
                viewContext.delete(user)
            }
            app.saveContext()
        } catch {
            print(error)
        }
    }
    
    func deleteUserData_Batch() {
        let batch = NSBatchDeleteRequest(fetchRequest: UserData.fetchRequest())
        
        do {
            try app.persistentContainer.persistentStoreCoordinator.execute(batch, with: viewContext)
        } catch {
            print(error)
        }
    }
    
    func insert_onetooMany() {
        let user = NSEntityDescription.insertNewObject(forEntityName: "UserData",
                                                       into: viewContext) as! UserData
        user.iid = "A03"
        user.cname = "王小毛"
        
        // 第一部車
        var car = NSEntityDescription.insertNewObject(forEntityName: "Car", into:
            viewContext) as! Car
        car.plate = "AA-0001"
        user.addToOwn(car)   // 此 user 為王小毛
        
        // 第二部車
        car = NSEntityDescription.insertNewObject(forEntityName: "Car", into:
            viewContext) as! Car
        car.plate = "BB-0001"
        user.addToOwn(car)   // 此 user 為王小毛
        
        app.saveContext()
    }
    
    func query_onetooMany() {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        let predicate = NSPredicate(format: "iid = 'A03'")
        fetchRequest.predicate = predicate
        
        do {
            let allUsers = try viewContext.fetch(fetchRequest)
            for user in allUsers {
                if user.own == nil {
                    print("\(user.cname) 沒有車")
                } else {
                    print("\(user.cname) 擁有 \(user.own?.count) 部車")
                    
                    for car in user.own as! Set<Car> {
                        print("車牌是 \(car.plate)")
                    }
                }
            }
        } catch {
            print(error)
        }
    }
    
    func saveImage() {
        let user = NSEntityDescription.insertNewObject(forEntityName: "UserData",
                                                       into: viewContext) as! UserData
        user.iid = "A04"
        user.cname = "朱小妹"
        user.image = UIImagePNGRepresentation(UIImage(named: "a04.jpg")!) as NSData?
        app.saveContext()
    }
    
    func loadImage() {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        let predicate = NSPredicate(format: "iid = 'A04'")
        fetchRequest.predicate = predicate
        
        do {
            let allUsers = try viewContext.fetch(fetchRequest)
            for user in allUsers {
                // 轉換成圖片
                let image = UIImage(data: user.image! as Data)
                imageView.image = image
            }
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


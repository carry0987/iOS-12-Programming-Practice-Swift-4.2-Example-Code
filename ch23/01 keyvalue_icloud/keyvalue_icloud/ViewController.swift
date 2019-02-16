//
//  ViewController.swift
//  KeyValue_iCloud
//
//  Created by ChuKoKang on 2016/8/1.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let store = NSUbiquitousKeyValueStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // 儲存資料
    @IBAction func saveButton(_ sender: Any) {
        store.set("Hello", forKey: "MY_KEY")
        if !store.synchronize() {
            print("儲存失敗")
        }
    }

    // 讀取資料
    @IBAction func openButton(_ sender: Any) {
        let string = store.string(forKey: "MY_KEY")
        print(string!)
    }

    // 刪除資料
    @IBAction func deleteButton(_ sender: Any) {
        store.removeObject(forKey: "MY_KEY")
        if !store.synchronize() {
            print("刪除失敗")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


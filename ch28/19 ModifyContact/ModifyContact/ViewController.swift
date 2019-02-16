//
//  ViewController.swift
//  ModifyContact
//
//  Created by ChuKoKang on 2016/8/9.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    @IBAction func addButton(_ sender: Any) {
        let contact = CNMutableContact()
        
        // 姓名
        contact.givenName = "三"
        contact.familyName = "張"
        
        // 家用電子郵件
        let homeEmail = CNLabeledValue(label:CNLabelHome, value: "three@test.com" as NSString)
        contact.emailAddresses = [homeEmail]
        
        // 電話號碼
        let phoneNumber = CNLabeledValue(label: CNLabelPhoneNumberMain, value:
            CNPhoneNumber(stringValue: "(02)12345678"))
        contact.phoneNumbers = [phoneNumber]
        
        // 公司地址
        let address = CNMutablePostalAddress()
        address.city = "台中市"
        address.street = "台灣大道一段1號"
        address.postalCode = "400"
        address.country = "台灣"
        let workAddress = CNLabeledValue<CNPostalAddress>(label: CNLabelWork, value: address)
        contact.postalAddresses = [workAddress]
        
        // 儲存新建立的聯絡人
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        try! store.execute(saveRequest)
    }
    
    @IBAction func queryButton(_ sender: Any) {
        let store = CNContactStore()
        // 尋找所有姓張的資料
        let predicate = CNContact.predicateForContacts(matchingName: "張")
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey]
        
        do {
            let contacts = try store.unifiedContacts(
                matching: predicate,
                keysToFetch: keysToFetch as [CNKeyDescriptor]
            )
            
            if contacts.count > 0 {
                for contact in contacts {
                    print(contact.familyName + contact.givenName)
                }
            } else {
                print("查無資料")
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func modifyButton(_ sender: Any) {
        let store = CNContactStore()
        // 尋找張三
        let predicate = CNContact.predicateForContacts(matchingName: "張三")
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey]
        
        do {
            
            let contacts = try store.unifiedContacts(
                matching: predicate,
                keysToFetch: keysToFetch as [CNKeyDescriptor]
            )
            
            // 假設只有一筆資料符合
            if contacts.count == 1 {
                let mutableContact = contacts[0].mutableCopy() as! CNMutableContact
                // 將張三改為李四
                mutableContact.givenName = "四"
                mutableContact.familyName = "李"
                
                // 存檔
                let saveRequest = CNSaveRequest()
                saveRequest.update(mutableContact)
                try store.execute(saveRequest)
            }
        } catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


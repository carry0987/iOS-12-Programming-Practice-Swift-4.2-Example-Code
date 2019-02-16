//
//  ViewController.swift
//  Contact
//
//  Created by ChuKoKang on 2016/8/9.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    @IBOutlet weak var headImage: UIImageView!
    let contactVC = CNContactPickerViewController()

    @IBAction func onClick(_ sender: AnyObject) {
        show(contactVC, sender: self)
    }

    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        let contact = contactProperty.contact;
        
        let givenName = contact.givenName;
        let familyName = contact.familyName;
        
        // 印出姓名
        print(familyName + givenName)
        // 顯示大頭照
        if contact.imageDataAvailable {
            headImage.image = UIImage(data: contact.imageData!)
        }
        
        // 以下各判斷為印出使用者點選的項目內容
        if contactProperty.key == CNContactPhoneNumbersKey {
            let phoneNumber = (contactProperty.value as! CNPhoneNumber).stringValue
            print("電話: \(phoneNumber)")
        }
            
        else if contactProperty.key == CNContactEmailAddressesKey {
            let string = contactProperty.value as! NSString
            print("信箱: \(string)")
        }
            
        else if contactProperty.key == CNContactUrlAddressesKey {
            let string = contactProperty.value as! NSString
            print("網址: \(string)")
        }
            
        else if contactProperty.key == CNContactPostalAddressesKey {
            let postalAddress = contactProperty.value as! CNPostalAddress
            let postalString = CNPostalAddressFormatter.string(from: postalAddress, style: .mailingAddress)
            print("地址: \(postalString)")
            
            // 也可以將地址的各個部分拆開使用
            // print("地址: \(postAddress.city + postAddress.street)")
        }
    }
 
/*
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        if contact.isKeyAvailable(CNContactPhoneNumbersKey) {
            for phoneNumber in contact.phoneNumbers {
                print(phoneNumber.value.stringValue)
            }
        }
        
        if contact.isKeyAvailable(CNContactEmailAddressesKey) {
            for email in contact.emailAddresses {
                print(email.value)
            }
        }
    }
*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        contactVC.displayedPropertyKeys = [
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey
        ]
        
        contactVC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


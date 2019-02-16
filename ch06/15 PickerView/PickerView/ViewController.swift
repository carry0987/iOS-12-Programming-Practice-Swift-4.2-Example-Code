//
//  ViewController.swift
//  PickerView
//
//  Created by KoKang Chu on 2017/6/27.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let fromList = ["台北松山", "桃園", "台中清泉崗", "高雄小港"]
    let toList = ["上海浦東", "香港赤臘角", "日本成田", "韓國仁川"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 0 代表最左邊的滾輪
        if component == 0 {
            return fromList.count
        }
            
        else if component == 1 {
            return toList.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return fromList[row]
        }
            
        else if component == 1{
            return toList[row]
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print("出發地：\(fromList[row])")
        }
            
        else if component == 1 {
            print("目的地：\(toList[row])")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


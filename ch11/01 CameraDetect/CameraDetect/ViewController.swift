//
//  ViewController.swift
//  CameraDetect
//
//  Created by ChuKoKang on 2016/7/23.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("本裝置具拍照功能")
            
            if UIImagePickerController.isCameraDeviceAvailable(.front) {
                print("有前方鏡頭")
            }
            
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                print("有後方鏡頭")
            }
            
            if UIImagePickerController.isFlashAvailable(for: .front) {
                print("有前方閃光燈")
            }
            
            if UIImagePickerController.isFlashAvailable(for: .rear) {
                print("有後方閃光燈")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


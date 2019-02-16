//
//  ViewController.swift
//  Barcode
//
//  Created by KoKang Chu on 2017/7/30.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var forPreview: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    // 負責處理輸入裝置->輸出間的資料流動
    let session = AVCaptureSession()
    // 負責設定好輸入端擷取裝置
    let deviceInput = DeviceInput()

    func settingPreviewLayer() {
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = forPreview.bounds
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
        forPreview.layer.addSublayer(previewLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 設定預覽圖層 - 此為自訂函數
        settingPreviewLayer()
        
        // 將後置廣角鏡頭連接到協調器
        session.addInput(deviceInput.backWildAngleCamera!)

        // 設定輸出端為 meta 資料（e.g., 條碼內容）
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        // 接受所有可辨識的meta資料
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.global())
        
        // 讓資料開始流入
        session.startRunning()
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        for metaData in metadataObjects {
            if let data = metaData as? AVMetadataMachineReadableCodeObject {
                DispatchQueue.main.async {
                    // 條碼內容
                    self.codeLabel.text = data.stringValue
                    // 條碼型態
                    self.typeLabel.text = data.type.rawValue
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


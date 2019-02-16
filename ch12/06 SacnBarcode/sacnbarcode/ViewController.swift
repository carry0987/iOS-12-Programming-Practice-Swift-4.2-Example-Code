//
//  ViewController.swift
//  SacnBarcode
//
//  Created by ChuKoKang on 2016/8/21.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    // 負責協調從截取裝置到輸出間的資料流動
    let session = AVCaptureSession()
    // 負責即時預覽目前相機設備截取到的畫面
    let captureVideoPreviewLayer = AVCaptureVideoPreviewLayer()

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var labelType: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得預設的相機裝置（後鏡頭）
        let device = AVCaptureDevice.default(for: .video)
        do {
            // 設定資料來源為後鏡頭相機
            let videoInput = try AVCaptureDeviceInput(device: device!)
            session.addInput(videoInput)
            
            // 設定資料輸出為所攝取影像的meta資料（e.g., 條碼內容）
            let videoOutput = AVCaptureMetadataOutput()
            session.addOutput(videoOutput)
            
            // 接受所有可辨識的meta資料
            videoOutput.metadataObjectTypes = videoOutput.availableMetadataObjectTypes
            videoOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)

            // 設定預覽畫面
            captureVideoPreviewLayer.session = session
            captureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            myView.layer.addSublayer(captureVideoPreviewLayer)
            
        } catch {
            print(error)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        captureVideoPreviewLayer.frame = myView.bounds
    }

    @IBAction func startButton(_ sender: Any) {
        session.startRunning()
    }

    @IBAction func stopButton(_ sender: Any) {
        session.stopRunning()
    }
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metaData in metadataObjects {
            if let data = metaData as? AVMetadataMachineReadableCodeObject {
                // 條碼內容
                labelCode.text = data.stringValue
                // 條碼型態
                labelType.text = data.type.rawValue
            } else {
                print("error")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


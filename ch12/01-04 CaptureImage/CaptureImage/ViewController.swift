//
//  ViewController.swift
//  CaptureImage
//
//  Created by KoKang Chu on 2017/7/29.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate, AVCaptureFileOutputRecordingDelegate {

    @IBOutlet weak var forPreview: UIView!
    // 負責處理輸入裝置->輸出間的資料流動
    let session = AVCaptureSession()
    // 負責設定好輸入端擷取裝置
    let deviceInput = DeviceInput()

    @IBAction func frontBackToggle(_ sender: UISwitch) {
        
        // 修改 session 開始
        session.beginConfiguration()

        // 將現有的 input 刪除
        session.removeInput(session.inputs.last!)
        if sender.isOn {
            // 後置鏡頭
            session.addInput(deviceInput.backWildAngleCamera!)
        } else {
            // 前置鏡頭
            session.addInput(deviceInput.frontWildAngleCamera!)
        }
        
        // 確認修改
        session.commitConfiguration()
    }
    
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
        
        // 拍照用
//        takePhotoMode()
        // 錄影用
        recordVideoMode()
        
        // 讓資料開始流入
        session.startRunning()
    }
    
    func takePhotoMode() {
        // 將後置廣角鏡頭連接到協調器
        session.addInput(deviceInput.backWildAngleCamera!)
        
        // 設定輸出品質為最高解析度
        session.sessionPreset = .photo
        // 設定輸出端格式為照片
        session.addOutput(AVCapturePhotoOutput())
    }
    
    func recordVideoMode() {
        // 將麥克風連結到協調器
        session.addInput(deviceInput.microphone!)
        // 將後置廣角鏡頭連接到協調器
        session.addInput(deviceInput.backWildAngleCamera!)
        
        // 錄影品質為 1280x720
        session.sessionPreset = .hd1280x720
        // 設定輸出端為 QuickTime 影片
        session.addOutput(AVCaptureMovieFileOutput())
    }
    
    //////////////////////////////////////////////////////
    // 拍照
    @IBAction func takeButton(_ sender: Any) {
        let setting = AVCapturePhotoSettings()
        setting.flashMode = .on
        
        let output = session.outputs.first! as! AVCapturePhotoOutput
        output.capturePhoto(with: setting, delegate: self)
    }
    
    @available(iOS 11.0, *)
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let image = UIImage(data: photo.fileDataRepresentation()!)
        // 照片存檔
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    /*
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(
            forJPEGSampleBuffer: photoSampleBuffer!,
            previewPhotoSampleBuffer: previewPhotoSampleBuffer
        )
        
        let image = UIImage(data: imageData!)
        
        // 圖片存檔
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
     */
    // 拍照
    //////////////////////////////////////////////////////
    
    
    //////////////////////////////////////////////////////
    // 錄影

    // 開始錄影按鈕
    @IBAction func recordButton(_ sender: Any) {
        // 影片暫存路徑為 tmp/output.mov
        let url = URL(fileURLWithPath: NSTemporaryDirectory() + "output.mov")
        // 開始錄影
        let output = session.outputs.first! as! AVCaptureMovieFileOutput
        output.startRecording(to: url, recordingDelegate: self)
    }

    // 停止錄影按鈕
    @IBAction func stopRecordButton(_ sender: Any) {
        let output = session.outputs.first! as! AVCaptureMovieFileOutput
        output.stopRecording()
    }

    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(outputFileURL.path) {
            UISaveVideoAtPathToSavedPhotosAlbum(
                outputFileURL.path,
                self,
                #selector(completion(_:error:contextInfo:)),
                nil
            )
        }
    }

    @objc func completion(_ videoPath: String, error: Error?, contextInfo: Any?) {
        // 影片存檔完成後刪除暫存檔
        do {
            let fm = FileManager.default
            try fm.removeItem(atPath: videoPath)
        } catch {
            print(error)
        }
    }
    // 錄影
    //////////////////////////////////////////////////////

    
    @IBAction func cameraSetting(_ sender: Any) {
        cameraSetting()
    }
    
    func cameraSetting() {
        let input = session.inputs.last as! AVCaptureDeviceInput
        if input.device.deviceType == .builtInMicrophone {
            // 如果裝置是麥克風就離開
            return
        }
        
        do {
            let camera = input.device
            try camera.lockForConfiguration()

            // 設定測光位置位於螢幕中央
            // 左上角為 (0, 0)，右下角為 (1, 1)
            if camera.isExposureModeSupported(.continuousAutoExposure) {
                camera.exposurePointOfInterest = CGPoint(x: 0.5, y: 0.5)
                camera.exposureMode = .continuousAutoExposure
            }
            
            // 設定螢幕中央對焦點，並採連續對焦模式
            // 左上角為 (0, 0)，右下角為 (1, 1)
            if camera.isFocusModeSupported(.continuousAutoFocus) {
                camera.focusPointOfInterest = CGPoint(x: 0.5, y: 0.5)
                camera.focusMode = .continuousAutoFocus
            }
            
            // 設定對焦距離: 0.0 為最短距離，1.0 為無限遠（預設值）
            // 此設定與 .continuousAutoFocus 效果互斥
            // camera.setFocusModeLockedWithLensPosition(0, completionHandler: nil)
            
            // 設定快門1/30秒與ISO 200
            camera.setExposureModeCustom(
                duration: CMTime(value: 1, timescale: 30),
                iso: 200,
                completionHandler: nil
            )
            
            // 修改完 unlock
            camera.unlockForConfiguration()
        } catch {
            print(error)
        }
    }    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


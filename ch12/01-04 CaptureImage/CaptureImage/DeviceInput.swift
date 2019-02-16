//
//  DeviceInput.swift
//  CaptureImage
//
//  Created by KoKang Chu on 2017/7/30.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import AVFoundation

class DeviceInput: NSObject {
    // 前置廣角鏡頭
    var frontWildAngleCamera: AVCaptureDeviceInput?
    // 後置廣角鏡頭
    var backWildAngleCamera: AVCaptureDeviceInput?
    // 後置望遠鏡頭
    var backTelephotoCamera: AVCaptureDeviceInput?
    // 後置雙鏡頭
    var backDualCamera: AVCaptureDeviceInput?
    // 麥克風
    var microphone: AVCaptureDeviceInput?
    
    override init() {
        super.init()
        getAllCameras()
        getMicrophone()
    }
    
    private func getAllCameras() {
        // 取得所有鏡頭
        let cameraDevices = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera, .builtInTelephotoCamera, .builtInDualCamera],
            mediaType: .video,
            position: .unspecified).devices
        
        for camera in cameraDevices {
            let inputDevice = try! AVCaptureDeviceInput(device: camera)
            
            if camera.deviceType == .builtInWideAngleCamera, camera.position == .front {
                frontWildAngleCamera = inputDevice
            }
            
            if camera.deviceType == .builtInWideAngleCamera, camera.position == .back {
                backWildAngleCamera = inputDevice
            }
            
            if camera.deviceType == .builtInTelephotoCamera {
                backTelephotoCamera = inputDevice
            }
            
            if camera.deviceType == .builtInDualCamera {
                backDualCamera = inputDevice
            }
        }
    }
    
    private func getMicrophone() {
        // 取得麥克風
        if let mic = AVCaptureDevice.default(for: .audio) {
            microphone = try! AVCaptureDeviceInput(device: mic)
        }
    }

}

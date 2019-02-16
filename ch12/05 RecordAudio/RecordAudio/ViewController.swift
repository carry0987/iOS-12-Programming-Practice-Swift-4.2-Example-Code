//
//  ViewController.swift
//  RecordAudio
//
//  Created by KoKang Chu on 2017/7/30.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let session = AVAudioSession.sharedInstance()
    
    // 錄音用
    var audioRecorder: AVAudioRecorder?
    // 播放用
    var audioPlayer: AVAudioPlayer?
    // 設定錄音檔路徑與檔名
    let tmpURL = URL(fileURLWithPath: NSTemporaryDirectory() + "audio.ima4")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 設定錄音品質
        let audioSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleIMA4),
            AVEncoderAudioQualityKey: NSNumber(value: AVAudioQuality.high.rawValue),
            AVEncoderBitRateKey: NSNumber(value: 16),
            AVNumberOfChannelsKey: NSNumber(value: 2),
            AVSampleRateKey: NSNumber(value: 44100)
        ]
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.setActive(true)
            
            audioRecorder = try AVAudioRecorder(url: tmpURL, settings: audioSettings)
        } catch {
            print(error)
        }
    }

    @IBAction func recordAudio(_ sender: Any) {
        guard audioRecorder != nil else {
            return
        }
        
        if audioRecorder!.record() {
            print("開始錄音")
        }
    }
    
    @IBAction func stopRecordAudio(_ sender: Any) {
        guard audioRecorder != nil else {
            return
        }

        audioRecorder!.stop()
        print("停止錄音")
    }
    
    @IBAction func play(_ sender: Any) {
        if audioPlayer == nil {
            do {
                audioPlayer =  try AVAudioPlayer(contentsOf: tmpURL)
            } catch {
                print(error)
                return
            }
        }
        
        if audioPlayer!.prepareToPlay(), audioPlayer!.play() {
            print("開始播放錄音檔")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  PlayMusic
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var audio: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 向訊息中心註冊音樂被電話中斷或中斷恢復時要呼叫的函數
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(audioInterrupted(_:)),
            name: NSNotification.Name.AVAudioSessionInterruption,
            object: nil
        )
        
        do {
            let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            audio = try AVAudioPlayer(contentsOf: url!)
            if audio != nil {
                if audio!.prepareToPlay() {
                    print("開始播放音樂")
                    audio!.play()
                }
            }
        } catch {
            print(error)
        }
    }
    
    @objc func audioInterrupted(_ notification: NSNotification) {
        guard audio != nil, let userInfo = notification.userInfo else {
            return
        }
        
        let type_tmp = userInfo[AVAudioSessionInterruptionTypeKey] as! NSNumber
        let type = AVAudioSessionInterruptionType(rawValue: type_tmp.uintValue)

        switch type! {
        case .began:
            print("音樂中斷")
            
        case .ended:
            print("中斷原因結束")
            
            let option_tmp = userInfo[AVAudioSessionInterruptionOptionKey] as! NSNumber
            let option = AVAudioSessionInterruptionOptions(rawValue: option_tmp.uintValue)

            if option == .shouldResume && audio!.prepareToPlay() {
                audio!.play()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


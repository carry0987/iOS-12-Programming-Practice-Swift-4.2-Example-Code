//
//  ViewController.swift
//  PlayMusic_Progress
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var audio: AVAudioPlayer?
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            audio = try AVAudioPlayer(contentsOf: url!)
            if audio != nil {
                if audio!.prepareToPlay() {
                    print("開始播放音樂")
                    audio!.play()
                    
                    slider.minimumValue = 0
                    slider.maximumValue = Float(audio!.duration)
                    slider.value = 0
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                        self.ticker(timer: timer)
                    }
                }
            }
        } catch {
            print(error)
        }
    }

    func ticker(timer: Timer) {
        slider.value = Float(audio!.currentTime)
        if !audio!.isPlaying {
            print("音樂結束")
            timer.invalidate()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        audio?.currentTime = Double(slider.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


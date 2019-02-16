//
//  ViewController.swift
//  AV
//
//  Created by KoKang Chu on 2017/3/6.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, AVPlayerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        let youtubeAppURL = URL(string:"youtube://bu7nU9Mhpyo")
        let browserURL = URL(string:"https://youtu.be/bu7nU9Mhpyo")
        
        // 檢查是否安裝 YouTube App
        if UIApplication.shared.canOpenURL(youtubeAppURL!) {
            // 開啟 YouTube App 播放
            UIApplication.shared.open(youtubeAppURL!, options: [:], completionHandler: nil)
        } else {
            // 開啟瀏覽器連到 YouTube 網站播放
            UIApplication.shared.open(browserURL!, options: [:], completionHandler: nil)
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = Bundle.main.url(forResource: "videoplayback", withExtension: "mp4") {
            let vc = segue.destination as! AVPlayerViewController
            vc.player = AVPlayer(url: url)
        }
    }

}


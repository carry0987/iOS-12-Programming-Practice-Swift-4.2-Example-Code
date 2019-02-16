//
//  ViewController.swift
//  PlaySavedMusic
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {

    @IBAction func onClick(_ sender: AnyObject) {
        let picker = MPMediaPickerController(mediaTypes: .music)
        
        // 可以多選
        picker.allowsPickingMultipleItems = true
        picker.delegate = self
        
        show(picker, sender: self)
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        // 使用者選擇了音樂後會呼叫此方法
        
        // .applicationMusicPlayer: App在背景音樂暫停
        // .iPodMusicPlayer: App在背景音樂繼續播放
        let player: MPMusicPlayerController = .applicationMusicPlayer
        
        player.setQueue(with: mediaItemCollection)
        player.play()
        
        dismiss(animated: true, completion: nil)
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


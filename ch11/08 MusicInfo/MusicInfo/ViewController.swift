//
//  ViewController.swift
//  MusicInfo
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let player = MPMusicPlayerController.applicationMusicPlayer
    
    @IBAction func nextMusic(_ sender: AnyObject) {
        player.skipToNextItem()
    }
    
    @objc func playingItemChanged(_ notification: NSNotification) {
        var mediaItem : MPMediaItem?
        
        repeat {
            mediaItem = player.nowPlayingItem
        } while mediaItem == nil

        
        if let artWork = mediaItem!.value(forProperty: MPMediaItemPropertyArtwork) {
            // 專輯封面
            imageView.image = (artWork as AnyObject).image(at: imageView.bounds.size)
        }
        
        let albumtitle = mediaItem!.value(forProperty: MPMediaItemPropertyAlbumTitle) as? String
        let songTitle = mediaItem!.value(forProperty: MPMediaItemPropertyTitle) as? String
        let singer = mediaItem!.value(forProperty: MPMediaItemPropertyArtist) as? String
        
        print("專輯名稱:\(albumtitle!)")
        print("歌曲名稱:\(songTitle!)")
        print("歌手姓名:\(singer!)\n")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playingItemChanged(_:)),
            name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange,
            object: nil
        )
        
        // 將裝置內所有的歌曲加到播放清單中
        player.setQueue(with: .songs())
        // 播放時產生訊息
        player.beginGeneratingPlaybackNotifications()
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


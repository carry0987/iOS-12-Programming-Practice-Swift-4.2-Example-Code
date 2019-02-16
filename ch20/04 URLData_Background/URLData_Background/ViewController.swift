//
//  ViewController.swift
//  URLData_Background
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "一個下載圖片的網址")
        // 使用背景設定建立 session，並且給一個session的名字
        let config = URLSessionConfiguration.background(withIdentifier: "abc")
        // delegateQueue如果為nil，delegate會在另外一個執行緒中被呼叫
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        let dnTask = session.downloadTask(with: url!)
        
        dnTask.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let data = try? Data(contentsOf: location) {
            DispatchQueue.main.async(execute: { 
                self.imageView.image = UIImage(data: data)
            })
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error == nil {
            print("下載成功")
        } else {
            print("下載失敗： \(error!)")
        }
    }
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print("下載程序完成")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // 計算下載進度
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        print("下載進度 \(progress)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


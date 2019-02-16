//
//  ViewController.swift
//  URLData_ProgressView
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    var myData = (data: Data(), expectedLength: Int64())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressView.progress = 0
        label.text = ""
        
        let url = URL(string: "一個下載圖片的網址")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        let dataTask = session.dataTask(with: url!)
        dataTask.resume()
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        myData.expectedLength = response.expectedContentLength
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        // 組合下載的資料
        myData.data.append(data)
        
        DispatchQueue.main.async { 
            let progress = Float(self.myData.data.count) / Float(self.myData.expectedLength)
            self.progressView.progress = progress
            self.label.text = String(Int(progress * 100)) + "%"
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error == nil {
            DispatchQueue.main.async(execute: { 
                self.imageView.image = UIImage(data: self.myData.data)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


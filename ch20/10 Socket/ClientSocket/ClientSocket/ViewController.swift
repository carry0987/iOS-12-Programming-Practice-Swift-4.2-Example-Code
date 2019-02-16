//
//  ViewController.swift
//  ClientSocket
//
//  Created by KoKang Chu on 2017/6/17.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myText: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    // iStream 與 oStream 需宣告成全域
    var iStream: InputStream? = nil
    var oStream: OutputStream? = nil
    
    @IBAction func onClick(_ sender: Any) {
        if let text = myText.text {
            send(text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 與 socket server 連線
        let _ = Stream.getStreamsToHost(withName: "localhost", port: 12345, inputStream: &iStream, outputStream: &oStream)
        
        // 開啟輸出、輸入資料流
        iStream?.open()
        oStream?.open()
        
        // 透過執行續來偵測並讀取server端傳過來的資料
        DispatchQueue.global().async {
            self.receiveData(available: { (string) in
                DispatchQueue.main.async {
                    // 跟 UI 有關的程式碼要在主執行續中執行
                    self.myLabel.text = string
                }
            })
        }
    }
    
    func receiveData(available: (_ string: String?) -> Void) {
        var buf = Array(repeating: UInt8(0), count: 1024)
        
        while true {
            if let n = iStream?.read(&buf, maxLength: 1024) {
                let data = Data(bytes: buf, count: n)
                let string = String(data: data, encoding: .utf8)
                available(string)
            }
        }
    }
    
    func send(_ string: String) {
        var buf = Array(repeating: UInt8(0), count: 1024)
        let data = string.data(using: .utf8)!
        
        data.copyBytes(to: &buf, count: data.count)
        oStream?.write(buf, maxLength: data.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


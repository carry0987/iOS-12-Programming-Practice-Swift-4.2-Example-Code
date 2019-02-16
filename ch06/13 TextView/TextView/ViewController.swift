//
//  ViewController.swift
//  TextView
//
//  Created by KoKang Chu on 2017/6/23.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 取得File.rtf在專案中的url路徑
        let url = Bundle.main.url(forResource: "File", withExtension: "rtf")
        
        // RTF 非純文字，因此資料型態需為 NSAttributedString
        let aString = try! NSAttributedString(
            url: url!,
            options: [.documentType : NSAttributedString.DocumentType.rtf],
            documentAttributes: nil
        )
        // 非純文字使用 attributedText 屬性，純文字使用 text 屬性，
        textView.attributedText = aString
        // 設定唯讀
        textView.isEditable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


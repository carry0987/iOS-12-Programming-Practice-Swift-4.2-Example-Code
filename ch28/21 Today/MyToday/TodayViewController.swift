//
//  TodayViewController.swift
//  MyToday
//
//  Created by KoKang Chu on 2017/8/16.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    @IBAction func moreButton(_ sender: Any) {
        let url = URL(string: "todayapp://")
        extensionContext?.open(url!, completionHandler: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        label.text = Date().description(with: NSLocale.current)
        completionHandler(NCUpdateResult.newData)
    }
    
}

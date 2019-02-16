//
//  ViewController.swift
//  Closure
//
//  Created by ChuKoKang on 2016/7/17.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sum(1, 2, 3, 4, 5) { (result) in
            print(result)
        }
    }
    
    func sum(_ values: Double..., completion: (_ result: Double) -> Void) {
        var answer = 0.0
        for n in values {
            answer += n
        }
        
        completion(answer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


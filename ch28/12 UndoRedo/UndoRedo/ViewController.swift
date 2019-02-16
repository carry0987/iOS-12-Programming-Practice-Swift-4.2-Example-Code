//
//  ViewController.swift
//  UndoRedo
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myText: UITextField!
    
    @IBAction func undoButton(_ sender: AnyObject) {
        myText.undoManager?.undo()
    }
    
    @IBAction func redoButton(_ sender: AnyObject) {
        myText.undoManager?.redo()
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


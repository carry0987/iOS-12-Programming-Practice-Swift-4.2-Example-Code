//
//  ViewController.swift
//  SearchBar
//
//  Created by KoKang Chu on 2017/6/27.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("按下書籤按鈕")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("按下取消按鈕")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


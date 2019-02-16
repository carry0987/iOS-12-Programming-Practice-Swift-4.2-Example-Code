//
//  ViewController.swift
//  CollectionView
//
//  Created by KoKang Chu on 2017/8/26.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var list = [(up: String, down: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        list.append(("1", "AAA"))
        list.append(("2", "BBB"))
        list.append(("3", "CCC"))
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let upLabel = cell.viewWithTag(100) as? UILabel
        let downLabel = cell.viewWithTag(200) as? UILabel
        
        upLabel!.text = list[indexPath.row].up
        downLabel!.text = list[indexPath.row].down
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


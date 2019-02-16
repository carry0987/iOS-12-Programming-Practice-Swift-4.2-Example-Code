//
//  ViewController.swift
//  FetchAllPhotos
//
//  Created by ChuKoKang on 2016/7/23.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var list: [UIImage]!
    
    func fetchAllPhotos() -> [UIImage]  {
        var images = [UIImage]()
        
        // 從裝置中取得所有類型為圖片的asset
        let fetchResult = PHAsset.fetchAssets(with: .image, options: nil)
        for n in 0 ..< fetchResult.count {
            autoreleasepool {   // <== 加上這個
                let imageAsset = fetchResult.object(at: n)
                let size = CGSize(width: imageAsset.pixelWidth, height: imageAsset.pixelHeight)
                
                PHImageManager.default().requestImage(
                    for: imageAsset,
                    targetSize: size,
                    contentMode: .default,
                    options: nil,
                    resultHandler: { (image, nil) in
                        // 參數 image 即為所取得的圖片
                        images.append(image!)
                })
            } // <== autoreleasepool 結束
        }
        
        return images
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.imageView?.image = list[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        list = fetchAllPhotos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  ScrollView
//
//  Created by KoKang Chu on 2017/8/25.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 載入圖片並取得圖片原始大小
        imageView.image = UIImage(named: "IMG_8800")
        let size = imageView.image!.size
        // 讓 scroll view 的 content 大小與圖片實際大小一樣
        scrollView.contentSize = size
        
        // 若一開始想將圖片完整顯示在 scroll view 範圍內時，
        // 必須先計算出 scroll view 中的 content 放大倍率
        let wScale = scrollView.frame.size.width / size.width
        let hScale = scrollView.frame.size.height / size.height
        let scale = min(wScale, hScale)  // 完整顯示圖片的放大倍率
        
        // 設定最小、最大與目前放大倍率
        scrollView.minimumZoomScale = scale
        scrollView.maximumZoomScale = 0.8
        scrollView.zoomScale = scale
    }
    
    func moveToCenter() {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.frame.size
        var wPadding: CGFloat = 0
        var hPadding: CGFloat = 0
        
        if imageViewSize.width < scrollViewSize.width {
            wPadding = (scrollViewSize.width - imageViewSize.width) / 2
        }
        
        if imageViewSize.height < scrollViewSize.height {
            hPadding = (scrollViewSize.height - imageViewSize.height) / 2
        }
        
        scrollView.contentInset = UIEdgeInsets(top: hPadding, left: wPadding, bottom: hPadding, right: wPadding)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToCenter()
    }
    
    // 完成放大縮小時呼叫
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        moveToCenter()
    }
    
    // 進行放大縮小時呼叫
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        moveToCenter()
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


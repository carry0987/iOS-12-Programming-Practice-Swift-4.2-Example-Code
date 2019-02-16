//
//  MyCanvas.swift
//  Draw
//
//  Created by ChuKoKang on 2016/7/8.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class MyCanvas: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // 取得一個繪圖區域
        if let context = UIGraphicsGetCurrentContext() {
            // 保存現行繪圖區域狀態
            context.saveGState()
            
            // 設定繪圖區域座標，將(0, 0)改為左下角
            var t = context.ctm
            t = t.inverted()
            context.concatenate(t)
            
            // 此處呼叫畫線、畫圓...等自訂函數，請參考之後章節
            // drawLine(in: context)
            // drawPolygon(in: context)
            // drawRectangle(in: context)
            // drawArc(in: context)
            // drawEllipse(in: context)
            // drawCurve(in: context)
            drawImage(in: context)
            // 還原繪圖區域狀態
            context.restoreGState()
        }
    }

    func drawLine(in context: CGContext) {
        context.setLineWidth(15)
        context.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        
        // 畫一條實線
        context.move(to: CGPoint(x: 10, y: 100))
        context.addLine(to: CGPoint(x: 200, y: 100))
        context.drawPath(using: .stroke)
        
        // 畫一條等寬虛線
        let dashes: [CGFloat] = [10.0, 10.0]
        context.setLineDash(phase: 0, lengths: dashes)
        context.move(to: CGPoint(x: 10, y: 150))
        context.addLine(to: CGPoint(x: 200, y: 150))
        context.drawPath(using: .stroke)
        
        // 畫一條花式虛線
        let dashes2: [CGFloat] = [6, 6, 2, 3]
        context.setLineDash(phase: 0, lengths: dashes2)
        context.move(to: CGPoint(x: 10, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 200))
        context.drawPath(using: .stroke)
    }

    func drawPolygon(in context: CGContext) {
        // 設定線條顏色
        context.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        // 設定填滿顏色
        context.setFillColor(red: 0.6, green: 1, blue: 1, alpha: 1)
        // 設定線條粗細
        context.setLineWidth(15)
        
        // 設定路線開始
        context.beginPath()
        context.move(to: CGPoint(x: 30, y: 30))
        context.addLine(to: CGPoint(x: 200, y: 30))
        context.addLine(to: CGPoint(x: 200, y: 250))
        // 設定路線結束
        context.closePath()
        
        context.drawPath(using: .fillStroke)
    }

    func drawRectangle(in context: CGContext) {
        context.setFillColor(red: 1, green: 0, blue: 0, alpha: 1)
        context.addRect(CGRect(x: 30, y: 30, width: 100, height: 100))
        context.drawPath(using: .fill)
        
        context.setFillColor(red: 0, green: 1, blue: 0, alpha: 0.4)
        context.addRect(CGRect(x: 80, y: 80, width: 200, height: 200))
        context.drawPath(using: .fill)
    }
    
    func drawArc(in context: CGContext) {
        // 設定線條粗細與顏色
        context.setLineWidth(10)
        context.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        
        // 半徑比較小的弧線
        context.addArc(
            center: CGPoint(x: 200, y: 150),
            radius: 50,
            startAngle: 0,
            endAngle: 90.0 * CGFloat.pi / 180.0,
            clockwise: false
        )
        // 半徑比較大的弧線
        context.addArc(
            center: CGPoint(x: 200, y: 300),
            radius: 100,
            startAngle: 270.0 * CGFloat.pi / 180.0,
            endAngle: 90.0 * CGFloat.pi / 180.0,
            clockwise: true)
        
        context.drawPath(using: .stroke)
    }
    
    func drawEllipse(in context: CGContext) {
        context.setFillColor(red: 0, green: 0, blue: 1, alpha: 0.7)
        
        // 橢圓
        context.addEllipse(in: CGRect(x: 40, y: 40, width: 200, height: 80))
        context.drawPath(using: .fill)
        
        // 正圓
        context.addEllipse(in: CGRect(x: 0, y: 200, width: 150, height: 150))
        context.drawPath(using: .fill)
    }
    
    func drawCurve(in context: CGContext) {
        context.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        context.setLineWidth(3)
        
        // 三次貝茲曲線
        context.move(to: CGPoint(x: 70, y: 100))
        context.addCurve(
            to: CGPoint(x: 250, y: 100),
            control1: CGPoint(x: 100, y: 300),
            control2: CGPoint(x: -80, y: 100)
        )
        context.drawPath(using: .stroke)
        
        // 二次貝茲曲線
        context.move(to: CGPoint(x: 200, y: 300))
        context.addQuadCurve(
            to: CGPoint(x: 100, y: 200),
            control: CGPoint(x: -100, y:300)
        )
        context.drawPath(using: .stroke)
    }
    
    func drawImage(in context: CGContext) {
        // 將UIImage載入的jpg圖檔轉成CGImage格式
        let image = UIImage(named: "sample")?.cgImage
        // 在座標(30, 30)以及長240, 高180的矩形區域內顯示圖片
        context.draw(image!, in: CGRect(x: 30, y: 30, width: 240, height: 180))
        
        // 設定原始圖片的子區域範圍 (2000, 750)由圖片的左上角開始計算
        let subRect = CGRect(x: 2000, y: 750, width: 480, height: 360)
        // 取得原始圖片的區域部分
        let subImage = image!.cropping(to: subRect)
        // 在(30, 250)的位置顯示子圖片
        context.draw(subImage!, in: CGRect(x: 30, y: 250, width: 240, height: 180))
    }
}

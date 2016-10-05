//
//  RatingView.swift
//  Book
//
//  Created by LiuRon on 2016/10/1.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit

class RatingView: UIView {
    
    var StarMax = 5.0   //  最大评分
    var StarHeight = 22.0  //星星高度
    var StarSpace = 4.0     //星星间距
    var emptyImageViews = [UIImageView]()
    var fillImageViews = [UIImageView]()
    
    var value = 0.0 {
        didSet {
            if value > StarMax {
                value = StarMax
            }else if value < 0{
                value = 0
                
            }
            
            for (i,imageView) in fillImageViews.enumerated(){
                let i = Double(i)
                
                if value >= i + 1 {
                    
                    imageView.layer.mask = nil
                    imageView.isHidden = false
                    
                }else if value > i && value < i + 1 {
                    let maskLayer = CALayer()
                    maskLayer.frame = CGRect(x:0,y:0,width:(value - i) * StarHeight,height:StarHeight)
                    maskLayer.backgroundColor = UIColor.red.cgColor
                    imageView.layer.mask = maskLayer
                    imageView.isHidden = false
                    
                }else {
                    
                    imageView.layer.mask = nil
                    imageView.isHidden = true
                }
            }
        }
    }
    
    init(StarHeight:Double,StarMax:Double){
        
        self.StarHeight = StarHeight
        self.StarMax = StarMax
        self.StarSpace = StarHeight * 0.15
        
        let frame = CGRect(x:0,y:0,width:StarHeight * StarMax + StarSpace * (StarMax - 1),height:StarHeight)
        
        
        super.init(frame: frame)
        
        
        for i in 0..<Int(StarMax) {
            let i = Double(i)
            let emptyImageView = UIImageView(image: UIImage(named:"stat_empty"))
            let fillImageView = UIImageView(image: UIImage(named:"star_full"))
            
            
            let frame = CGRect(x:StarHeight * i + StarSpace *  i, y:0,width:StarHeight,height:StarHeight )
            emptyImageView.frame = frame
            fillImageView.frame = frame
            
            emptyImageViews.append(emptyImageView)
            fillImageViews.append(fillImageView)
            
            addSubview(emptyImageView)
            addSubview(fillImageView)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func showInView(view:UIView,value:Double,StarMax:Double = 5){
        
        for subview in view.subviews {
            if let subview = subview as? RatingView {
                subview.value = value
                return
            }
        }
    
        // xcode8的坑，一定要layoutIfNeeded才会autolayout布局
        view.layoutIfNeeded()
        let ratingView = RatingView(StarHeight: Double(view.frame.size.height), StarMax: StarMax)
        ratingView.isHidden = false
        
        view.addSubview(ratingView)
        ratingView.value = value
        
    }
    
    



}

















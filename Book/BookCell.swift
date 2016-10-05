//
//  BookCell.swift
//  Book
//
//  Created by LiuRon on 2016/9/27.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class BookCell:UITableViewCell {
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var ratingViewContainer: UIView!
    
    
    func configureWithBook(book:JSON) {
        imageViewIcon.kf.setImage(with: URL(string:book["images"]["medium"].string!))
        labelTitle.text = book["title"].string
        labelDetail.text = ("评分：\(book["rating"]["average"].double!.description)")
        RatingView.showInView(view: ratingViewContainer, value:Double(transAverage(average: book["rating"]["average"].double!))!)
        
    }
    
    //处理评分
    func transAverage(average:Double) -> String {
        return String(format: "%.1f", average/2)
        
    }
    
    
    
    
    
    
    

}

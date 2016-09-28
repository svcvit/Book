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
    
    
    func configureWithBook(book:JSON) {
        
        print (book)
        imageViewIcon.kf.setImage(with: URL(string:book["images"]["large"].string!))
        labelTitle.text = book["title"].string
        labelDetail.text = book["original_title"].string
        print(book["title"].string)
    }

}

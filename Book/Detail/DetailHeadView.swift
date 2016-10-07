//
//  DetailHeadView.swift
//  Book
//
//  Created by LiuRon on 2016/10/5.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire

class DetailHeadView: UIView {
    
    weak var tableView:UITableView!
    var book:JSON!

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var ratingViewContainer: UIView!
    @IBOutlet weak var labelRateNum: UILabel!
    @IBOutlet weak var labenPublisher: UILabel!
    @IBAction func comment(_ sender: AnyObject) {
    }
    @IBAction func collection(_ sender: AnyObject) {
    }
    @IBOutlet weak var labelSummary: UILabel!
    
    
    static func showInTableView(tableView:UITableView,book:JSON) -> DetailHeadView{
        let headView = Bundle.main.loadNibNamed("DetailHeadView", owner: nil, options: nil)?[0] as! DetailHeadView
        headView.configureWith(tableView: tableView, book: book)
        return headView
    }
    
    func configureWith(tableView:UITableView,book:JSON){
        self.tableView = tableView
        self.book = book
        
        imageViewIcon.kf.setImage(with: URL(string:book["images"]["large"].string!))
        labelName.text = book["title"].string
        //暂时未处理没有评分的情况
        if let rating = Double(transAverage(average: book["rating"]["average"].double!)) {
            RatingView.showInView(view: ratingViewContainer, value:rating)
        }else {
            RatingView.showNORating(view: ratingViewContainer)
        }
        
        labelRateNum.text = "10000"
        
        labenPublisher.text = book["id"].string
        labelSummary.text = "正在获取～"
        getMovieDetail(id:book["id"].string!)
        self.tableView.tableHeaderView = self
    }
    
    
    func getMovieDetail(id:String){
        let url = "https://api.douban.com/v2/movie/subject/\(id)"
        Alamofire.request(url, method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                let detail = JSON(response.result.value)
                self.labelSummary.text = detail["summary"].string
                self.labenPublisher.text = detail["year"].string
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    

    //DetailHeadView 设置成freeform，设置一个高度。但是containerView不要设置固定高度，这样高度就可以自适应
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame.size.height = containerView.frame.size.height
        tableView.tableHeaderView = self
        
    }

}

//处理评分
func transAverage(average:Double) -> String {
    return String(format: "%.1f", average/2)
    
}

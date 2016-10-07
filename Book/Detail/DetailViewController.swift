//
//  DetailViewController.swift
//  Book
//
//  Created by LiuRon on 2016/10/6.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UIViewController,UITableViewDataSource,UITabBarDelegate {

    @IBAction func back(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var book:JSON = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = book["title"].string
        DetailHeadView.showInTableView(tableView: tableView, book: book)
        //简单加载一个tableview
//        tableView.tableHeaderView = Bundle.main.loadNibNamed("DetailHeadView", owner: nil, options: nil)?[0] as? UIView

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

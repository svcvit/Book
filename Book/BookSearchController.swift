//
//  BookSearchController.swift
//  Book
//
//  Created by LiuRon on 2016/10/1.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BookSearchController: UIViewController,UISearchResultsUpdating,UITableViewDataSource,UITableViewDelegate {
    //MARK: -Property-
    weak var bookController:BookViewController!
    var searchController = UISearchController()
    let searchPlaceholder = "搜搜电影"
    var books:JSON = []
    var tmp:JSON = nil
    

    let url = "https://api.douban.com/v2/movie/search"
    
    var searchTitle = [String]()
//    var searchTitle = ["Swift1","Swift2","Swift3"]
    
    
    //MARK: -Outlet-
    @IBOutlet weak var tableView: UITableView!
    
    
    override func awakeFromNib() {
        searchController = UISearchController(searchResultsController: self)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = searchPlaceholder
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.subviews[0].subviews[0].removeFromSuperview()
    }
    
    //MARK: -UISearchResultsUpdating-
    func updateSearchResults(for searchController: UISearchController) {
        self.searchTitle = [String]()
        if let tag = searchController.searchBar.text {
        Alamofire.request(url, method: .get, parameters: ["tag":tag,"start":0,"count":10],encoding: URLEncoding.default).responseJSON {
            response in
            switch response.result {
            case .success:
                self.books = JSON(response.result.value)["subjects"]
                for (_,v) in self.books {
                    self.searchTitle.append(v["title"].string!)
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        }
        
    }
    
    //MARK: -UITableView-

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTitle.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = searchTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.tmp = self.books[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let viewController = segue.destination as! DetailViewController
            viewController.book = self.tmp
        }
    }
    

    

}

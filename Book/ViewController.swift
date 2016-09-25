//
//  ViewController.swift
//  Book
//
//  Created by LiuRon on 2016/9/24.
//  Copyright © 2016年 LiuRon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetManager.request(url: "https://httpbin.org/get", method: .get,showHUD:true,view:self.view)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


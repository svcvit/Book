//
//  NetManager.swift
//  Book
//
//  Created by LiuRon on 2016/9/24.
//  Copyright © 2016年 LiuRon. All rights reserved.
//


import UIKit
import Alamofire
import MBProgressHUD
import Toast_Swift

struct NetManager {
    static func request(url:String, method:HTTPMethod,encoding:ParameterEncoding = URLEncoding.default,showHUD:Bool = true,view:UIView){

        let netError = "网络请求错误"
        let loadingNotification:MBProgressHUD
        let manager = SessionManager.default
        
        if showHUD {
        loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.label.text = "Loading"
        }
        
        manager.request(url, method: method, encoding: encoding).responseJSON{
            response in
            switch response.result {
            case .success:
                print (response.result.value)
                MBProgressHUD.hideAllHUDs(for: view, animated: true)
            case .failure(let error):
                MBProgressHUD.hideAllHUDs(for: view, animated: true)
                print(error)
                view.makeToast(netError, duration: 2.0, position: .center)
            }
        }
    }
}

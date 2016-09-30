//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import SwiftyJSON

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true



let url = "https://api.douban.com/v2/movie/search"
let tag = "爱情"
var books:JSON = []
let pageSize = 10
var page = 0


var json: JSON =  [1,2,3]
json[0] = 100
json[1] = 200
json[2] = 300
json[999] = 300 //Don't worry, nothing will happen

Alamofire.request(url, method: .get, parameters: ["tag":tag,"start":0,"count":pageSize],encoding: URLEncoding.default).responseJSON {
    response in
    
    switch response.result {
    case .success:
        books = JSON(response.result.value)["subjects"]
        
        
        print (books.count)
        
        print ((books.arrayObject! + books.arrayObject!).count)
        
        

    case .failure(let error):
        print(error)
    }
    
}


func getData(json:JSON) -> JSON{
    return json
}

//extension JSON {
//    mutating func extend(other:JSON) -> JSON {
//        var index = self.count
//        for (_,v) in other {
//            self[index] = v
//            index+=1
//            print (self[10])
//            print ("out:"+index.description)
//            print (self.count)
//        }
//        return self
//    }
//}

extension JSON{
    mutating func appendIfArray(json:JSON){
        if var arr = self.array{
            arr.append(json)
            self = JSON(arr);
        }
    }
    
    mutating func appendIfDictionary(key:String,json:JSON){
        if var dict = self.dictionary{
            dict[key] = json;
            self = JSON(dict);
        }
    }
}
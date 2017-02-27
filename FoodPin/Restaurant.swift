//
//  Restaurant.swift
//  FoodPin
//
//  Created by mmslab on 2017/2/20.
//  Copyright © 2017年 mmslab. All rights reserved.
//
import Foundation

class Restaurant {
    
    var name:String = ""
    var type:String = ""
    var location:String = ""
    var image:String = ""
    var isVisited:Bool = false
    /*
    let name:String
    let type:String
    let location:String
    let image:String
    var isVisited:Bool = false*/
    //let postKey : String
    
    init(name:String, type:String, location:String, image:String, isVisited:Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        //self.postKey = ""
    }
   /*
    init(postKey: String, postData: Dictionary<String, Any>) {
        self.postKey = postKey
        self.name = postData["name"] as? String ?? ""
        self.type = postData["type"] as? String ?? ""
        self.location = postData["location"] as? String ?? ""
        self.image = postData["image"] as? String ?? ""
        self.isVisited = postData["isVisited"] as? Bool ?? false
    }*/
   
}



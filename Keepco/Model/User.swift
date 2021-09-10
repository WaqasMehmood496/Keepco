//
//  User.swift
//  Keepco
//
//  Created by Usman Meraj on 8/10/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation


class User {
    
    init(){
        self.id = ""
        self.email = ""
        self.username = ""
        self.password = ""
        self.image = ""
        self.gender = ""
        self.phone = ""
        self.dob = ""
        self.home_address = ""
        self.work_address = ""
        self.home_lat = ""
        self.home_lng = ""
        self.work_lat = ""
        self.work_lng = ""
        self.occupation = ""
        self.sub_occupation = ""
        self.fun = ""
        self.sub_fun = ""
        self.distance = ""
        self.no_of_views = ""
    }
    
    internal init(id: String, email: String, username: String, password: String, image: String, gender: String, phone: String, dob: String, home_address: String, work_address: String, home_lat: String, home_lng: String, work_lat: String, work_lng: String, occupation: String, sub_occupation: String, fun: String, sub_fun: String, distance: String, no_of_views: String) {
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.image = image
        self.gender = gender
        self.phone = phone
        self.dob = dob
        self.home_address = home_address
        self.work_address = work_address
        self.home_lat = home_lat
        self.home_lng = home_lng
        self.work_lat = work_lat
        self.work_lng = work_lng
        self.occupation = occupation
        self.sub_occupation = sub_occupation
        self.fun = fun
        self.sub_fun = sub_fun
        self.distance = distance
        self.no_of_views = no_of_views
    }
    
    var id: String
    var email: String
    var username: String
    var password: String
    var image: String
    var gender: String
    var phone: String
    var dob: String
    var home_address: String
    var work_address: String
    var home_lat: String
    var home_lng: String
    var work_lat: String
    var work_lng: String
    var occupation: String
    var sub_occupation: String
    var fun: String
    var sub_fun: String
    var distance: String
    var no_of_views: String
    var workDistance: String?
    
    
    
}


class UserModel: Codable {
    
    var id : String!
    var email : String!
    var username : String!
    var password : String!
    var image : String!
    var gender : String!
    var phone : String!
    var dob : String!
    var home_address : String!
    var work_address : String!
    var home_lat : String!
    var home_lng : String!
    var work_lat : String!
    var work_lng : String!
    var occupation : String!
    var sub_occupation : String!
    var fun : String!
    var sub_fun : String!
    var distance : String!
    var no_of_views : String!
    
    init(id:String? = nil,email: String? = nil,username: String? = nil,password: String? = nil,image: String? = nil,gender:String? = nil,phone: String? = nil,dob:String? = nil,home_address:String? = nil,work_address:String? = nil,home_lat:String? = nil,home_lng: String? = nil,work_lat: String? = nil,work_lng: String? = nil,occupation: String? = nil,sub_occupation:String? = nil,fun: String? = nil,sub_fun:String? = nil,distance:String? = nil,no_of_views:String? = nil) {
        
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.image = image
        self.gender = gender
        self.phone = phone
        self.dob = dob
        self.home_address = home_address
        self.work_address = work_address
        self.home_lat = home_lat
        self.home_lng = home_lng
        self.work_lat = work_lat
        self.work_lng = work_lng
        self.occupation = occupation
        self.sub_occupation = sub_occupation
        self.fun = fun
        self.sub_fun = sub_fun
        self.distance = distance
        self.no_of_views = no_of_views
    }
    
    init?(dic:NSDictionary) {
        
        let id = (dic as AnyObject).value(forKey: Constant.id) as? String
        let email = (dic as AnyObject).value(forKey: Constant.email) as! String
        let username = (dic as AnyObject).value(forKey: Constant.username) as? String
        let password = (dic as AnyObject).value(forKey: Constant.password) as? String
        let image = (dic as AnyObject).value(forKey: Constant.image) as? String
        let gender = (dic as AnyObject).value(forKey: Constant.gender) as? String
        let phone = (dic as AnyObject).value(forKey: Constant.phone) as? String
        let dob = (dic as AnyObject).value(forKey: Constant.dob) as? String
        let home_address = (dic as AnyObject).value(forKey: Constant.home_address) as? String
        let work_address = (dic as AnyObject).value(forKey: Constant.work_address) as? String
        let home_lat = (dic as AnyObject).value(forKey: Constant.home_lat) as? String
        let home_lng = (dic as AnyObject).value(forKey: Constant.home_lng) as! String
        let work_lat = (dic as AnyObject).value(forKey: Constant.work_lat) as? String
        let occupation = (dic as AnyObject).value(forKey: Constant.occupation) as? String
        let sub_occupation = (dic as AnyObject).value(forKey: Constant.sub_occupation) as? String
        let fun = (dic as AnyObject).value(forKey: Constant.fun) as? String
        let sub_fun = (dic as AnyObject).value(forKey: Constant.sub_fun) as? String
        let distance = (dic as AnyObject).value(forKey: Constant.distance) as? String
        let no_of_views = (dic as AnyObject).value(forKey: Constant.no_of_views) as? String
        
        
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.image = image
        self.gender = gender
        self.phone = phone
        self.dob = dob
        self.home_address = home_address
        self.work_address = work_address
        self.home_lat = home_lat
        self.home_lng = home_lng
        self.work_lat = work_lat
        self.occupation = occupation
        self.sub_occupation = sub_occupation
        self.fun = fun
        self.sub_fun = sub_fun
        self.distance = distance
        self.no_of_views = no_of_views
        
    }
}

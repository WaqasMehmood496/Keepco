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

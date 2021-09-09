//
//  Post.swift
//  Keepco
//
//  Created by Usman Meraj on 8/11/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation

class Post {
    
    init(){
        self.post_id = ""
        self.user_id = ""
        self.desc = ""
        self.type = ""
        self.post_category = ""
        self.distance = ""
        self.isLiked = false
        self.likes = ""
        self.comments = ""
        self.image = ""
        self.lat = ""
        self.lng = ""
        self.myImage = ""
        self.user_image = ""
        self.user_name = ""
        self.checkedLocation = ""
    }
    
    internal init(post_id: String, user_id: String, desc: String, type: String, post_category: String, distance: String, isLiked: Bool, likes: String, comments: String, image: String, lat: String, lng: String, myImage: String, user_image: String, user_name: String, checkedLocation: String) {
        self.post_id = post_id
        self.user_id = user_id
        self.desc = desc
        self.type = type
        self.post_category = post_category
        self.distance = distance
        self.isLiked = isLiked
        self.likes = likes
        self.comments = comments
        self.image = image
        self.lat = lat
        self.lng = lng
        self.myImage = myImage
        self.user_image = user_image
        self.user_name = user_name
        self.checkedLocation = checkedLocation
    }
    
    
    
    var post_id: String
    var user_id: String
    var desc: String
    var type: String
    var post_category: String
    var distance: String
    var isLiked: Bool
    var likes: String
    var comments: String
    var image: String
    var lat: String
    var lng: String
    var myImage: String
    var user_image: String
    var user_name: String
    var checkedLocation: String
}

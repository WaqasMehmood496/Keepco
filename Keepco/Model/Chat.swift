//
//  Chat.swift
//  Keepco
//
//  Created by Usman Meraj on 8/16/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation


class Chat {
    
    internal init(sender_id: String, receiver_id: String, sender_name: String, date: String, msg: String, sender_image: String, receiver_image: String, msg_count: String) {
        self.sender_id = sender_id
        self.receiver_id = receiver_id
        self.sender_name = sender_name
        self.date = date
        self.msg = msg
        self.sender_image = sender_image
        self.receiver_image = receiver_image
        self.msg_count = msg_count
    }
    
    var sender_id: String
    var receiver_id: String
    var sender_name: String
    var date: String
    var msg: String
    var sender_image: String
    var receiver_image: String
    var msg_count: String
}

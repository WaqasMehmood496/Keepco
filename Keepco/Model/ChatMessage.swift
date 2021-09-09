//
//  ChatMessage.swift
//  Keepco
//
//  Created by Usman Meraj on 8/16/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation


class ChatMessage {
    
    internal init(messageText: String, name: String, day: String, messageType: String, url: String, isLocal: Bool, isLoading: Bool) {
        self.messageText = messageText
        self.name = name
        self.day = day
        self.url = url
        self.messageType = messageType
        self.isLocal = isLocal
        self.isLoading = isLoading
    }
    
    var messageText: String
    var userType: UserType?
    var name: String
    var day: String
    var messageType: String
    var url: String
    var data: Data?
    var videoUrl: URL?
    var isLocal: Bool
    var isLoading: Bool
}


enum UserType {
    case OTHER
    case SELF
}

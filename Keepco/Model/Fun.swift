//
//  Fun.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation
import UIKit

class Fun {
    
    var id: Int
    var parentId: Int
    var name: String
    var icon: UIImage
    var selected: Bool
    var answers: [Answer]?
    
    init(id: Int, name: String, icon: UIImage, selected: Bool) {
        self.id = id
        self.name = name
        self.icon = icon
        self.selected = selected
        self.parentId = 0
        self.answers = nil
    }
    
    init(id: Int, parentId: Int, answers: [Answer], selected: Bool) {
        self.id = id
        self.parentId = parentId
        self.answers = answers
        self.selected = selected
        self.icon = UIImage()
        name = ""
    }
    
    init(id: Int, parentId: Int, name: String, icon: UIImage, selected: Bool) {
        self.id = id
        self.parentId = parentId
        self.name = name
        self.icon = icon
        self.selected = selected
    }
    
   
    
}



class Answer {
    internal init(question_id: String, answer: String) {
        self.question_id = question_id
        self.answer = answer
    }
    
    var question_id: String
    var answer: String
    
    
}

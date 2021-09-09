//
//  Occupation.swift
//  Keepco
//
//  Created by Usman Meraj on 4/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class Occupation {

    var id: Int
    var parentId: Int?
    var name: String
    var icon: UIImage
    var selected: Bool
    var text: String?
    
    init(id: Int, name: String, icon: UIImage, selected: Bool) {
        self.id = id
        self.name = name
        self.icon = icon
        self.selected = selected
    }
    
    init(id: Int, parentId: Int, name: String, text: String, selected: Bool) {
        self.id = id
        self.parentId = parentId
        self.name = name
        self.text = text
        self.selected = selected
        self.icon = UIImage()
    }
    
    init(id: Int, parentId: Int, name: String, icon: UIImage, selected: Bool) {
        self.id = id
        self.parentId = parentId
        self.name = name
        self.icon = icon
        self.selected = selected
    }
    
}

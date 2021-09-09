//
//  MyOccupationsCell.swift
//  Keepco
//
//  Created by Usman Meraj on 8/13/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class MyOccupationsCell: UITableViewCell {
    @IBOutlet weak var txtView: UITextField!
    @IBOutlet weak var labelOccupation: UILabel!
    @IBOutlet weak var viewOccupation: UIView!
    @IBOutlet weak var imgOccupation: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewOccupation.layer.cornerRadius = viewOccupation.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class MyOccupationsCell2: UITableViewCell {
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnManage: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnAdd.layer.cornerRadius = 27.5
        btnAdd.layer.masksToBounds = true
        
        btnSave.layer.cornerRadius = 27.5
        btnSave.layer.masksToBounds = true
        btnSave.layer.borderColor = UIColor(hexString: "#343997").cgColor
        btnSave.layer.borderWidth = 1
        
        btnManage.layer.cornerRadius = 27.5
        btnManage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

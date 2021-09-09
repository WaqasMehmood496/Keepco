//
//  OutgoingTableViewCell.swift
//  Keepco
//
//  Created by Usman Meraj on 8/16/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class OutgoingTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var labelMsg: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imgChat: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBack.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

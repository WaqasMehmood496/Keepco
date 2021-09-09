//
//  HomeTableViewCell.swift
//  Keepco
//
//  Created by Usman Meraj on 5/1/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var viewRadio: UIView!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var labelAddress: UILabel!
    
    @IBOutlet weak var btnMarketing: UIButton!
    @IBOutlet weak var btnFree: UIButton!
    @IBOutlet weak var btnExperience: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

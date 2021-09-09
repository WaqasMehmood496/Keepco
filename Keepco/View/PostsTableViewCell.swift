//
//  PostsTableViewCell.swift
//  Keepco
//
//  Created by Usman Meraj on 5/1/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDistance: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var viewPost: UIView!
    @IBOutlet weak var viewSend: UIView!
    @IBOutlet weak var btnSend: UIButton!
    
    @IBOutlet weak var ic_location: UIImageView!
    @IBOutlet weak var labelCheckIn: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelLikes: UILabel!
    @IBOutlet weak var labelComments: UILabel!
    @IBOutlet weak var imgComment: UIImageView!
    @IBOutlet weak var viewComment: UIView!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var imgMsg: UIImageView!
    
    @IBOutlet weak var topConstraintImage: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewSend.layer.cornerRadius = viewSend.frame.height/2
        imgComment.layer.cornerRadius = imgComment.frame.height/2
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

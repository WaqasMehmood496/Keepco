//
//  FunboardCollectionViewCell.swift
//  Keepco
//
//  Created by Usman Meraj on 8/14/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class FunboardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelEdit: UILabel!
    
    override func awakeFromNib() {
        viewTop.layer.cornerRadius = 7
        viewTop.layer.borderColor = UIColor(hexString: "#343997").cgColor
        viewTop.layer.borderWidth = 0.4
    }
}

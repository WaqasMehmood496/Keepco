//
//  ThumbTextSlder.swift
//  Keepco
//
//  Created by Usman Meraj on 5/1/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation
import UIKit

class ThumbTextSlider: UISlider {
    var thumbTextLabel: UILabel = UILabel()
    
    private var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbTextLabel.frame = CGRect(x: thumbFrame.minX - 22, y: thumbFrame.minY - 25, width: 60, height: 20)
        if(language == "en"){
            thumbTextLabel.text = Int(value).description + "m"
        }
        else {
            thumbTextLabel.text = Int(value).description + "מ'"
            thumbTextLabel.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        
        thumbTextLabel.font = UIFont(name: "GillSansMT-BdIt", size: 14)
        thumbTextLabel.textColor = UIColor(hexString: "#343997")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(thumbTextLabel)
        thumbTextLabel.textAlignment = .center
        thumbTextLabel.layer.zPosition = layer.zPosition + 1
    }
}



extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

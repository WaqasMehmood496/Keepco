//
//  MoreFlowLayout.swift
//  JazzTunes
//
//  Created by Usman Meraj on 2/28/19.
//  Copyright © 2019 Usman Meraj. All rights reserved.
//

import Foundation
import UIKit

class OccupationFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {
            
        }
        get {
            let numberOfColumns: CGFloat = 3
            
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1)) / numberOfColumns
            
            return CGSize(width: itemWidth - 5, height: itemWidth - 5 )
            
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 10
        scrollDirection = .vertical
    }
}

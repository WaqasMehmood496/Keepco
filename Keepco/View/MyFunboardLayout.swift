//
//  MyFunboardLayout.swift
//  Keepco
//
//  Created by Usman Meraj on 8/14/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import Foundation
import UIKit

class MyFunboardLayout: UICollectionViewFlowLayout {
    
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
            
            return CGSize(width: itemWidth - 10, height: 120 )
            
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 20
        scrollDirection = .vertical
    }
}


//
//  ExtrasCell.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/13/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

class ExtrasCell: UICollectionViewCell {
    
    let extrasController = ExtrasController()
    
    let imageView = UIImageView(cornerRadius: 15)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        addSubview(extrasController.view)
        extrasController.view.fillSuperview()
        
        // extrasController.collectionView.reloadData()
        
        //IncludesController().collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

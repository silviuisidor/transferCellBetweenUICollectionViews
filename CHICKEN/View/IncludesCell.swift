//
//  IncludesCell.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/13/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

class IncludesCell: UICollectionViewCell {
    
    let horizontalController = IncludesController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
       
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

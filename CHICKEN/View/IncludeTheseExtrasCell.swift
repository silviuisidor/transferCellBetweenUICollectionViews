//
//  IncludeTheseExtraCells.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/14/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

// CELL
class IncludeTheseExtrasCell: UICollectionViewCell {
    

    
    var extras: Extras?
    
 
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.backgroundColor = .purple
        addSubview(imageView)
        imageView.fillSuperview()
//            var delegate: getSelectedItemDelegate

        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

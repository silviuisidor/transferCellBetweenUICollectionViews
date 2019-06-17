//
//  ExtrasDetailCell.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/13/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

//protocol ExtraDetailCellDelegate {
//    func delete(cell: ExtrasDetailCell)
//}
class ExtrasDetailCell: UICollectionViewCell {

//    var delegate: ExtraDetailCellDelegate?
    
    static var extrascellId = "cellId"
    
    var extras: Extras?
    
    let titleLabel = UILabel(text: "Bacon", font: .boldSystemFont(ofSize: 16))
    let imageView = UIImageView(image: #imageLiteral(resourceName: "bacon"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        layer.cornerRadius = 16
        clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFit
        titleLabel.textAlignment = .center
        
        let stackView = VerticalStackView(arrangedSubviews: [imageView, titleLabel], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview()
//        delegate?.delete(cell: self)
        
        //AppDetailController().collectionView.reloadData()
        //IncludesController().collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

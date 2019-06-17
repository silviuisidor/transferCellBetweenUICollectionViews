//
//  ViewController.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/13/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {

    let detailCellId = "detailCellId"
    let includeExtrasCellId = "includeExtrasCellId"
    let extrasCellId = "extrasCellId"
    

    var imageList = [UIImage]()
    var includeData = ["a"]
    var extrasData = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(IncludesCell.self, forCellWithReuseIdentifier: includeExtrasCellId)
        collectionView.register(ExtrasCell.self, forCellWithReuseIdentifier: extrasCellId)
        
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //includeExtrasArray()

    }
    
//    func includeExtrasArray() {
//
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.reloadData()
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: includeExtrasCellId, for: indexPath) as! IncludesCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: extrasCellId, for: indexPath) as! ExtrasCell
            
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            // calculate the necessary size for our cell somehow
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            // dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
        } else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 125)
        } else {
             return .init(width: view.frame.width, height: 400)
        }
        
    }
    


    
}


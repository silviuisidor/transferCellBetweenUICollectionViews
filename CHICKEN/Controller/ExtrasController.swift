//
//  ExtrasController.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/13/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

//#1 create a notification name
extension Notification.Name {
    static let getSelectedItem = Notification.Name("getSelectedItem")

}
protocol getSelectedItemDelegate {
    func getSelectedItem(item: Extras)
}

class ExtrasController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var extras = [Extras]()
    
    var delegate1: getSelectedItemDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
    
        collectionView.register(ExtrasDetailCell.self, forCellWithReuseIdentifier: ExtrasDetailCell.extrascellId)
        collectionView.contentInset = .init(top: 16, left: 16, bottom: 0, right: 16)
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
         self.collectionView.allowsSelection = true
        
        
        
        extras.append(Extras(id: UUID().uuidString, imageName: "bacon", calories: 343, price: 343, quantity: 4343))
        extras.append(Extras(id: UUID().uuidString, imageName: "bacon", calories: 343, price: 343, quantity: 4343))
        extras.append(Extras(id: UUID().uuidString, imageName: "bacon", calories: 343, price: 343, quantity: 4343))
        
        //#3 add observer for nottification
        NotificationCenter.default.addObserver(self, selector: #selector(handleGetSelectedItemFromIncludesController(notification:)), name: .getSelectedItemFromIncludesController, object: nil)
        }
    
    //#4 do something when you got the notification
    @objc func handleGetSelectedItemFromIncludesController(notification: Notification) {
        if let items = notification.object as? Extras {
            extras.append(items)
            collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return extras.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtrasDetailCell.extrascellId, for: indexPath) as! ExtrasDetailCell
        cell.extras = extras[indexPath.item]
        
//        cell.delegate = self
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = extras[indexPath.item]

        
        delegate1?.getSelectedItem(item: selectedItem)
        
        //#2 set the selected item to the notification
        let getSeletedItemNotification = Notification(name: .getSelectedItem, object: selectedItem, userInfo: nil)
        //#3 post the notification
        
        NotificationCenter.default.post(getSeletedItemNotification)

        extras.remove(at: indexPath.item)
        self.collectionView.performBatchUpdates({
            self.collectionView.deleteItems(at: [indexPath])
        }) { (finished) in
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        }

        
    }

}

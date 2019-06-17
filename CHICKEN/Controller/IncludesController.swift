//
//  IncludesController.swift
//  CHICKEN
//
//  Created by Donald McAllister on 6/13/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//


//set notification name
extension Notification.Name {
    static let getSelectedItemFromIncludesController = Notification.Name("getSelectedItemFromIncludesController")
}

import UIKit

class IncludesController: HorizontalSnappingController, getSelectedItemDelegate {
    func getSelectedItem(item: Extras) {
        extras.append(item)
    }
    
    var extras = [Extras]()
   
    let cellId = "cellId"
    var sectionsCount = 0
 
    var tally = 0 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.register(IncludeTheseExtrasCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
    
        collectionView.dataSource = self
        
        //#3 add observer for nottification
         NotificationCenter.default.addObserver(self, selector: #selector(handleDidCreateShoppingList(notification:)), name: .getSelectedItem, object: nil)
        
      
        extras.append(Extras(id: UUID().uuidString, imageName: "bacon", calories: 545, price: 545, quantity: 544))
        
    }
    
    //#4 do something when you got the notification
    @objc func handleDidCreateShoppingList(notification: Notification) {
        if let items = notification.object as? Extras {
             extras.append(items)
            
            collectionView.reloadData()
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("extras count", extras.count)
        return extras.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IncludeTheseExtrasCell
        
        cell.extras = extras[indexPath.item]
       
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        //remove item on tap
        let selectedItem = extras[indexPath.item]
        print(extras[indexPath.item])
        extras.remove(at: indexPath.item)
        
        
        self.collectionView.performBatchUpdates({
            self.collectionView.deleteItems(at: [indexPath])
        }) { (finished) in
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        }
        
        //#2 set the selected item to the notification
        let notification2 = Notification(name: .getSelectedItemFromIncludesController, object: selectedItem, userInfo: nil)
        
        //#3 post the notification
        NotificationCenter.default.post(notification2)

   }

}

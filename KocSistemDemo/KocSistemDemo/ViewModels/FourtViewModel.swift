//
//  FourtViewModel.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit

class FourthViewModel : NSObject, SelectedItemDeleteProtocol {
    
    let apiService = Service()
    var itemList : [TrackResponse] = []
    var didDataFetchedCompletion : () -> () = { }
    var didDetailClicked : (TrackResponse) -> () = { item in}
    
    override init() {
        super.init()
        apiService.fetchData { reponse in
            guard let data = reponse.results else {return}
            self.itemList = data
            self.didDataFetchedCompletion()
        }
    }
    
    func setCollectionViewConfig(collection : UICollectionView) {
        collection.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
    }
    
    func deleteSelectedItem(trackID: Int) {
        print(trackID)
        itemList.forEach { x in
            if x.trackId == trackID {
                itemList.remove(object: x)
                didDataFetchedCompletion()
            }
        }
        NotificationCenter.default.post(name: .deleteItem, object: nil, userInfo: ["deleteItem" : trackID])
    }
}

extension FourthViewModel : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.identifier, for: indexPath) as! FourthCollectionViewCell
        fourthCell.loadData(data: itemList[indexPath.row])
        fourthCell.delegate = self
        return fourthCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didDetailClicked(itemList[indexPath.row])
    }
}

extension Array where Element: Equatable {

   // Remove first collection element that is equal to the given `object`:
   mutating func remove(object: Element) {
       guard let index = firstIndex(of: object) else {return}
       remove(at: index)
   }

}

//
//  ThirdViewModel.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit

class ThirdViewModel : NSObject {
    
    let apiService = Service()
    var itemList : [TrackResponse] = []
    var didDataFetchedCompletion : () -> () = { }
    
    override init() {
        super.init()
        apiService.fetchData { reponse in
            guard let data = reponse.results else {return}
            self.itemList = data
            self.didDataFetchedCompletion()
        }
    }
    
    func setCollectionViewConfig(collection : UICollectionView) {
        collection.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
    }
    
}
extension ThirdViewModel : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.identifier, for: indexPath) as! ThirdCollectionViewCell
        thirdCell.loadData(data: itemList[indexPath.row])
        return thirdCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let padding = 5
            let width = (collectionView.frame.size.width - CGFloat(padding) * 2) / CGFloat(2)
            let height = width / 200 * 110 // or what height you want to do
            return CGSize(width: width, height: height)
    }
    
}

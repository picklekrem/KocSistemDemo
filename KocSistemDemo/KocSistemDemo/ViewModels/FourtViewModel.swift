//
//  FourtViewModel.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit

class FourthViewModel : NSObject {
    
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
        collection.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
    }
}

extension FourthViewModel : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.identifier, for: indexPath) as! FourthCollectionViewCell
        fourthCell.loadData(data: itemList[indexPath.row])
        return fourthCell
    }
}

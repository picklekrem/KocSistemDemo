//
//  SecondViewModel.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit

class SecondViewModel : NSObject {
    
    let apiService = Service()
    var itemList : [TrackResponse] = []
    var didDataFetchedCompletion : (Int) -> () = {count in}
    
    override init() {
        super.init()
    }
    
    func getData() {
        apiService.fetchData { reponse in
            guard let data = reponse.results else {return}
            self.itemList = data
            self.didDataFetchedCompletion(self.itemList.count)
        }
    }

    func setTableViewConfig(table : UITableView) {
        table.setDefaultConfig()
        table.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}

extension SecondViewModel : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let secondCell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        secondCell.loadData(data: itemList[indexPath.row])
        return secondCell
    }
}

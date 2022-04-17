//
//  FirstViewModel.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit
//import Alamofire


class FirstViewModel : NSObject {
    
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
    
    func setTableViewConfig(table : UITableView) {
        table.setDefaultConfig()
        table.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
}

extension FirstViewModel : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
        firstCell.loadData(data: itemList[indexPath.row])
        return firstCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didDetailClicked(itemList[indexPath.row])
    }
    
}

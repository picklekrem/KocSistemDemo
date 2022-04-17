//
//  FirstViewModel.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit

class FirstViewModel : NSObject {
    
    let apiService = Service()
    var itemList : [TrackResponse] = []
    var didDataFetchedCompletion : () -> () = { }
    var didDetailClicked : (TrackResponse) -> () = { item in}
    
    override init() {
        super.init()
//        fetching data
        apiService.fetchData { reponse in
            guard let data = reponse.results else {return}
            self.itemList = data
            self.didDataFetchedCompletion()
        }
//        item delete notification set
        NotificationCenter.default.addObserver(self, selector: #selector(self.deleteItemObserver(_:)), name: .deleteItem, object: nil)
    }
//    tableview settings
    func setTableViewConfig(table : UITableView) {
        table.setDefaultConfig()
        table.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
//    delete item action
    @objc func deleteItemObserver(_ sender : Notification) {
        let trackID = sender.userInfo?["deleteItem"] as? Int ?? 0
        itemList.forEach { x in
            if x.trackId == trackID {
                itemList.remove(object: x)
                didDataFetchedCompletion()
            }
        }
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

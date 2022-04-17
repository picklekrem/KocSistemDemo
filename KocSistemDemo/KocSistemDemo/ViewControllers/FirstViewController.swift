//
//  ViewController.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var navBarView: XibView!
    @IBOutlet weak var firstTableView: UITableView!
    
    var viewModel = FirstViewModel()
    var selectedItem : TrackResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setting tableview settings, delegates and datasources
        viewModel.setTableViewConfig(table: firstTableView)
        viewModel.didDataFetchedCompletion = {
            DispatchQueue.main.async {
                self.firstTableView.reloadData()
            }
        }
//        click action completion and segue
        viewModel.didDetailClicked = { item in
            self.selectedItem = item
            self.performSegue(withIdentifier: "detailSegue", sender: nil)
        }
//        navBarView change notification set
        NotificationCenter.default.addObserver(self, selector: #selector(self.observerUpdate(_:)), name: .changeText, object: nil)
    }
    
//    navBarView notification action set
    @objc func observerUpdate(_ sender : Notification) {
        let text = sender.userInfo?["newText"] as? String ?? ""
        print(text)
        NotificationCenter.default.post(name: .textUpdate, object: nil, userInfo: ["updateText" : text])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let detailVc = segue.destination as? DetailViewController {
                guard let data = selectedItem else { return }
                detailVc.updateUI(data: data)
            }
        }
    }
}

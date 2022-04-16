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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModel.setTableViewConfig(table: firstTableView)
        viewModel.didDataFetchedCompletion = {
            DispatchQueue.main.async {
                self.firstTableView.reloadData()
            }
        }
    }
}


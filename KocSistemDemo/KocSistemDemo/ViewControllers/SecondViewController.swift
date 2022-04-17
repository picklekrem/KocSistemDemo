//
//  SecondViewController.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var navBarView: XibView!
    @IBOutlet weak var resultCountLabel: UILabel!
    
    var viewModel = SecondViewModel()
    var selectedItem : TrackResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setTableViewConfig(table: secondTableView)
        viewModel.getData()
        viewModel.didDataFetchedCompletion = { count in
            DispatchQueue.main.async {
                self.secondTableView.reloadData()
                self.resultCountLabel.text = "\(count) adet sonuç bulundu."
            }
        }
        viewModel.didDetailClicked = { item in
            print(item)
            self.selectedItem = item
            self.performSegue(withIdentifier: "detailSegue", sender: nil)
        }
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

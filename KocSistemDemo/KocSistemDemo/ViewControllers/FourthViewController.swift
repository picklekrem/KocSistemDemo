//
//  FourthViewController.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var fourthCollectionView: UICollectionView!
    @IBOutlet weak var navBarView: XibView!
    
    var viewModel = FourthViewModel()
    var selectedItem : TrackResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCollectionViewConfig(collection: fourthCollectionView)
        viewModel.didDataFetchedCompletion = {
            DispatchQueue.main.async {
                self.fourthCollectionView.reloadData()
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

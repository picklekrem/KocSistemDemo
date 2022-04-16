//
//  ThirdViewController.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var navBarView: XibView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    var viewModel = ThirdViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCollectionViewConfig(collection: thirdCollectionView)
        viewModel.didDataFetchedCompletion = {
            DispatchQueue.main.async {
                self.thirdCollectionView.reloadData()
            }
        }
    }

}

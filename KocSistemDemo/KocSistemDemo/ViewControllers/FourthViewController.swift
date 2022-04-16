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
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setCollectionViewConfig(collection: fourthCollectionView)
    }

}

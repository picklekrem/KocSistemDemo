//
//  NavBarView.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class NavBarView: UIView {

    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var navBarNameLabel: UILabel!
    
    override init(frame : CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

//
//  CellCustomView.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class CellCustomView: UIView {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customLabel: UILabel!
    
    override init(frame : CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

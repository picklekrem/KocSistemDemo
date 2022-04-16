//
//  ThirdCollectionViewCell.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {

    static let identifier = "ThirdCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ThirdCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.cardView()
    }

    func loadData(data : TrackResponse) {
        artistLabel.text = data.artistName
        trackLabel.text = data.trackName
    }
}

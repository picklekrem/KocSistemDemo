//
//  FourthCollectionViewCell.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit
import SDWebImage

class FourthCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FourthCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FourthCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.cardView()
    }

    
    func loadData(data : TrackResponse) {
        artistLabel.text = data.artistName
        trackLabel.text = data.trackName
        dateLabel.text = data.releaseDate
        priceLabel.text = "\(data.trackPrice)"
        let imageUrl = URL(string: data.artworkUrl100)
        fourthImageView.sd_setImage(with: imageUrl, completed: nil)
    }
}

//
//  FourthCollectionViewCell.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit
import SDWebImage

//Setting the protocol for delete item
protocol SelectedItemDeleteProtocol {
    func deleteSelectedItem(trackID: Int)
}


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
    
    var delegate: SelectedItemDeleteProtocol? = nil
    var trackID = Int()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.cardView()
    }

    func loadData(data : TrackResponse) {
        artistLabel.text = data.artistName
        trackLabel.text = data.trackName
        dateLabel.text = data.releaseDate?.getDisplayDate() ?? ""
        priceLabel.text = data.trackPrice?.getCurrency ?? ""
        let imageUrl = URL(string: data.artworkUrl100)
        fourthImageView.sd_setImage(with: imageUrl, completed: nil)
        trackID = data.trackId ?? 0
    }
//    trigger the delete protocol
    @IBAction func deleteItemClicked(_ sender: UIButton) {
        delegate?.deleteSelectedItem(trackID: trackID)
    }
}

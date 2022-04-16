//
//  SecondTableViewCell.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    static let identifier = "SecondTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

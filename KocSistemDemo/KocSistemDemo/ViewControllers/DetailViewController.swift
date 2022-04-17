//
//  DetailViewController.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit
import SDWebImage
import SafariServices

class DetailViewController: UIViewController {

    var detailItem : TrackResponse?
    var artistWebURL = ""
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        print(detailItem)
    }
    
    func updateUI(data : TrackResponse) {
        DispatchQueue.main.async {
            let imageUrl = URL(string: data.artworkUrl100)
            self.detailImageView.sd_setImage(with: imageUrl, completed: nil)
            self.trackNameLabel.text = data.trackName
            self.artistNameLabel.text = data.artistName
            self.albumNameLabel.text = data.collectionName
            self.priceLabel.text = data.trackPrice?.getCurrency ?? ""
            self.releaseDateLabel.text = data.releaseDate?.getDisplayDate() ?? ""
            self.artistWebURL = data.artistViewUrl ?? ""
        }
    }
    
    @IBAction func artistPageClicked(_ sender: UIButton) {
        if artistWebURL == "" {
            self.makeAlert(titleInput: "Sorry", messageInput: "This artist has no page :(")
        } else {
            guard let url = URL(string: artistWebURL) else {return}
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    
    
    @IBAction func closeClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

//
//  Extensions.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import Foundation
import UIKit


extension UITableView {
    func setDefaultConfig() {
        backgroundColor = .clear
        backgroundView = nil
        rowHeight = UITableView.automaticDimension
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension
        separatorStyle = .none
    }
}
extension UIViewController {
    
    func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIView {
    func cardView() {
        self.backgroundColor = .systemBackground
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }
}


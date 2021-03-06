//
//  NavBarView.swift
//  KocSistemDemo
//
//  Created by Ekrem Özkaraca on 16.04.2022.
//

import UIKit

class NavBarView: UIView {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var navBarNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editPop))
        self.backView.isUserInteractionEnabled = true
        self.backView.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(self.textUpdate(_:)), name: .textUpdate, object: nil)
    }
    
    @objc func textUpdate(_ sender : Notification) {
        let text = sender.userInfo?["updateText"] as? String ?? ""
        navBarNameLabel.text = text
    }
    
    @objc func editPop() {
        openEditAlert()
    }
    
//    Setting alert view
    func openEditAlert() {
        //Create Alert Controller
        let alert = UIAlertController (title: "Edit:", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        //Create Cancel Action
        let cancel = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)

        //Create OK Action
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in print("OK")
            let textfield = alert.textFields?[0]
            print(textfield?.text!)
            self.navBarNameLabel.text = textfield?.text!
            NotificationCenter.default.post(name: .changeText, object: nil, userInfo: ["newText" : textfield?.text!])
        }

        alert.addAction(okAction)

        //Add Text Field
        alert.addTextField { (textfield: UITextField) in
            textfield.placeholder = "Enter anything"
        }
        
        //Present Alert Controller
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

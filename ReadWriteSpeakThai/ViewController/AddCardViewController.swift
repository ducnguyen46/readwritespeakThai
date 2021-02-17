//
//  AddCardViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/14/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var keyWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view
        
        parentView.backgroundColor = ColorConstant.primaryColor
        
        contentView.backgroundColor = ColorConstant.lightGray
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        infoLabel.textBold(label:infoLabel, normalText1:  "This is ", boldText: "your deck", normalText2: ", add freely cards from the words in the app", fontSize: 16.0)
        
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
    }

    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }
}

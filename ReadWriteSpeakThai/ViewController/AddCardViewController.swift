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
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var keyWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigation
        navigationController?.navigationBar.barTintColor = ColorConstant.primaryColor
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        navigationItem.title = "Deck Overview"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(
                ofSize: 18,
                weight: .bold)
        ]
        
        let backRoundButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        backRoundButton.backgroundColor = UIColor.white
        backRoundButton.layer.cornerRadius = 0.5 * backRoundButton.bounds.size.width
        backRoundButton.setImage(UIImage(named: "ic-back"), for: .normal)
        backRoundButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
        
        let backBarButton = UIBarButtonItem()
        backBarButton.customView = backRoundButton
        
        navigationItem.leftBarButtonItems = [backBarButton]
        
        
        let coinValueButton = UIButton()
        coinValueButton.semanticContentAttribute = .forceRightToLeft
        coinValueButton.setImage(UIImage(named: "ic-coin"), for: .normal)
        coinValueButton.setTitle("1000", for: .normal)
        coinValueButton.setTitleColor(UIColor.white, for: .normal)
        coinValueButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        coinValueButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
        
        let coinValueBarButton = UIBarButtonItem()
        coinValueBarButton.customView = coinValueButton
        
        navigationItem.rightBarButtonItems = [coinValueBarButton]
        
        //view
        
        parentView.backgroundColor = ColorConstant.primaryColor
        
        contentView.backgroundColor = ColorConstant.lightGray
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        infoLabel.textBold(label:infoLabel, normalText1:  "This is ", boldText: "your deck", normalText2: ", add freely cards from the words in the app", fontSize: 16.0)
        
        
        
    }
    
    @objc func backToPreviousViewController(){
            self.navigationController?.popViewController(animated: true)
    }

}

//
//  FlashCardViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/9/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class FlashCardViewController: UIViewController {

    @IBOutlet var parentView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cardView: UIView!
       
    @IBOutlet weak var titleInfoLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation
        navigationController?.navigationBar.barTintColor = ColorConstant.primaryColor
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        navigationItem.title = "Flash Card"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(
                ofSize: 18,
                weight: .bold)
        ]
        
        let backRoundButton = UIButton()
        backRoundButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backRoundButton.backgroundColor = UIColor.white
        backRoundButton.layer.cornerRadius = 0.5 * backRoundButton.bounds.size.width
        backRoundButton.setImage(
            UIImage(named: "ic-back"), for: .normal)
        
        let backBarButton = UIBarButtonItem()
        backBarButton.customView = backRoundButton
        navigationItem.leftBarButtonItem = backBarButton
        
        // Do any additional setup after loading the view.
        
        
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

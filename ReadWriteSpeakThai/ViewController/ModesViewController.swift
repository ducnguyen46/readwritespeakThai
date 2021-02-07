//
//  ModesViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/7/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class ModesViewController: UIViewController {
    //view
    @IBOutlet var parentView: UIView!
    
    
    //
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentView.backgroundColor = ColorConstant.primaryColor
        
        appNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        appNameLabel.textColor = UIColor.white
        screenNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        coinValueLabel.textColor = UIColor.white
        
        infoLabel.text = "Select one of the different mode to work on"
        infoLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        infoLabel = infoLabel.textBold(label: infoLabel, boldText: "mode", fontSize: 16)
        
        //Rich text bold
        
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


extension UILabel {
    func textBold (label:UILabel, boldText: String, fontSize:CGFloat) -> UILabel {
        
        let attributedBold = NSMutableAttributedString(
            string: boldText,
            attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize)])
        label.attributedText = attributedBold
        return label
    }
}

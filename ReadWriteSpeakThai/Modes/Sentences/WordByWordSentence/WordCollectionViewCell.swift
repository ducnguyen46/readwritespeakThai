//
//  WordCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 14/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WordCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var simpleThaiLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.backgroundColor = UIColor.white
        parentView.layer.cornerRadius = 20
        wordLabel.textColor = ColorConstant.primaryColor
        simpleThaiLabel.textColor = ColorConstant.blackDark
        englishLabel.textColor = ColorConstant.darkGray
        
        parentView.layer.shadowOffset = CGSize(width: 5, height: 20)
        parentView.layer.shadowColor = ColorConstant.blackDark.cgColor
        parentView.layer.shadowOpacity = 0.2
        parentView.layer.shadowRadius = 90
    }


}

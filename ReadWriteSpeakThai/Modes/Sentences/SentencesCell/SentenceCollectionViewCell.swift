//
//  SentenceCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/22/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class SentenceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var sentencesLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var pronounceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.backgroundColor = UIColor.white
        parentView.layer.cornerRadius = 20
        sentencesLabel.textColor = UIColor.black
        englishLabel.textColor = ColorConstant.blackDark
        pronounceLabel.textColor = UIColor.black
        
        parentView.layer.shadowOffset = CGSize(width: 5, height: 20)
        parentView.layer.shadowColor = ColorConstant.blackDark.cgColor
        parentView.layer.shadowOpacity = 0.2
        parentView.layer.shadowRadius = 90
    }

}

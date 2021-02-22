//
//  VerbCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/15/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class VerbCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var transLabel: UILabel!
    @IBOutlet weak var trans2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wordLabel.textColor = ColorConstant.primaryColor
        wordLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        transLabel.textColor = ColorConstant.darkGray
        transLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        trans2Label.textColor = ColorConstant.darkGray
        trans2Label.font = .systemFont(ofSize: 14, weight: .regular)
    }

}

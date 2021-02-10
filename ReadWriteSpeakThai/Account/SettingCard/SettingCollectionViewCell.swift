//
//  SettingCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/9/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var settingInfoLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        settingTitleLabel.textColor = ColorConstant.primaryColor
        
        settingInfoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        settingInfoLabel.textColor = ColorConstant.darkGray
        
//        actionButton.setTitle("", for: .normal)
//        actionButton.setImage(UIImage(named: "ic-more"), for: .normal)
    }

}

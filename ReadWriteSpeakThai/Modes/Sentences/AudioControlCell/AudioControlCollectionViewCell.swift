//
//  AudioControlCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/22/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class AudioControlCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.backgroundColor = UIColor.clear
        titleLabel.textColor = ColorConstant.darkGray
    }

}

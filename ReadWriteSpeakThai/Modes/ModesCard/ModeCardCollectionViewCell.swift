//
//  ModeCardCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/8/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class ModeCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.backgroundColor = UIColor.white
        parentView.layer.cornerRadius = 15
        
        actionButton.backgroundColor = ColorConstant.primaryColor
        actionButton.layer.cornerRadius = 15
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
    }

}

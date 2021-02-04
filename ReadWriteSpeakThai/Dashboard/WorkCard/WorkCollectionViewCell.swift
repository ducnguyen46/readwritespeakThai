//
//  WorkCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/4/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WorkCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleWorkCard: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        actionButton.layer.cornerRadius = 0.5 * actionButton.bounds.size.width
        actionButton.backgroundColor = ColorConstant.redLightColor
        titleWorkCard.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight(0.7))
        titleWorkCard.textColor = ColorConstant.blackDark
    }

}

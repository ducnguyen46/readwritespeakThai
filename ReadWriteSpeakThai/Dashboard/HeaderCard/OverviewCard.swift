//
//  OverviewCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/3/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class OverviewCard: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleCard: UILabel!
    @IBOutlet weak var overviewButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 15.0
        parentView.backgroundColor = UIColor.white
                
        titleCard.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight(0.7))
        overviewButton.layer.cornerRadius = 20.0
        overviewButton.backgroundColor = ColorConstant.primaryColor
        overviewButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight:  UIFont.Weight(0.7))
        
    }

}

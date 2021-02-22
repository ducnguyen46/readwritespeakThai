//
//  BookSelectionCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/20/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class BookSelectionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleCell: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                parentView.backgroundColor = ColorConstant.primaryColor
                
                titleCell.textColor = UIColor.white
            } else {
                parentView.backgroundColor = UIColor.clear
                
                titleCell.textColor = ColorConstant.primaryColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        parentView.layer.borderWidth = 1
        parentView.layer.borderColor = ColorConstant.primaryColor.cgColor
        parentView.layer.cornerRadius = 0.5 * parentView.bounds.size.height
    }
}

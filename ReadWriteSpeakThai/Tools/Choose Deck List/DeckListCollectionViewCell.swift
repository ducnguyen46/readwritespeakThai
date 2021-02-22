//
//  DeckListCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/10/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class DeckListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleCard: UILabel!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var actionButton: ShowDeckListButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleCard.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleCard.textColor = ColorConstant.purple
        
        listName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        listName.textColor = UIColor.white
        
        listView.backgroundColor = ColorConstant.purple
        
    }
    
}

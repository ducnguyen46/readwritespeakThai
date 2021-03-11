//
//  WordBoardCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 11/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WordBoardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 5
    }

}

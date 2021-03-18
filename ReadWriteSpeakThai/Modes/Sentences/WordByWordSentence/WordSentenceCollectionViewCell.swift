//
//  WordSentenceCollectionViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 11/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WordSentenceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imagePlayButton: UIImageView!
    @IBOutlet weak var viewPlayButton: UIView!
    
    @IBOutlet weak var thaiLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var thaiSimple: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewPlayButton.backgroundColor = ColorConstant.lightGray
    }

}

//
//  WordSentenceTableViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 12/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WordSentenceTableViewCell: UITableViewCell {
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var viewPlayButton: UIView!
    @IBOutlet weak var thaiLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var simpleThaiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .clear
        viewPlayButton.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  SentenceWordTableViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 19/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class SentenceWordTableViewCell: UITableViewCell {
    @IBOutlet weak var thaiLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thaiLabel.textColor = ColorConstant.darkGray
        englishLabel.textColor = ColorConstant.darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

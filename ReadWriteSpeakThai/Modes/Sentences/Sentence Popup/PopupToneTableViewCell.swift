//
//  PopupToneTableViewCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/28/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class PopupToneTableViewCell: UITableViewCell {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var imageTone: UIImageView!
    @IBOutlet weak var toneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = .clear
//        colorView.layer.cornerRadius = self.contentView.bounds.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

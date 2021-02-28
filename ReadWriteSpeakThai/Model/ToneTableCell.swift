//
//  ToneTableCell.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/28/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import UIKit

class ToneTableCell {
    var color: UIColor
    var toneLabel: String
    var image: String
    
    init(color: UIColor, toneLabel: String, image: String) {
        self.color = color
        self.toneLabel = toneLabel
        self.image = image
    }
    
    static func getListToneCell() -> [ToneTableCell] {
        var list:[ToneTableCell] = []
        
        let toneCell1 = ToneTableCell(color: .systemRed, toneLabel: "High Tone", image: "img-high-tone")
        list.append(toneCell1)
        
        let toneCell2 = ToneTableCell(color: .systemBlue, toneLabel: "Low Tone", image: "img-low-tone")
        list.append(toneCell2)
        
        let toneCell3 = ToneTableCell(color: .black, toneLabel: "Mid Tone", image: "img-mid-tone")
        list.append(toneCell3)
        
        let toneCell4 = ToneTableCell(color: .systemOrange, toneLabel: "Rising Tone", image: "img-rising-tone")
        list.append(toneCell4)
        
        let toneCell5 = ToneTableCell(color: .systemGreen, toneLabel: "Falling Tone", image: "img-falling-tone")
        list.append(toneCell5)
        
        return list
    }
}

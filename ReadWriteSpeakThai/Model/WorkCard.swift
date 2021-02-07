//
//  WorkCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/5/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import UIKit

class WorkCard {
    var title: String
    var colorCard: UIColor
    
    init(title: String, colorCard:UIColor) {
        self.title = title
        self.colorCard = colorCard
    }
    public func getTitle() -> String{
        return self.title
    }
    public func getColorCard() -> UIColor {
        return self.colorCard
    }
}

extension WorkCard {
    static func getWordCard() -> [WorkCard]{
        let workCardTitle: [String] = ["Sentences", "Words", "Conversations", "Consonants", "Vowels", "Numbers", "Alphabet Grid", "Videos", "Pictures"]
        let colors = ColorConstant.getLightColor()
        
        var workCards: [WorkCard] = []
        for i in 0...workCardTitle.count - 1 {
            workCards.append(
                WorkCard(
                    title: workCardTitle[i], colorCard:
                    colors[Int.random(in: 0...colors.count - 1)])
            )
        }
        
        return workCards
    }
}

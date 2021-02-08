//
//  ModeCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/8/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import UIKit

class ModeCard {
    var image: String
    var buttonTitle: String
    var available: Bool
    
    init(image:String, buttonTitle: String, available:Bool) {
        self.image = image
        self.buttonTitle = buttonTitle
        self.available = available
    }
    
    func getImage() -> String {
        return image
    }
    
    func getButtonTitle() -> String {
        return buttonTitle
    }
    func getStatusAvailable() -> Bool {
        return available
    }
}

extension ModeCard {
    static func getModeCards() -> [ModeCard] {
        var modeCards: [ModeCard] = []
        let modeCardTitle: [String] = ["Sentences", "Words", "Conversations", "Consonants", "Vowels", "Numbers", "Alphabet Grid" , "Videos", "Pictures"]
        
        for str in modeCardTitle {
            var avai: Bool?
            if str == "Videos" || str == "Pictures" {
                avai = false
            } else {
                 avai = true
            }
            
            modeCards.append(ModeCard(image: "img-\(str)", buttonTitle: "\(str)", available: avai ?? true))
        }
       
        return modeCards
    }
}

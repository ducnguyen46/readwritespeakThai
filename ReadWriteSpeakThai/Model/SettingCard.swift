//
//  SettingCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/9/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class SettingCard {
    var settingTitle: String
    var settingInfo: String
    
    init(settingTitle: String, settingInfo: String) {
        self.settingTitle = settingTitle
        self.settingInfo = settingInfo
    }
    
    func getSettingTitle() -> String {
        return settingTitle
    }
    
    func getSettingInfo() -> String {
        return settingInfo
    }
}

extension SettingCard {
    static func getSettingCardList() -> [SettingCard]{
        var settingCards:[SettingCard] = []
        let dic: [String:String] = ["Ignored cards":"Card that you ignore",
                                    "Purchase History":"All the item that you bought",
                                    "Rate app":"Card that you ignore",
                                    "Setting Account":"Change persional information"]
        
        for (key, value) in dic {
            settingCards.append(SettingCard(settingTitle: key, settingInfo: value))
        }
            
        return settingCards
    }
}

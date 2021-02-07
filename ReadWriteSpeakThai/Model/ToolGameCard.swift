//
//  ToolGameCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/5/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import UIKit

class ToolGameCard {
    var title: String
    var icon: String
    
    init(title:String, icon: String) {
        self.title = title
        self.icon = icon
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getIcon() -> String {
        return icon
    }
}

extension ToolGameCard {
    static func getToolGameCards() -> [ToolGameCard]{
        let toolGameCards: [ToolGameCard] = [
            ToolGameCard(title: "Find a teacher", icon: "ic-search"),
            ToolGameCard(title: "Analyse Thai text", icon: "ic-analyse"),
            ToolGameCard(title: "Find the translation", icon: "ic-search"),
            ToolGameCard(title: "Find the sound", icon: "ic-search"),
            ToolGameCard(title: "Edit Dashboard", icon: "ic-pencil")
        ]
        
        return toolGameCards
    }
}

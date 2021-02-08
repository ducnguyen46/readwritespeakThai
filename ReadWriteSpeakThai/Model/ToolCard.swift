//
//  ToolCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/8/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
class ToolCard {
    
    var image: String
    var buttonTitle: String
    var available: Bool
    
    init(image: String, buttonTitle: String, available: Bool) {
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

extension ToolCard {
    static func getToolCards() -> [ToolCard]{
        let toolCardTitle:[String] = ["Find a Teacher", "Analyse Thai Text", "Flashcard", "Thai Keyboards",
                                        "Image to text", "Sport Mode", "Find the translation", "Find the sound"]
        var toolCards: [ToolCard] = []
        for str in toolCardTitle {
            
            var status: Bool?
            
            switch str {
            case "Thai Keyboards":
                status = false
                break
            case "Image to text":
                status = false
                break
            case "Sport Mode":
                status = false
                break
            default:
                status = true
                break
            }
            toolCards.append(ToolCard(image: "img-\(str)", buttonTitle: str, available: status ?? true))
        }
        return toolCards
    }
}

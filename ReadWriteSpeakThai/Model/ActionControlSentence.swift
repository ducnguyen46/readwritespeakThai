//
//  ActionControlSentence.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/23/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import UIKit

class ActionControlSentence {
    var title: String?
    var image: String?
    
    convenience init(title: String, image: String) {
        self.init()
    }
    
    func getACSList() -> [ActionControlSentence]{
        var list: [ActionControlSentence] = []
        let action = ActionControlSentence()
        action.title = "Translate"
        action.image = "img-Translate"
        list.append(action)
        
        let action1 = ActionControlSentence()
        action1.title = "Font"
        action1.image = "img-Font"
        list.append(action1)
        
        let action2 = ActionControlSentence()
        action2.title = "Spelling"
        action2.image = "img-Spelling"
        list.append(action2)
        
        let action3 = ActionControlSentence()
        action3.title = "Space"
        action3.image = "img-Space"
        list.append(action3)
        
        let action4 = ActionControlSentence()
        action4.title = "More"
        action4.image = "img-More"
        list.append(action4)
        
        return list
    }
}

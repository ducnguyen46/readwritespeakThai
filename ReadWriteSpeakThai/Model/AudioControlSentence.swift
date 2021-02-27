//
//  AudioControlSentence.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/23/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
import UIKit

class AudioControlSentence {
    var title: String?
    var image: String?
    
    convenience init(title: String, image: String) {
        self.init()
    }
    
    func getACSList() -> [AudioControlSentence]{
        var list: [AudioControlSentence] = []
        let action = AudioControlSentence()
        action.title = "0"
        action.image = "ic-step-back"
        list.append(action)
        
        let action1 = AudioControlSentence()
        action1.title = "-10"
        action1.image = "ic-skip-back"
        list.append(action1)
        
        let action2 = AudioControlSentence()
        action2.title = "+10"
        action2.image = "ic-skip-back"
        list.append(action2)
        
        let action3 = AudioControlSentence()
        action3.title = "Shuffle"
        action3.image = "ic-shuffle"
        list.append(action3)
        
        let action4 = AudioControlSentence()
        action4.title = "Auto Play"
        action4.image = "ic-auto-play"
        list.append(action4)
        
        let action5 = AudioControlSentence()
        action5.title = "Repeat"
        action5.image = "ic-repeat"
        list.append(action5)
        
        return list
    }
}

//
//  VerbCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/15/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class VerbCard {
    var word: String
    var trans: String
    var trans2: String
    
    init(word: String, trans: String, trans2: String){
        self.word = word
        self.trans = trans
        self.trans2 = trans2
    }
    
    static func getListVerbCard() -> [VerbCard]{
        var verbList: [VerbCard] = [
        VerbCard(word: "ไป - bpai", trans: "[v] go, move, wend, hark, betake, resort", trans2: "[adv] too, overly"),
        VerbCard(word: "กิน - gin", trans: "[v] eat, consume, take, bite", trans2: "[v] use, take, spend, require, use up")
        ]
        
        for _ in 0...10 {
            verbList.append(verbList[Int.random(in: 0...1)])
        }
        print(verbList)
        return verbList
    }
}

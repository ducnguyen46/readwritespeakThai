//
//  SentenceCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/23/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class SentenceCard {
    var sentence: String?
    var englishSentence: String?
    var thaiPronounce: String?
    
    func getSentenceCardList() -> [SentenceCard]{
        var list: [SentenceCard] = []
        
        let sentenceCard: SentenceCard = SentenceCard()
        sentenceCard.sentence = "อาหารเช้าพร้อมแล้ว"
        sentenceCard.englishSentence = "The breakfast is ready"
        sentenceCard.thaiPronounce = "Xāh̄ār chêā phr̂xm læ̂w"
        
        for _ in 0...10 {
            list.append(sentenceCard)
        }
        
        return list
    }
}

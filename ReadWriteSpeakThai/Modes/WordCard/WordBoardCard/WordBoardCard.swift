//
//  WordBoardCard.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 11/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
struct WordBoardCard {
    var img: String?
    var title:String?
    
    static func getListWordBoardCard() -> [WordBoardCard]{
        var listWordBoard: [WordBoardCard] = []
        
        var card = WordBoardCard(img: "img-All The Word", title: "All The Word")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Your Favorite Word", title: "Your Favorite Word")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-frequent words", title: "500 most frequent words")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-frequent words", title: "500 to 1000 most frequent words")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-frequent words", title: "1000 to 2000 most frequent words")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-frequent words", title: "2000 to 3000 most frequent words")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Verb", title: "Verb")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Noun", title: "Noun")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Adjective", title: "Adjective")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Conjunction", title: "Conjunction")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Classifer", title: "Classifer")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Pronouns", title: "Pronouns")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Prepositions", title: "Prepositions")
        listWordBoard.append(card)
        
        card = WordBoardCard(img: "img-Adverbs", title: "Adverbs")
        listWordBoard.append(card)
        
        return listWordBoard
        
    }
}


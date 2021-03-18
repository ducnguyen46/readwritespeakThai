//
//  APIService.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 10/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class APIService {
    
    
    
    private func readLocalFile(forName name: String) -> Any? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
                return json
            }
        } catch {
            print("Khong tim duoc file!")
        }
        
        return nil
    }
    
    func getAllCategories() -> [Category] {
        let jsonArray = readLocalFile(forName: "categories" ) as! [[String:Any]]
        var listCategory = [Category]()
        
        for json in jsonArray {
            
            var category = Category()
            category = category.fromJson(json)
            
            listCategory.append(category)
        }
        return listCategory
    }
    
    func getAllWords() -> [Word]{
        var listWord:[Word] = []
        let jsonArray = readLocalFile(forName: "words") as! [[String: Any]]
        
        for json in jsonArray {
            var word = Word()
            
            word = word.fromJson(json)
            
            listWord.append(word)
        }
        
        return listWord
    }
    
    func getAllNumbers() -> [Number]{
        var jsonArray = readLocalFile(forName: "numbers") as! [[String:Any]]
        var listNumber:[Number] = []
        for json in jsonArray {
            var number:Number = Number()
            number = number.fromJson(json)
            
            listNumber.append(number)
        }
        return listNumber
    }
    
    func getAllSources() -> [Source]{
        var listSource:[Source] = []
        let jsonArray = readLocalFile(forName: "sources") as! [[String:Any]]
        
        for json in jsonArray {
            var source:Source = Source()
            source = source.fromJson(json)
            
            listSource.append(source)
        }
        return listSource
    }
    
    func getAllVowels() -> [Vowel] {
        var listVowel: [Vowel] = []
        let jsonArray = readLocalFile(forName: "vowels") as! [[String: Any]]
        for json in jsonArray {
            var vowel = Vowel()
            vowel = vowel.fromJson(json)
            
            listVowel.append(vowel)
        }
        
        return listVowel
    }
    
    func getAllSentences() -> [Sentence] {
        var listSentence: [Sentence] = []
        let jsonArray = readLocalFile(forName: "sentences") as! [[String:Any]]
        
        for json in jsonArray {
            var sentence = Sentence()
            sentence = sentence.fromJson(json)
            listSentence.append(sentence)
        }
        return listSentence
    }
}

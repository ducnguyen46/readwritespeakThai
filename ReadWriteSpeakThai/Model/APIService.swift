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
            guard let id = json["id"] as? Int,
            let name = json["name"] as? String,
            let order = json["order"] as? Int
            else { return [Category]()}
            
            var category = Category()
            category.id = id
            category.name = name
            category.order = order
            
            listCategory.append(category)
        }
        return listCategory
    }
    
    func getAllWords() -> [Word]{
        var listWord:[Word] = []
        let jsonArray = readLocalFile(forName: "words") as! [[String: Any]]
        
        for json in jsonArray {
            guard let id = json["id"] as? Int,
                  let thai = json["thai"] as? String,
                  let english = json["english"] as? [String],
                  let tone = json["tone"] as? String,
                  let simpleThai = json["simpleThai"] as? [String],
                  let order = json["order"] as? Int,
                  let tPos = json["tPos"] as? [String]
//                  let composed = json["composed"] as? [String]
            
            else {
                return [Word]()
            }
            var word = Word()
            word.id = id
            word.thai = thai
            word.english = english
            word.tone = tone
            word.simpleThai = simpleThai
            word.order = order
            word.tPos = tPos
//            word.composed = composed
            
            listWord.append(word)
        }
        
        return listWord
    }
    
    func getAllNumbers() -> [Number]{
        var jsonArray = readLocalFile(forName: "numbers") as! [[String:Any]]
        var listNumber:[Number] = []
        for json in jsonArray {
            guard let name = json["Name"] as? String,
                  let nameThai = json["NameThai"] as? String,
                  let arabic = json["Arabic"] as? String,
                  let romanization = json["Romanization"] as? String,
                  let comment = json["comment"] as? String,
                  let tone = json["tone"] as? String,
                  let id = json["id"] as? Int
                else {
                return [Number]()
            }
             
            var number:Number = Number()
            number.name = name
            number.nameThai = nameThai
            number.arabic = arabic
            number.romanization = romanization
            number.comment = comment
            number.tone = tone
            number.id = id
            
            listNumber.append(number)
        }
        return listNumber
    }
    
    func getAllSources() -> [Source]{
        var listSource:[Source] = []
        let jsonArray = readLocalFile(forName: "sources") as! [[String:Any]]
        
        for json in jsonArray {
            let name = json["name"] as? String
            let key = json["key"] as? String
            let group = json["group"] as? String
            let disable = json["disabled"] as? Bool
    
            var source:Source = Source()
            source.name = name
            source.key = key
            source.group = group
            source.disable = disable
            
            listSource.append(source)
        }
        return listSource
    }
    
    func getAllVowels() -> [Vowel] {
        var listVowel: [Vowel] = []
        let jsonArray = readLocalFile(forName: "vowels") as! [[String: Any]]
        for json in jsonArray {
            guard let duration = json["Duration"] as? String,
                  let name = json["Name"] as? String,
                  let romanization = json["romanization"] as? String,
                  let word = json["Word"] as? String,
                  let variant = json["Variant"] as? [String],
                  let type = json["Type"] as? String,
                  let simpleThai = json["SimpleThai"] as? [String],
                  let english = json["English"] as? String,
                  let id = json["Id"] as? Int  else {
                return [Vowel]()
            }
            
            let vowel = Vowel(duration: duration, name: name, romanization: romanization, word: word, variant: variant, type: type, simpleThai: simpleThai, english: english, id: id)
            listVowel.append(vowel)
        }
        
        return listVowel
    }
    
    func getAllSentences() -> [Sentence] {
        var listSentence: [Sentence] = []
        let jsonArray = readLocalFile(forName: "sentences") as! [[String:Any]]
        
        for json in jsonArray {
            guard let id = json["id"] as? Int,
                  let thai = json["thai"] as? String,
                  let english = json["english"] as? String,
                  let source = json["source"] as? String,
                  let categories = json["categories"] as? [String],
                  let words = json["words"] as? [Any]
            else {
                return [Sentence]()
            }
            
            var sentence = Sentence(id: id, thai: thai, english: english, source: source, categories: categories, words: words)
            
            listSentence.append(sentence)
        }
        return listSentence
    }
}

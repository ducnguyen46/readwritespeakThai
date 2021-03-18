//
//  vowel.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 10/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class Vowel: NSObject {
    var duration:String = ""
    var name: String = ""
    var romanization: String = ""
    var word: String = ""
    var variant: [String] = []
    var type: String = ""
    var simpleThai: [String] = []
    var english: String = ""
    var id: Int = 0
    
    func fromJson(_ json:[String:Any]) -> Vowel {
        if let duration = json["Duration"] as? String {self.duration = duration}
        if let name = json["Name"] as? String {self.name = name}
        if let romanization = json["romanization"] as? String {self.romanization = romanization}
        if let word = json["Word"] as? String {self.word = word}
        if let variant = json["Variant"] as? [String] {self.variant = variant}
        if let type = json["Type"] as? String {self.type = type}
        if let simpleThai = json["SimpleThai"] as? [String] {self.simpleThai = simpleThai}
        if let english = json["English"] as? String {self.english = english}
        if let id = json["Id"] as? Int {self.id = id}
        
        return self
    }
}

//
//  Sentence.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 11/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation
class Sentence : NSObject{
    var id: Int = 0
    var thai: String = ""
    var english:String = ""
    var source: String = ""
    var categories: [String] = []
    var words: [Any] = []
    var index: Int = -1
    
    func fromJson(_ json: [String: Any]) -> Sentence {
        if let id = json["id"] as? Int {self.id = id}
        if let thai = json["thai"] as? String {self.thai = thai}
        if let english = json["english"] as? String {self.english = english}
        if let source = json["source"] as? String {self.source = source}
        if let categories = json["categories"] as? [String] {self.categories = categories}
        if let words = json["words"] as? [Any] {self.words = words}
        if let index = json["index"] as? Int {self.index = index}
        
        return self
    }
}

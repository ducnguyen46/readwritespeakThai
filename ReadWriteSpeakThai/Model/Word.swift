//
//  Word.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 10/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class Word: NSObject {
    var id: Int = 0
    var thai: String = ""
    var english: [String] = []
    var tone: String = ""
    var simpleThai: [String] = []
    var order: Int = 0
    var tPos: [String] = []
    var composed:[String] = []
    
    func fromJson(_ json: [String: Any]) -> Word{
        if let id = json["id"] as? Int {self.id = id}
        if let thai = json["thai"]  as? String {self.thai = thai}
        if let english = json["english"] as? [String] {self.english = english}
        if let tone = json["tone"] as? String {self.tone = tone}
        if let simpleThai = json["simpleThai"] as? [String] {self.simpleThai = simpleThai}
        if let order = json["order"] as? Int {self.order = order}
        if let tPos = json["tPos"] as? [String] {self.tPos = tPos}
        if let composed = json["composed"] as? [String] {self.composed = composed}
        
        return self
    }
}

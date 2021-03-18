//
//  number.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 10/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class Number: NSObject{
    var name: String = ""
    var nameThai: String = ""
    var arabic: String = ""
    var romanization: String = ""
    var comment: String = ""
    var tone: String = ""
    var id: Int = 0
    
    func fromJson(_ json: [String: Any]) -> Number{
        if let name = json["Name"] as? String {self.name = name}
        if let nameThai = json["NameThai"] as? String {self.nameThai = nameThai}
        if let arabic = json["Arabic"] as? String {self.arabic = arabic}
        if let romanization = json["Romanization"] as? String {self.romanization = romanization}
        if let comment = json["comment"] as? String {self.comment = comment}
        if let tone = json["tone"] as? String {self.tone = tone}
        if let id = json["id"] as? Int {self.id = id}
        
        return self
    }
}

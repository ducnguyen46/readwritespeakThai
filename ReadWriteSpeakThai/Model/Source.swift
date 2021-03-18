//
//  Source.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 10/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

class Source: NSObject {
    var name: String = ""
    var key: String = ""
    var group: String = ""
    var disable: Bool = false
    
    func fromJson(_ json: [String: Any]) -> Source {
        if let name = json["name"] as? String {self.name = name}
        if let key = json["key"] as? String {self.key = key}
        if let group = json["group"] as? String {self.group = group}
        if let disable = json["disabled"] as? Bool {self.disable = disable}
        
        return self
    }
}

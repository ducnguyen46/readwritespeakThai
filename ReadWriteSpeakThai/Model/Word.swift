//
//  Word.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 10/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import Foundation

struct Word {
    var id: Int = 0
    var thai: String = ""
    var english: [String] = []
    var tone: String = ""
    var simpleThai: [String] = []
    var order: Int = 0
    var tPos: [String] = []
//    var composed:[String] = []
}

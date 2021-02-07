//
//  Constant.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/3/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class ColorConstant {
    //instance
    static let instance = ColorConstant()
    //color
    static let primaryColor = UIColor(red:99/255,green:96/255,blue:255/255,alpha:1)
    static let lightGray = UIColor(red: 0.95, green: 0.95, blue: 0.98, alpha: 1)
    static let blackDark = UIColor(red: 0.086, green: 0.09, blue: 0.098, alpha: 1)
    static let lightRed = UIColor(red: 1, green: 0.505, blue: 0.505, alpha: 1)
    static let purple = UIColor(red: 0.389, green: 0.376, blue: 1, alpha: 1)
    static let lightPurple = UIColor(red: 0.389, green: 0.376, blue: 1, alpha: 0.3)
    static let grayPurple = UIColor(red: 0.825, green: 0.825, blue: 1, alpha: 1)
    static let lightOrage = UIColor(red: 1, green: 0.809, blue: 0.633, alpha: 1)
    static let lightPink = UIColor(red: 0.977, green: 0.833, blue: 1, alpha: 1)
    static let lightGreen = UIColor(red: 0.796, green: 1, blue: 0.988, alpha: 1)
    
    private init(){}
    
}

extension ColorConstant {
    static func getLightColor() -> [UIColor]{
        var colors: [UIColor] = []
        colors.append(ColorConstant.lightGray)
        colors.append(ColorConstant.lightPurple)
        colors.append(ColorConstant.lightOrage)
        colors.append(ColorConstant.lightPink)
        colors.append(ColorConstant.lightGreen)
        return colors
    }
}

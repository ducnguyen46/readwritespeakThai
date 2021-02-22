//
//  ShowDeckListButton.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/14/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class ShowDeckListButton: UIButton {
    
    @objc func showDickListButton(_ sender: UIButton, nameOfButton: String, navigation: UINavigationController) {
        switch nameOfButton{
        case "Top 25 Verbs" :
            print("day la cai gi the?")
            
            break
        default:
            print("Day la default")
        }
    }

}

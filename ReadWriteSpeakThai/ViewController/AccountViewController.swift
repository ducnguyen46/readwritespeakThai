//
//  AccountViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/9/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingCollectionView: UICollectionView!
    
    let settingCardList: [SettingCard] = SettingCard.getSettingCardList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCollectionView.register(
            UINib(nibName: "SettingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SettingCollectionViewCell")
        
        parentView.backgroundColor = ColorConstant.primaryColor
        
        appNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        appNameLabel.textColor = UIColor.white
        screenNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        coinValueLabel.textColor = UIColor.white
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        contentView.backgroundColor = ColorConstant.lightGray
        
        settingLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        settingCollectionView.backgroundColor = UIColor.clear
    }
    
}

extension AccountViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingCardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let settingCell = settingCollectionView.dequeueReusableCell(withReuseIdentifier: "SettingCollectionViewCell", for: indexPath) as! SettingCollectionViewCell
        settingCell.settingTitleLabel.text = settingCardList[indexPath.row].getSettingTitle()
        settingCell.settingInfoLabel.text = settingCardList[indexPath.row].getSettingInfo()
        if indexPath.row % 2 == 0 {
            settingCell.parentView.backgroundColor = ColorConstant.grayWhite
        } else {
            settingCell.parentView.backgroundColor = ColorConstant.lightGray
        }
        return settingCell
    }
}

extension AccountViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        
        return CGSize(width: screenWidth, height: screenWidth * 75/414)
    }
}

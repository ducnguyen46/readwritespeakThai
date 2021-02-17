//
//  DeckListViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/15/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class DeckListViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var verbCollectionView: UICollectionView!
    
    var titleText: String? = "test"
    var infoText: String?
    var isActive: Bool = false
    
    var verbList:[VerbCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check titleText
        print(titleText!)
        switch titleText {
        case "Top 25 Verbs":
            verbList = VerbCard.getListVerbCard()
            break
            
        case "Vegetables names":
            verbList = VerbCard.getListVerbCard()
            break
            
        case "The 20 words containing":
            verbList = VerbCard.getListVerbCard()
            break
            
        case "Top 25 adjectives":
            verbList = VerbCard.getListVerbCard()
            break
            
        case "Top 25 classifier":
            verbList = VerbCard.getListVerbCard()
            break
            
        default:
            verbList = VerbCard.getListVerbCard()
        }
        //registry
        verbCollectionView.register(
            UINib(
                nibName: "VerbCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "VerbCollectionViewCell")
    
        //navigation
        navigationController?.navigationBar.barTintColor = ColorConstant.primaryColor
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        navigationItem.title = "Deck Overview"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(
                ofSize: 18,
                weight: .bold)
        ]
        
        let backRoundButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        backRoundButton.backgroundColor = UIColor.white
        backRoundButton.layer.cornerRadius = 0.5 * backRoundButton.bounds.size.width
        backRoundButton.setImage(UIImage(named: "ic-back"), for: .normal)
        backRoundButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
        
        let backBarButton = UIBarButtonItem()
        backBarButton.customView = backRoundButton
        
        navigationItem.leftBarButtonItems = [backBarButton]
        
        //view
        parentView.backgroundColor = ColorConstant.primaryColor
        contentView.backgroundColor = ColorConstant.lightGray
        contentView.roundCorners(corners: [.topRight, .topLeft], radius: 30)
        
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.text = titleText ?? "Nothing choice"
        
        infoLabel.font = .systemFont(ofSize: 16, weight: .regular)
        infoLabel.textColor = .black
        infoLabel.text = infoText ?? "Nothing to show"
        verbCollectionView.backgroundColor = UIColor.clear
//        activeButton.addTarget(self, action: #selector(activeDeckList(str:titleLabel.text!)), for: .allEvents)
        activeButton.isHidden = isActive
    }

    @objc func backToPreviousViewController(){
        self.navigationController?.popViewController(animated: true)
        print("he")
    }
    
    @objc func activeDeckList(str: String){
        print(str)
        isActive = !isActive
        activeButton.isHidden = isActive
    }
}

extension DeckListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return verbList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = verbCollectionView.dequeueReusableCell(
            withReuseIdentifier: "VerbCollectionViewCell",
            for: indexPath) as! VerbCollectionViewCell
        
        cell.wordLabel.text = verbList[indexPath.row].word
        cell.transLabel.text = verbList[indexPath.row].trans
        cell.trans2Label.text = verbList[indexPath.row].trans2
        
        if indexPath.row % 2 == 0 {
            cell.parentView.backgroundColor = UIColor.white
        } else {
            cell.parentView.backgroundColor = ColorConstant.lightGray
        }
        return cell
    }
}

extension DeckListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: width, height: width * 94/414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

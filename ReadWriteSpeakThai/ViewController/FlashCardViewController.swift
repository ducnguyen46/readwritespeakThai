//
//  FlashCardViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/9/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class FlashCardViewController: UIViewController {
    
    let deckList:[String] = ["Top 25 Verbs", "Vegetables names", "The 20 words containing", "Top 25 adjectives", "Top 25 classifier"]

    @IBOutlet var parentView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleFlashCard: UILabel!
    @IBOutlet weak var settingFlashCardButton: UIButton!
    @IBOutlet weak var addFlashCardButton: UIButton!
    
    
    @IBOutlet weak var titleInfoLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var deckListCollectionView: UICollectionView!
    
    var i: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation
        navigationController?.navigationBar.barTintColor = ColorConstant.primaryColor
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        navigationItem.title = "Flash Card"
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
        
        
        // registry
        deckListCollectionView.register(
            UINib(
                nibName: "DeckListCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "DeckListCollectionViewCell")
        
        // Do any additional setup after loading the view.
        parentView.backgroundColor = ColorConstant.primaryColor
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        contentView.backgroundColor = ColorConstant.lightGray
        
        cardView.backgroundColor = UIColor.white
        cardView.layer.cornerRadius = 15
        
        titleFlashCard.font = .systemFont(ofSize: 16, weight: .bold)
        titleFlashCard.textColor = .black
        
        addFlashCardButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        settingFlashCardButton.backgroundColor = ColorConstant.purple
        settingFlashCardButton.layer.cornerRadius = 1/2 * settingFlashCardButton.bounds.size.height
        settingFlashCardButton.setTitle("Setting", for: .normal)
        settingFlashCardButton.setTitleColor(.white, for: .normal)
        settingFlashCardButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        titleInfoLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleInfoLabel.textColor = .black
        titleInfoLabel.text = "Predefined Decks"
        
        infoLabel.font = .systemFont(ofSize: 16, weight: .regular)
        infoLabel.textColor = .black
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 0
          
    }
    
    @objc func backToPreviousViewController(){
//        self.navigationController?.popViewController(animated: true)
        i = i+1
        print(i)
    }

}

extension FlashCardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deckList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = deckListCollectionView.dequeueReusableCell(
            withReuseIdentifier: "DeckListCollectionViewCell",
            for: indexPath) as! DeckListCollectionViewCell
        
        cell.titleCard.text = deckList[indexPath.row]
        if indexPath.row % 2 == 0 {
            cell.parentView.backgroundColor = UIColor.white
        } else {
            cell.parentView.backgroundColor = ColorConstant.lightGray
        }
        cell.actionButton.tag = indexPath.row
        cell.actionButton.addTarget(self, action: #selector(clicked(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func clicked(_ sender:UIButton){
        if(sender.tag == 0){
            self.navigationController?.pushViewController(AddCardViewController(), animated: true)
        }
        else {
            print("clicked")
        }
    }
}

extension FlashCardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: width, height: width * 94/414)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}




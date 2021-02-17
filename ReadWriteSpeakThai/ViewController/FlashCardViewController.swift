//
//  FlashCardViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/9/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class FlashCardViewController: UIViewController {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let deckList:[String] = ["Top 25 Verbs", "Vegetables names", "The 20 words containing", "Top 25 adjectives", "Top 25 classifier"]

    @IBOutlet var parentView: UIView!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moreInfoButton: UIButton!
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
        
        // registry
        deckListCollectionView.register(
            UINib(
                nibName: "DeckListCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "DeckListCollectionViewCell")
        
        // view
        parentView.backgroundColor = ColorConstant.primaryColor
        
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        
        moreInfoButton.layer.cornerRadius = 0.5 * moreInfoButton.bounds.size.width
        
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        contentView.backgroundColor = ColorConstant.lightGray
        
        cardView.backgroundColor = UIColor.white
        cardView.layer.cornerRadius = 15
        
        titleFlashCard.font = .systemFont(ofSize: 16, weight: .bold)
        titleFlashCard.textColor = .black
        
        addFlashCardButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        addFlashCardButton.addTarget(self, action: #selector(startAddFlashCard), for: .allEvents)
        
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
        
        // action for button
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
          
    }
    
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
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
        print(cell.actionButton.tag)
        cell.actionButton.addTarget(self, action: #selector(showDeckListClicked(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func showDeckListClicked(_ sender:UIButton){
        let titleInfoDeckOverview:[Int: [String]] = [
            0: ["Top 25 Verbs","This deck is for people who wants to wor on the most common verbs. Activate it now to enjoy it!"],
            1: ["Vegetables names","This deck is for people who wants to wor on the most common verbs. Activate it now to enjoy it!"],
            2: ["The 20 words containing","This deck is for people who wants to wor on the most common verbs. Activate it now to enjoy it!"],
            3: ["Top 25 adjectives","This deck is for people who wants to wor on the most common verbs. Activate it now to enjoy it!"],
            4: ["Top 25 classifier","This deck is for people who wants to wor on the most common verbs. Activate it now to enjoy it!"] ]
        
        
        let deckListVC = mainStoryboard.instantiateViewController(identifier: "DeckListViewController") as! DeckListViewController
        
//        let deckListVC = DeckListViewController()

        
        let titleText = titleInfoDeckOverview[sender.tag]![0]
        deckListVC.titleText =  titleText // key
        
        let infoText = titleInfoDeckOverview[sender.tag]![1]
        deckListVC.infoText = infoText// value
        
        deckListVC.modalPresentationStyle = .fullScreen
        self.present(deckListVC, animated: true, completion: nil)
    }
    
    @objc func startAddFlashCard(){
        let addCardVC = mainStoryboard.instantiateViewController(identifier: "AddCardViewController") as! AddCardViewController
        
        addCardVC.modalPresentationStyle = .fullScreen
        self.present(addCardVC, animated: true, completion: nil)
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




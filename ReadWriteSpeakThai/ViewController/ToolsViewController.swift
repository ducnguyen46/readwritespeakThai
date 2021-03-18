//
//  ToolsViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/8/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController {
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var toolsCollectionView: UICollectionView!
    
    let toolCards: [ToolCard] = ToolCard.getToolCards()
    var user: User!
    let db = Database()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = db.getUser()
        toolsCollectionView.register(
            UINib(nibName: "ToolCollectionViewCell",
                  bundle: nil),
            forCellWithReuseIdentifier: "ToolCollectionViewCell")
        
        
        parentView.backgroundColor = ColorConstant.primaryColor
        
        appNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        appNameLabel.textColor = UIColor.white
        screenNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        coinValueLabel.textColor = UIColor.white
        
        
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        //rich text
        infoLabel.text = "Select one of the different mode to work on"
        infoLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        infoLabel.textBold(label: infoLabel, normalText1: "Select one of the different ", boldText: "tool", normalText2: " to work on", fontSize: 16)
        toolsCollectionView.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user = db.getUser()
        coinValueLabel.text = "\(user.coin)"
    }
}

extension ToolsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(toolCards.count)
        return toolCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let toolCardCell = toolsCollectionView.dequeueReusableCell(
            withReuseIdentifier: "ToolCollectionViewCell",
            for: indexPath) as! ToolCollectionViewCell
        
        toolCardCell.actionButton.setTitle(toolCards[indexPath.row].getButtonTitle(), for: [.normal])
        toolCardCell.actionButton.setTitleColor(UIColor.white, for: [.normal, .highlighted, .selected])
        toolCardCell.actionButton.addTarget(self, action: #selector(cardClicked(_:)), for: .allEvents)
        
        if toolCards[indexPath.row].getStatusAvailable() == false {
            toolCardCell.image.image = UIImage(named: "img-voteforme")
        } else {
            toolCardCell.image.image = UIImage(named: toolCards[indexPath.row].getImage())
        }
        
        return toolCardCell
    }
    
    @objc func cardClicked(_ sender: UIButton){
        if(sender.titleLabel?.text == "Flashcard"){
            let flashCardVC = mainStoryboard.instantiateViewController(identifier: "FlashCardViewController")
            flashCardVC.modalPresentationStyle = .fullScreen
            self.present(flashCardVC, animated: true, completion: nil)
        }
    }
}

extension ToolsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeViewWidth = UIScreen.main.bounds.size.width - 50
        return CGSize(width: sizeViewWidth/2 - 5, height: sizeViewWidth/2 - 5)
    }

}

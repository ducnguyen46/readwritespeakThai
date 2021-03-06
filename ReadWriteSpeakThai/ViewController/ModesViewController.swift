//
//  ModesViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/7/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class ModesViewController: UIViewController {
    //view
    @IBOutlet var parentView: UIView!
    
    
    //
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var modeCardCollectionView: UICollectionView!
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let db = Database()
    var user: User!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user = db.getUser()
        coinValueLabel.text = "\(user.coin)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        user = db.getUser()
        modeCardCollectionView.register(
            UINib(
                nibName: "ModeCardCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "ModeCardCollectionViewCell")
        
        parentView.backgroundColor = ColorConstant.primaryColor
        appNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        appNameLabel.textColor = UIColor.white
        screenNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        coinValueLabel.textColor = UIColor.white
        
        //rich text
        infoLabel.text = "Select one of the different mode to work on"
        infoLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        infoLabel.textBold(label: infoLabel, normalText1: "Select one of the different ", boldText: "mode", normalText2: " to work on", fontSize: 16)
        
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        modeCardCollectionView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    @objc func goToPage(_ sender: UIButton){
        switch sender.tag {
        case 0: // sentences
            let vc = mainStoryboard.instantiateViewController(identifier: "SentencesViewController")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            break
            
        case 1: // word
            let vc = mainStoryboard.instantiateViewController(identifier: "WordViewController")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            break
        default:
            print("Something")
        }
    }

}

extension ModesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case modeCardCollectionView:
            return ModeCard.getModeCards().count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let modeCards:[ModeCard] = ModeCard.getModeCards()
        
        let modeCard = modeCardCollectionView.dequeueReusableCell(
            withReuseIdentifier: "ModeCardCollectionViewCell",
            for: indexPath) as! ModeCardCollectionViewCell
        modeCard.actionButton.setTitle(modeCards[indexPath.row].getButtonTitle(), for: .init())
        modeCard.actionButton.setTitleColor(UIColor.white, for: .init())
        modeCard.actionButton.tag = indexPath.row
        modeCard.actionButton.addTarget(self, action: #selector(goToPage(_:)), for: .touchUpInside)
        if modeCards[indexPath.row].getStatusAvailable() == false {
            modeCard.image.image = UIImage(named: "img-voteforme")
        } else {
            modeCard.image.image = UIImage(named: modeCards[indexPath.row].getImage())
        }
        
        return modeCard
    }
 
}

extension ModesViewController: UICollectionViewDelegateFlowLayout {
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


extension UILabel {
    func textBold (label:UILabel, normalText1: String, boldText: String, normalText2: String, fontSize:CGFloat) {
        let attributedNormal1 = NSMutableAttributedString(
        string: normalText1,
        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: fontSize)])
        
        let attributedBold = NSMutableAttributedString(
            string: boldText,
            attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize)])
        
        let attributedNormal2 = NSMutableAttributedString(
        string: normalText2,
        attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: fontSize)])
        
        let attributedText = NSMutableAttributedString()
        
        attributedText.append(attributedNormal1)
        attributedText.append(attributedBold)
        attributedText.append(attributedNormal2)
        
        label.attributedText = attributedText
    }
}

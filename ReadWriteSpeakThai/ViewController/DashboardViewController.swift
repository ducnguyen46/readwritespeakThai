//
//  DashboardViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/7/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    
    @IBOutlet weak var headerDashboard: UIView!
    @IBOutlet weak var bottomNavigation: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var workCollectionView: UICollectionView!
    @IBOutlet weak var toolGameCollectionView: UICollectionView!
    
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var toolGameLabel: UILabel!
    @IBOutlet weak var dailyCard: UIView!
    @IBOutlet weak var lessionButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    
    @IBOutlet weak var flashCard: UIView!
    @IBOutlet weak var flashcardButton: UIButton!
    @IBOutlet weak var newModeLabel: UILabel!
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var db = Database()
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
        //registry cell
        if user == nil {
            print("user nothing here")
        }
        workCollectionView.register(
            UINib(
                nibName: "WorkCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "WorkCollectionViewCell")
        toolGameCollectionView.register(
            UINib(
                nibName: "ToolGameCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "ToolGameCollectionViewCell")
        //topView
        headerDashboard.backgroundColor = ColorConstant.primaryColor
        appNameLabel.textColor = UIColor.white
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.textColor = UIColor.white
        
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        dailyCard.layer.cornerRadius = 15
        dailyCard.backgroundColor = .white
        overviewButton.layer.cornerRadius = overviewButton.bounds.size.height / 2
        
        flashCard.layer.cornerRadius = 15
        flashCard.backgroundColor = ColorConstant.grayPurple
        newModeLabel.isHidden = true
        
        workLabel.text = "Work with..."
        workLabel.textColor = ColorConstant.blackDark
        workLabel.font = UIFont.systemFont(
            ofSize: 16.0,
            weight: .bold)
        workCollectionView.backgroundColor = UIColor.clear
        toolGameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        toolGameCollectionView.backgroundColor = UIColor.clear
        //bottomNavigaton
        bottomNavigation.backgroundColor = UIColor.red
        
        bottomNavigation.layer.cornerRadius = 30
        
        contentView.backgroundColor = ColorConstant.lightGray
        contentView.roundCorners(
            corners: [.topLeft, .topRight],
            radius: 30)
        
        // button action
        overviewButton.addTarget(self, action: #selector(goToOverviewVC(_:)), for: .touchUpInside)
        lessionButton.addTarget(self, action: #selector(goToSentenceStudyVC(_:)), for: .touchUpInside)
        flashcardButton.addTarget(self, action: #selector(goToFlashcardVC(_:)), for: .touchUpInside)
    }

    
    @objc func goToOverviewVC(_ sender: UIButton){
        let vc = mainStoryboard.instantiateViewController(identifier: "SentencesViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToSentenceStudyVC(_ sender: UIButton){
        let vc = mainStoryboard.instantiateViewController(identifier: "SentenceStudyViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToFlashcardVC(_ sender: UIButton){
        let vc = mainStoryboard.instantiateViewController(identifier: "FlashCardViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToPage(_ sender: UIButton){
        switch sender.tag {
        case 0: // sentences
            let vc = mainStoryboard.instantiateViewController(identifier: "SentencesViewController")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            break
        default:
            print("Something")
        }
    }
    
}
extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case workCollectionView:
            return WorkCard.getWordCard().count
        case toolGameCollectionView:
            return ToolGameCard.getToolGameCards().count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case workCollectionView:
            let workCards = WorkCard.getWordCard()
            let workCard = workCollectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as! WorkCollectionViewCell
            workCard.titleWorkCard.text = workCards[indexPath.row].getTitle()
            workCard.parentView.backgroundColor = workCards[indexPath.row].getColorCard()
            workCard.actionButton.tag = indexPath.row
            workCard.actionButton.addTarget(self, action: #selector(goToPage(_:)), for: .touchUpInside)
            return workCard
        default:
            let toolGameCards = ToolGameCard.getToolGameCards()
            let toolGameCard = toolGameCollectionView.dequeueReusableCell(
                withReuseIdentifier: "ToolGameCollectionViewCell",
                for: indexPath) as! ToolGameCollectionViewCell
            toolGameCard.titleToolGameCard.text = toolGameCards[indexPath.row].getTitle()
            toolGameCard.iconImage.image = UIImage(named: toolGameCards[indexPath.row].getIcon())
            toolGameCard.actionButton.tag = indexPath.row
            return toolGameCard
            
        }
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case workCollectionView:
            return 10
        case toolGameCollectionView:
            return 10
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case workCollectionView:
            return 10
        case toolGameCollectionView:
            return 10
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 50
        
        switch collectionView {
        case workCollectionView:
            return CGSize(width: screenWidth/2-6, height: (screenWidth/2)*1/3 - 5)
        case toolGameCollectionView:
            return CGSize(width: screenWidth, height: (screenWidth/2)*1/3 - 5)
        default:
            return CGSize(width: screenWidth, height: (screenWidth/2)*1/3 - 5)
        }
        
    }
    
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

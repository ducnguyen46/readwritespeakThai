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
    @IBOutlet weak var headerCard: UICollectionView!
        
    @IBOutlet weak var workCollectionView: UICollectionView!
    @IBOutlet weak var toolGameCollectionView: UICollectionView!
        
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var toolGameLabel: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
            //registry cell
            headerCard.register(
                UINib(
                    nibName: "OverviewCard",
                    bundle: nil),
                forCellWithReuseIdentifier: "OverviewCard")
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
            
            headerCard.backgroundColor = UIColor.red
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
    //        (red: 0.99, green: 0.99, blue: 0.99, alpha: 1)

            bottomNavigation.layer.cornerRadius = 30
            
            //collectionHomeView
            contentView.backgroundColor = ColorConstant.lightGray
            contentView.roundCorners(
                corners: [.topLeft, .topRight],
                radius: 30)
            
        }
       
    }
    extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch collectionView {
            case headerCard:
                return 4
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
                    return workCard
                case toolGameCollectionView:
                    let toolGameCards = ToolGameCard.getToolGameCards()
                    let toolGameCard = toolGameCollectionView.dequeueReusableCell(
                        withReuseIdentifier: "ToolGameCollectionViewCell",
                        for: indexPath) as! ToolGameCollectionViewCell
                    toolGameCard.titleToolGameCard.text = toolGameCards[indexPath.row].getTitle()
                    toolGameCard.iconImage.image = UIImage(named: toolGameCards[indexPath.row].getIcon())
                    toolGameCard.actionButton.addTarget(
                        toolGameCard,
                        action: #selector(toolGameCard.buttonSelected(_:)),
                        for: .touchUpInside)
                    toolGameCard.actionButton.tag = indexPath.row
                    return toolGameCard
                default:
                    let cardOverview = headerCard.dequeueReusableCell(withReuseIdentifier: "OverviewCard", for: indexPath) as! OverviewCard
                    cardOverview.parentView.backgroundColor = UIColor.green
                    cardOverview.overviewButton.setTitle("Overview", for: UIControl.State.normal)
                    cardOverview.layer.cornerRadius = 20.0
                    return cardOverview
            }
        }
    }

    extension DashboardViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            switch collectionView {
            case headerCard:
                return 10
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
            case headerCard:
                return 10
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
            let screenHeight = UIScreen.main.bounds.height
            
            switch collectionView {
            case headerCard:
                return CGSize(width: screenWidth/2-5, height: screenHeight * 0.1)
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

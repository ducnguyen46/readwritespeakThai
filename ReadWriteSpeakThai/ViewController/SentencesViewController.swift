//
//  SentencesViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/18/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class SentencesViewController: UIViewController {
    @IBOutlet var prarentView: UIView!
    @IBOutlet weak var naviagtionBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sourceButton: UIButton!
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var showSentenceButton: UIButton!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let db = Database()
    var user: User!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = db.getUser()
        // view
        prarentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        scrollVIew.layer.cornerRadius = 30
        scrollVIew.backgroundColor = ColorConstant.lightGray

        contentView.backgroundColor = ColorConstant.lightGray
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
        sourceButton.addTarget(self, action: #selector(goToSourcePage(_:)), for: .allTouchEvents)
        categoriesButton.addTarget(self, action: #selector(goToCategoryPage(_:)), for: .allTouchEvents)
        
        showSentenceButton.addTarget(self, action: #selector(goToSentenceStudyPage(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user = db.getUser()
        coinValueLabel.text = "\(user.coin)"
    }
    
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goToSourcePage(_ sender: UIButton){
        
        let sourceVC = mainStoryboard.instantiateViewController(identifier: "SourceViewController")
        sourceVC.modalPresentationStyle = .fullScreen
        self.present(sourceVC, animated: true, completion: nil)
    }
    
    @objc func goToCategoryPage(_ sender: UIButton){
        let categoryVC = mainStoryboard.instantiateViewController(identifier: "CategoryViewController")
        categoryVC.modalPresentationStyle = .fullScreen
        self.present(categoryVC, animated: true, completion: nil)
    }
    
    @objc func goToSentenceStudyPage(_ sender: UIButton){
        user.coin = user.coin - 1
        if db.updateUser(userUpdate: user) {
            let vc = mainStoryboard.instantiateViewController(identifier: "SentenceStudyViewController")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            print("hate ios")
        }
        
    }
    
}

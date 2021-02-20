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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        prarentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        scrollVIew.layer.cornerRadius = 30
        scrollVIew.backgroundColor = ColorConstant.lightGray

        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
    }
    
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

//
//  SourceViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/20/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//


// DANG BIJ GOI 2 LAN
import UIKit

class SourceViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var appCollectionView: UICollectionView!
    @IBOutlet weak var bookCollectionView: UICollectionView!
    @IBOutlet weak var subtitleCollectionView: UICollectionView!
    
    let apiService = APIService()
    var listSources: [Source] = []
    var listSourceApp: [Source] = []
    var listSourceBookManeeMana: [Source] = []
    var listSourceSubtitles: [Source] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        appCollectionView.register(
            UINib(
                nibName: "AppSelectionCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "AppSelectionCollectionViewCell")
        
        bookCollectionView.register(
            UINib(
                nibName: "BookSelectionCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "BookSelectionCollectionViewCell")
        
        subtitleCollectionView.register(
            UINib(
                nibName: "SubtitleSelectionCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "SubtitleSelectionCollectionViewCell")
        
        parentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        
        contentView.backgroundColor = ColorConstant.lightGray
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        
        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
    }
    
    func initData(){
        listSources = apiService.getAllSources()
        for source in listSources {
            switch source.group {
            case "App":
                listSourceApp.append(source)
                break
            case "Subtitles":
                listSourceSubtitles.append(source)
                break
            default:
                listSourceBookManeeMana.append(source)
            }
        }
    }
    
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension SourceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case appCollectionView:
            return listSourceApp.count
        case subtitleCollectionView:
            return listSourceSubtitles.count
        default:
            return listSourceBookManeeMana.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case appCollectionView:
            let appCell = appCollectionView.dequeueReusableCell(
                withReuseIdentifier: "AppSelectionCollectionViewCell",
                for: indexPath) as! AppSelectionCollectionViewCell
            appCell.titleCell.text = listSourceApp[indexPath.row
            ].name
            return appCell
            
        case bookCollectionView:
            let bookCell = bookCollectionView.dequeueReusableCell(
                withReuseIdentifier: "BookSelectionCollectionViewCell",
                for: indexPath) as! BookSelectionCollectionViewCell
            bookCell.titleCell.text = listSourceBookManeeMana[indexPath.row].name
            bookCell.isHidden = listSourceBookManeeMana[indexPath.row].disable
            return bookCell
        default:
            let subtitleCell = subtitleCollectionView.dequeueReusableCell(
                withReuseIdentifier: "SubtitleSelectionCollectionViewCell",
                for: indexPath) as! SubtitleSelectionCollectionViewCell
            subtitleCell.titleCell.text = listSourceSubtitles[indexPath.row
            ].name
            return subtitleCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SourceViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

//
//  SourceViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/20/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var appCollectionView: UICollectionView!
    @IBOutlet weak var bookCollectionView: UICollectionView!
    @IBOutlet weak var subtitleCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
    }
}

extension SourceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case appCollectionView:
            let appCell = appCollectionView.dequeueReusableCell(
                withReuseIdentifier: "AppSelectionCollectionViewCell",
                for: indexPath) as! AppSelectionCollectionViewCell
            
            return appCell
            
        case bookCollectionView:
            let bookCell = bookCollectionView.dequeueReusableCell(
                withReuseIdentifier: "BookSelectionCollectionViewCell",
                for: indexPath) as! BookSelectionCollectionViewCell
            
            return bookCell
        default:
             let subtitleCell = subtitleCollectionView.dequeueReusableCell(
                           withReuseIdentifier: "SubtitleSelectionCollectionViewCell",
                           for: indexPath) as! SubtitleSelectionCollectionViewCell
                       
            return subtitleCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectCell = collectionView.indexPathsForSelectedItems
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

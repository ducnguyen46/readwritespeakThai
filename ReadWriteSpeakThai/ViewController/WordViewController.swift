//
//  WordViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 11/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var wordBoardCollectionView: UICollectionView!
    
    let listWordBoardCard = WordBoardCard.getListWordBoardCard()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordBoardCollectionView.register(UINib(nibName: "WordBoardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WordBoardCollectionViewCell")
        
    }
}

extension WordViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listWordBoardCard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = wordBoardCollectionView.dequeueReusableCell(withReuseIdentifier: "WordBoardCollectionViewCell", for: indexPath) as! WordBoardCollectionViewCell
        cell.imageCell.image = UIImage(named: listWordBoardCard[indexPath.row].img!)
        cell.titleCell.text = listWordBoardCard[indexPath.row].title
        
        return cell
    }
}

extension WordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        
        return CGSize(width: (width - 80)/3, height: (width - 80)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

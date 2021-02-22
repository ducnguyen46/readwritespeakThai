//
//  CategoryViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/20/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet var parentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    let listCategories:[String] = [
        "Popular",
        "Everything",
        "Gifts",
        "Videos",
        "Animals and pets",
        "Architecture",
        "Art",
        "Cars and motorcycles",
        "Celebrities",
        "DIY and crafts",
        "Design",
        "Education",
        "Entertainment",
        "Food and drink",
        "Gardening",
        "Geek",
        "Hair and beauty",
        "Health and fitness",
        "History",
        "Holidays and events",
        "Home decor",
        "Humor",
        "Illustrations and posters",
        "Kids and parenting",
        "Men\\\"s fashion",
        "Outdoors",
        "Photography",
        "Products",
        "Quotes",
        "Science and nature",
        "Sports",
        "Tattoos",
        "Technology",
        "Travel",
        "Weddings",
        "Women’s fashion",
    ]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollectionView.register(
        UINib(
            nibName: "CategorySelectionCollectionViewCell",
            bundle: nil),
        forCellWithReuseIdentifier: "CategorySelectionCollectionViewCell")
        categoriesCollectionView.allowsMultipleSelection = true
            
        parentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
    
        contentView.roundCorners(corners: [.topRight, .topLeft], radius: 30)
        categoriesCollectionView.backgroundColor = UIColor.clear

        // action
            backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
    }
        
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }

}
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryCell = categoriesCollectionView.dequeueReusableCell(
            withReuseIdentifier: "CategorySelectionCollectionViewCell",
            for: indexPath) as! CategorySelectionCollectionViewCell
        categoryCell.titleCell.text = listCategories[indexPath.row]
        return categoryCell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectCell = collectionView.indexPathsForSelectedItems
        print(selectCell ?? "HIHI")
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryCell = categoriesCollectionView.dequeueReusableCell(
            withReuseIdentifier: "CategorySelectionCollectionViewCell",
            for: indexPath) as! CategorySelectionCollectionViewCell
        categoryCell.titleCell.text = listCategories[indexPath.row]
        
        return CGSize(width: 0, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

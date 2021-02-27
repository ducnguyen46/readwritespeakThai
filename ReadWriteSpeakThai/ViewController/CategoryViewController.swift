//
//  CategoryViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/20/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit
import TagListView

class CategoryViewController: UIViewController {

    @IBOutlet var parentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var categoryTableView: UITableView!
    
    
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
    var tagList: TagListView = TagListView()
    var listChoice:[TagView] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.register(
            UINib(
                nibName: "CategoryTagTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "CategoryTagTableViewCell")
        categoryTableView.backgroundColor = UIColor.clear
        categoryTableView.allowsSelection = false
        categoryTableView.bounces = false
        categoryTableView.tableFooterView = UIView()
            
        parentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        
        contentView.roundCorners(corners: [.topRight, .topLeft], radius: 30)
        contentView.backgroundColor = ColorConstant.lightGray

        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
        searchButton.addTarget(self, action: #selector(search), for: .allEvents)
    }
        
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func search(){
        tagList.tagViews.map {$0.isSelected = true }
        listChoice = tagList.selectedTags()
    }

}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryTagTableViewCell", for: indexPath) as! CategoryTagTableViewCell
        tableCell.categoryTag.addTags(listCategories)
//        listChoice = tableCell.listChoice
        tagList = tableCell.categoryTag
        return tableCell
    }
    
    
}



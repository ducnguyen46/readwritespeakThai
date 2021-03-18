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
    
    var apiService: APIService?
    var listCategories: [Category]!
    var tagList: TagListView = TagListView()
    var listChoice:[TagView] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
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
        
        //
        
    }
    
    func initData(){
        apiService = APIService()
        listCategories = apiService!.getAllCategories()
        print("list cate \(listCategories.count)")
    }
        
    @objc func backToPreviousViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func search(){
//        tagList.tagViews.map {$0.isSelected = true }
//        listChoice = tagList.selectedTags()
    }

}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryTagTableViewCell", for: indexPath) as! CategoryTagTableViewCell
        for category in listCategories {
            tableCell.categoryTag.addTag(category.name)
        }
        tagList = tableCell.categoryTag
        listChoice = tableCell.listChoice
        print(listChoice.count)
        return tableCell
    }
    
    
}



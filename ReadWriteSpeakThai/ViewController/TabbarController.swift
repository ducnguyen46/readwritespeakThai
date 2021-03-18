//
//  TabbarController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/27/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    @IBOutlet weak var mainTabbar: UITabBar!
    
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var dashboardVC: DashboardViewController!
    var modesVC: ModesViewController!
    var toolsVC: ToolsViewController!
    var accountVC: AccountViewController!
    
    var user: User!
    var db = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        self.delegate = self
        mainTabbar.tintColor = ColorConstant.lightRed
        mainTabbar.layer.cornerRadius = 20
        
        dashboardVC = mainStoryboard.instantiateViewController(identifier: "DashboardViewController")
        modesVC = mainStoryboard.instantiateViewController(identifier: "ModesViewController")
        toolsVC = mainStoryboard.instantiateViewController(identifier: "ToolsViewController")
        accountVC = mainStoryboard.instantiateViewController(identifier: "AccountViewController")

        dashboardVC.tabBarItem.image = UIImage(named: "ic-dashboard")
//        dashboardVC.tabBarItem.selectedImage
        modesVC.tabBarItem.image = UIImage(named: "ic-mode")
        toolsVC.tabBarItem.image = UIImage(named: "ic-tool")
        accountVC.tabBarItem.image = UIImage(named: "ic-account")
        
        
        viewControllers = [dashboardVC, modesVC, toolsVC, accountVC]
        
//        for tabBarItem in tabBar.items! {
//            tabBarItem.title = ""
//            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
    }
    
    func initData() {
        user = User()
        user.coin = 100
        if db.createUser() {
            if db.getUser().coin == -1 {
                print("Nothing user in there")
                db.insertUser(userInsert: user)
            } else {
                user = db.getUser()
                print(user.coin)
            }
        } else {
            print("Can't create user table")
        }
    }
}

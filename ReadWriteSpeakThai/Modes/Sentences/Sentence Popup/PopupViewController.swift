//
//  PopupViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/28/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var toneTableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    let listToneCell = ToneTableCell.getListToneCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toneTableView.delegate = self
        toneTableView.dataSource = self
        toneTableView.allowsSelection = false
        toneTableView.bounces = false
        
        toneTableView.register(
            UINib(nibName: "PopupToneTableViewCell", bundle: nil),
            forCellReuseIdentifier: "PopupToneTableViewCell")
        
        contentView.backgroundColor = ColorConstant.lightGray
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        
        toneTableView.backgroundColor = .clear
        toneTableView.tableFooterView = UIView()
        
        closeButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
    }
    
    @objc func closePopup(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return toneTableView.bounds.size.height / CGFloat(listToneCell.count)
    }    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listToneCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toneCell = toneTableView.dequeueReusableCell(withIdentifier: "PopupToneTableViewCell") as! PopupToneTableViewCell
        toneCell.colorView.backgroundColor = listToneCell[indexPath.row].color
        toneCell.toneLabel.text = listToneCell[indexPath.row].toneLabel
        toneCell.imageTone.image = UIImage(named: listToneCell[indexPath.row].image)
        return toneCell
    }
    
}

//
//  SentenceStudyViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyễn Ngọc Đức on 2/20/21.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class SentenceStudyViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var actionControlCollectionView: UICollectionView!
    @IBOutlet weak var sentenceCollectionView: UICollectionView!
    @IBOutlet weak var audioControlCollectionView: UICollectionView!
    @IBOutlet weak var wordTableView: UITableView!
    
    let apiService: APIService = APIService()
    let db = Database()
    var user: User!
    let listActionControl = ActionControlSentence().getACSList()
    let listAudioControl = AudioControlSentence().getACSList()
    var listSentence: [Sentence] = []
    var listWord: [Word] = []
    var listWordInSentence: [Word] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        actionControlCollectionView.register(
            UINib(
                nibName: "ActionSentenceCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "ActionSentenceCollectionViewCell")
        sentenceCollectionView.register(
            UINib(
                nibName: "SentenceCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "SentenceCollectionViewCell")
        audioControlCollectionView.register(
            UINib(
                nibName: "AudioControlCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "AudioControlCollectionViewCell")
        wordTableView.register(
            UINib(
                nibName: "WordSentenceTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "WordSentenceTableViewCell")
        
        parentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        
        contentView.roundCorners(corners: [.topRight, .topLeft], radius: 30)
        contentView.backgroundColor = ColorConstant.lightGray
        actionControlCollectionView.backgroundColor = UIColor.clear
        sentenceCollectionView.backgroundColor = UIColor.clear
        audioControlCollectionView.backgroundColor = UIColor.white
        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
    }
    
    func initData(){
        listSentence = apiService.getAllSentences()
        listWord = apiService.getAllWords()
        listWordInSentence = getWordsFromSentence(sentence: listSentence[0])
        
        user = db.getUser()
        print(user.coin)
    }
            
    @objc func backToPreviousViewController(){
            self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showTonePopUp(_ sender: UIButton){
        let tonePopupVC: PopupViewController = PopupViewController(nibName: "PopupViewController", bundle: nil)
        
        tonePopupVC.modalPresentationStyle = .overCurrentContext
        tonePopupVC.modalTransitionStyle = .crossDissolve
        
        self.present(tonePopupVC, animated: true, completion: nil)
    }
    
    func getPronounceFromSentence(sentence: Sentence) -> String {
        var pronounce: String = ""
        for i in 0...sentence.words.count - 1 {
            let wordIndex = sentence.words[i]
            if wordIndex is Int {
                let word = listWord.filter {$0.id == (wordIndex as! Int)}[0]
                pronounce.append(" " + word.simpleThai[0])
            } else if wordIndex is String{
                pronounce.append((wordIndex as! String))
            }
        }
        return pronounce
    }
    
    func getWordsFromSentence(sentence: Sentence) -> [Word] {
        var words:[Word] = []
        for i in 0...sentence.words.count - 1 {
            let wordIndex = sentence.words[i]
            if wordIndex is Int {
                let word: Word = listWord.filter {$0.id == (wordIndex as! Int)}[0]
                // them tu vao
                words.append(word)
            }
        }
        return words
    }

}

extension SentenceStudyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case actionControlCollectionView:
            return listActionControl.count
            
        case audioControlCollectionView:
            return listAudioControl.count
            
        default:
            return listSentence.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case actionControlCollectionView:
            let actionCell = actionControlCollectionView.dequeueReusableCell(withReuseIdentifier: "ActionSentenceCollectionViewCell", for: indexPath) as! ActionSentenceCollectionViewCell
            actionCell.imageView.image = UIImage(named: listActionControl[indexPath.row].image!)
            actionCell.titleLabel.text = listActionControl[indexPath.row].title
            
            if(indexPath.row == 2){
                actionCell.actionButton.addTarget(self, action: #selector(showTonePopUp(_:)), for: .touchUpInside)
            }
            
            return actionCell
            
        case audioControlCollectionView:
            let audioCell = audioControlCollectionView.dequeueReusableCell(withReuseIdentifier: "AudioControlCollectionViewCell", for: indexPath) as! AudioControlCollectionViewCell
            audioCell.imageIcon.image = UIImage(named: listAudioControl[indexPath.row].image!)
            audioCell.titleLabel.text = listAudioControl[indexPath.row].title
            return audioCell
            
        default:
            let sentence = listSentence[indexPath.row]
            let pronounce = getPronounceFromSentence(sentence: sentence)
            
            let sentenceCell = sentenceCollectionView.dequeueReusableCell(withReuseIdentifier: "SentenceCollectionViewCell", for: indexPath) as! SentenceCollectionViewCell
            sentenceCell.sentencesLabel.text = sentence.thai
            sentenceCell.englishLabel.text = sentence.english
            sentenceCell.pronounceLabel.text = pronounce
            return sentenceCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView == sentenceCollectionView){
            listWordInSentence = getWordsFromSentence(sentence: listSentence[indexPath.row])
            print("\(indexPath.row) : \(listWordInSentence.count)")
            wordTableView.reloadData()
        }
    }
    
}

extension SentenceStudyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let ctvSize = contentView.bounds.size
//        let screenSize = UIScreen.main.bounds.size
        
        
        switch collectionView {
        case actionControlCollectionView:
            return CGSize(
                width: (ctvSize.width - 30)/CGFloat(listActionControl.count) - 15,
                height: ctvSize.height * 0.1)
            
        case audioControlCollectionView:
            return CGSize(
                width: (ctvSize.width - 30)/CGFloat(listAudioControl.count) - 15,
                height: ctvSize.height * 0.1)
         
        default:
            return CGSize(
                width: ctvSize.height * 300/750,
                height: ctvSize.height * 300/750 - 30
            )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case actionControlCollectionView:
            return 15
            
        case audioControlCollectionView:
            return 15
            
        default:
            return 0
        }
    }
}

extension SentenceStudyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWordInSentence.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = listWordInSentence[indexPath.row]
        let tableWordCell = wordTableView.dequeueReusableCell(withIdentifier: "WordSentenceTableViewCell", for: indexPath) as! WordSentenceTableViewCell
        tableWordCell.thaiLabel.text = word.thai
        var english = ""
        for e in word.english {
            english = english + e + "\n"
        }
        tableWordCell.simpleThaiLabel.text = word.simpleThai[0]
        tableWordCell.englishLabel.text = english
        
        return tableWordCell
    }  
}

//
//  WordStudyViewController.swift
//  ReadWriteSpeakThai
//
//  Created by Nguyen Ngoc Duc on 14/03/2021.
//  Copyright © 2021 Nguyen Ngoc Duc. All rights reserved.
//

import UIKit

class WordStudyViewController: UIViewController {
    @IBOutlet weak var screenName: UILabel!
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var actionControlCollectionView: UICollectionView!
    @IBOutlet weak var wordCollectionView: UICollectionView!
    @IBOutlet weak var audioControlCollectionView: UICollectionView!
    @IBOutlet weak var sentenceTableView: UITableView!
    
    let apiService: APIService = APIService()
    
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
        wordCollectionView.register(
            UINib(
                nibName: "WordCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "WordCollectionViewCell")
        audioControlCollectionView.register(
            UINib(
                nibName: "AudioControlCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "AudioControlCollectionViewCell")
        sentenceTableView.register(
            UINib(
                nibName: "SentenceWordTableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "SentenceWordTableViewCell")
        
        parentView.backgroundColor = ColorConstant.primaryColor
        backButton.layer.cornerRadius = 0.5 * backButton.bounds.size.width
        
        contentView.roundCorners(corners: [.topRight, .topLeft], radius: 30)
        contentView.backgroundColor = ColorConstant.lightGray
        actionControlCollectionView.backgroundColor = UIColor.clear
        wordCollectionView.backgroundColor = UIColor.clear
        audioControlCollectionView.backgroundColor = UIColor.white
        // action
        backButton.addTarget(self, action: #selector(backToPreviousViewController), for: .allEvents)
    }
    
    func initData(){
        listSentence = apiService.getAllSentences()
        listWord = apiService.getAllWords()
        listWordInSentence = getWordsFromSentence(sentence: listSentence[0])
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

extension WordStudyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case actionControlCollectionView:
            return listActionControl.count
            
        case audioControlCollectionView:
            return listAudioControl.count
            
        default:
            return listWord.count
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
            let word = listWord[indexPath.row]
//            let pronounce = getPronounceFromSentence(sentence: sentence)
            
            let wordCell = wordCollectionView.dequeueReusableCell(withReuseIdentifier: "WordCollectionViewCell", for: indexPath) as! WordCollectionViewCell
            wordCell.wordLabel.text = word.thai
            wordCell.simpleThaiLabel.text = word.simpleThai[0]
            var englishLabel = ""
            for english in word.english {
                englishLabel = englishLabel + english + "\n"
            }
            wordCell.englishLabel.text = englishLabel
            return wordCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == wordCollectionView){
            listWordInSentence = getWordsFromSentence(sentence: listSentence[indexPath.row])
            print("\(indexPath.row) : \(listWordInSentence.count)")
            sentenceTableView.reloadData()
        }
    }
}

extension WordStudyViewController: UICollectionViewDelegateFlowLayout {
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
                height: ctvSize.height * 300/750
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

extension WordStudyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSentence.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sentence = listSentence[indexPath.row]
        var tableSentenceCell = sentenceTableView.dequeueReusableCell(withIdentifier: "SentenceWordTableViewCell", for: indexPath) as! SentenceWordTableViewCell
        tableSentenceCell.thaiLabel.text = sentence.thai
        tableSentenceCell.englishLabel.text = sentence.english
        return tableSentenceCell
    }
}

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
    
    let listActionControl = ActionControlSentence().getACSList()
    let listAudioControl = AudioControlSentence().getACSList()
    let listSentenceCard = SentenceCard().getSentenceCardList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
    @objc func backToPreviousViewController(){
            self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showTonePopUp(_ sender: UIButton){
        let tonePopupVC: PopupViewController = PopupViewController(nibName: "PopupViewController", bundle: nil)
        
        tonePopupVC.modalPresentationStyle = .overCurrentContext
        tonePopupVC.modalTransitionStyle = .crossDissolve
        
        self.present(tonePopupVC, animated: true, completion: nil)
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
            return listSentenceCard.count
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
            let sentenceCell = sentenceCollectionView.dequeueReusableCell(withReuseIdentifier: "SentenceCollectionViewCell", for: indexPath) as! SentenceCollectionViewCell
            sentenceCell.sentencesLabel.text = listSentenceCard[indexPath.row].sentence
            sentenceCell.englishLabel.text = listSentenceCard[indexPath.row].englishSentence
            sentenceCell.pronounceLabel.text = listSentenceCard[indexPath.row].thaiPronounce
            return sentenceCell
        }
    }
}

extension SentenceStudyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let ctvSize = contentView.bounds.size
        
        
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

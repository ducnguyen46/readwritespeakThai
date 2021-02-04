
import UIKit


class ViewController: UIViewController {
    //registry cell
    
    //
    @IBOutlet weak var headerDashboard: UIView!
    @IBOutlet weak var bottomNavigation: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerCard: UICollectionView!
    
    @IBOutlet weak var workCollectionView: UICollectionView!
    @IBOutlet weak var toolGameCollectionView: UICollectionView!
    
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var toolGameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //registry cell
        headerCard.register(
            UINib(
                nibName: "OverviewCard",
                bundle: nil),
            forCellWithReuseIdentifier: "OverviewCard")
        workCollectionView.register(
            UINib(
                nibName: "WorkCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "WorkCollectionViewCell")
        toolGameCollectionView.register(
            UINib(
                nibName: "ToolGameCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "ToolGameCollectionViewCell")
        //topView
        headerDashboard.backgroundColor = ColorConstant.primaryColor
        appNameLabel.textColor = UIColor.white
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.textColor = UIColor.white
        
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        headerCard.backgroundColor = UIColor.red
        workLabel.text = "Work with..."
        workLabel.textColor = ColorConstant.blackDark
        workLabel.font = UIFont.systemFont(
            ofSize: 16.0,
            weight: UIFont.Weight(0.7))
        workCollectionView.backgroundColor = UIColor.clear
        toolGameCollectionView.backgroundColor = UIColor.clear
        //bottomNavigaton
        bottomNavigation.backgroundColor = UIColor.red
//        (red: 0.99, green: 0.99, blue: 0.99, alpha: 1)

        bottomNavigation.layer.cornerRadius = 30
        
        //collectionHomeView
        contentView.backgroundColor = ColorConstant.lightGrayColor
        contentView.roundCorners(
            corners: [.topLeft, .topRight],
            radius: 30)
        
    }
   
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case headerCard:
            return 4
        case workCollectionView:
            return 4
        case toolGameCollectionView:
            return 5
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            case workCollectionView:
                let workCard = workCollectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as! WorkCollectionViewCell
                workCard.titleWorkCard.text = "Heyy"
                return workCard
            case toolGameCollectionView:
                let toolGameCard = toolGameCollectionView.dequeueReusableCell(
                    withReuseIdentifier: "ToolGameCollectionViewCell",
                    for: indexPath) as! ToolGameCollectionViewCell
                toolGameCard.titleToolGameCard.text = "This title"
                return toolGameCard
            default:
                let cardOverview = headerCard.dequeueReusableCell(withReuseIdentifier: "OverviewCard", for: indexPath) as! OverviewCard
                cardOverview.parentView.backgroundColor = UIColor.green
                cardOverview.overviewButton.setTitle("Overview", for: UIControl.State.normal)
                cardOverview.layer.cornerRadius = 20.0
                return cardOverview
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case headerCard:
            return 12
        case workCollectionView:
            return 12
        case toolGameCollectionView:
            return 5
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case headerCard:
            return 12
        case workCollectionView:
            return 12
        case toolGameCollectionView:
            return 5
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 50
        let screenHeight = UIScreen.main.bounds.height
        
        switch collectionView {
        case headerCard:
            return CGSize(width: screenWidth/2-6, height: screenHeight * 0.1)
        case workCollectionView:
            return CGSize(width: screenWidth/2-6, height: (screenWidth/2)*1/3 - 6)
        case toolGameCollectionView:
            return CGSize(width: screenWidth, height: (screenWidth/2)*1/3 - 5)
        default:
            return CGSize(width: screenWidth, height: (screenWidth/2)*1/3 - 6)
        }
        
    }
    
}


extension UIView {
      func roundCorners(corners: UIRectCorner, radius: CGFloat) {
           let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           let mask = CAShapeLayer()
           mask.path = path.cgPath
           layer.mask = mask
       }
   }


import UIKit


class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomNavigation: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerCard: UICollectionView!
    
    
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerCard.delegate = self
        headerCard.dataSource = self
        
        
        //topView
        topView.backgroundColor = ColorConstant.primaryColor
        appNameLabel.textColor = UIColor.white
        screenNameLabel.textColor = UIColor.white
        coinValueLabel.textColor = UIColor.white
        
        coinValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        //bottomNavigaton
        bottomNavigation.backgroundColor = UIColor.red
//        (red: 0.99, green: 0.99, blue: 0.99, alpha: 1)

        bottomNavigation.layer.cornerRadius = 30
        
        //collectionHomeView
        contentView.backgroundColor = ColorConstant.lightGrayColor
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 30)

        //topLabelView
        
    }
    
//    extension UIView {
//        func roundCorner(corner : UIRectCorner, radius:CGFloat){
//
//        }
//    }
   
}

let tabBarController = UITabBarController()


extension UIView {
      func roundCorners(corners: UIRectCorner, radius: CGFloat) {
           let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           let mask = CAShapeLayer()
           mask.path = path.cgPath
           layer.mask = mask
       }
   }

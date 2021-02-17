
import UIKit

class ToolGameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleToolGameCard: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.backgroundColor = ColorConstant.lightPurple
        parentView.layer.cornerRadius = 10
        actionButton.backgroundColor = ColorConstant.purple
        actionButton.layer.cornerRadius = 0.5 * actionButton.bounds.size.width
        titleToolGameCard.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(0.5))
        actionButton.setImage(UIImage(named: "ic-more"), for: .normal)
        
    }
}

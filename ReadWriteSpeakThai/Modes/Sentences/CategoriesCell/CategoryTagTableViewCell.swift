
import UIKit
import TagListView

class CategoryTagTableViewCell: UITableViewCell, TagListViewDelegate {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var categoryTag: TagListView!
    
    var listChoice:[TagView] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        parentView.backgroundColor = UIColor.clear
        categoryTag.backgroundColor = UIColor.clear
        categoryTag.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        if(tagView.isSelected == false){
            tagView.isSelected = true
//            print(title)
//            print(tagView.tag)
        } else {
            tagView.isSelected = false
            
        }
        listChoice = sender.selectedTags()
        
    }
    
}

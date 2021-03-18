
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
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        if(tagView.isSelected == false){
            for tag in sender.selectedTags() {
                tag.isSelected = false
            }
            tagView.isSelected = true
        } else {
            tagView.isSelected = false
        }
        listChoice = sender.selectedTags()
        print("choice in cell: \(listChoice.count)")
    }
    
}

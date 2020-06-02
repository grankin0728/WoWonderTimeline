

import UIKit
import ActiveLabel
import WoWonderTimelineSDK

class GroupCell: UITableViewCell {
        
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupText: ActiveLabel!
    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
   
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var CommentBtn: UIButton!
    @IBOutlet weak var ShareBtn: UIButton!
    @IBOutlet weak var likesCountBtn: UIButton!
    @IBOutlet weak var commentsCountBtn: UIButton!
    @IBOutlet weak var likeandcommentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


import UIKit
import WoWonderTimelineSDK


class CommentCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: Roundimage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var commentText: UILabel!
    @IBOutlet weak var commentTime: UILabel!
    @IBOutlet weak var viewLeadingContraint: NSLayoutConstraint!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var replyBtn: UIButton!
    
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var designView: DesignView!
    @IBOutlet var imageWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var noCommentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

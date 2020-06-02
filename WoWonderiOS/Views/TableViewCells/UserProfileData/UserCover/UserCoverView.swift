

import UIKit
import WoWonderTimelineSDK


class UserCoverView: UITableViewCell {
    
    
    @IBOutlet weak var profileNAme: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var profileImage: Roundimage!
    @IBOutlet weak var addButton: RoundButton!
    @IBOutlet weak var messageButton: RoundButton!
    @IBOutlet weak var moreButton: RoundButton!
    @IBOutlet weak var followingBtn: UIButton!
    @IBOutlet weak var followersBtn: UIButton!
    @IBOutlet weak var pointsBtn: UIButton!
    @IBOutlet weak var pageLikesBtn: UIButton!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var request = "unfollow"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

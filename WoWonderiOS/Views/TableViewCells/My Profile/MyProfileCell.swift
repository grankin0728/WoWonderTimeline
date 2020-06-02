

import UIKit
import WoWonderTimelineSDK

class MyProfileCell: UITableViewCell {
    
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var profileImage: Roundimage!
    @IBOutlet weak var followerBtn: UIButton!
    @IBOutlet weak var followingBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var pointBtn: UIButton!
    @IBOutlet weak var editProfileBtn: RoundButton!
    @IBOutlet weak var changeImageBtn: RoundButton!
    @IBOutlet weak var moreBtn: RoundButton!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var walletBtn: RoundButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

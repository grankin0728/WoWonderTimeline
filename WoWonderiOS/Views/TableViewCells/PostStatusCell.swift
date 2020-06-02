

import UIKit
import SDWebImage
import WoWonderTimelineSDK


class PostStatusCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: Roundimage!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func bind(){
        let url = URL(string: UserData.getImage() ?? "")
        print(url)
//        self.profileImage.kf.setImage(with: url)
        self.profileImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "no-avatar"), options: [], completed: nil)
    }

}

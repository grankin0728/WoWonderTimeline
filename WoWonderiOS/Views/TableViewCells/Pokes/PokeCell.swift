
import UIKit
import WoWonderTimelineSDK


class PokeCell: UITableViewCell {

    
    
    
    
 
    @IBOutlet weak var profileImage: Roundimage!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var pokeBtn: RoundButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

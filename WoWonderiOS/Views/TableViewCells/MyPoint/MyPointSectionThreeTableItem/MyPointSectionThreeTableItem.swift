

import UIKit
import WoWonderTimelineSDK

class MyPointSectionThreeTableItem: UITableViewCell {
    
    @IBOutlet weak var tapView: RoundButton!
    
    var vc:MyPointsVC?
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tapView.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "WalletVC") as! WalletMainController
        vc.mybalance = AppInstance.instance.profile?.userData?.wallet ?? ""
        if (ControlSettings.showPaymentVC == true){
            self.vc?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

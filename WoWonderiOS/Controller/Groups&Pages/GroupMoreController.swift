

import UIKit
import WoWonderTimelineSDK

class GroupMoreController: UIViewController {
    
    var groupUrl: String? = nil
    
    var delegate: GroupMoreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func More(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            self.dismiss(animated: true) {
                self.delegate?.gotoSetting(type: "copy")
            }
            
        case 1:
            self.dismiss(animated: true) {
               self.delegate?.gotoSetting(type: "share")
            }
        case 2:
            self.dismiss(animated: true) {
                self.delegate?.gotoSetting(type: "setting")
            }
            
        default:
            print("noting")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}

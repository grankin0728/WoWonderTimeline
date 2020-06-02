

import UIKit
import WoWonderTimelineSDK
class SelectGenderVC: UIViewController {

    var delegate:TwoFactorAuthDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func disablePressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.getTwoFactorUpdateString(type: "female")
        }
    }
    
    @IBAction func enablePressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.getTwoFactorUpdateString(type: "male")
        }
    }
}

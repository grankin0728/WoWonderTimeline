

import UIKit
import WoWonderTimelineSDK

class SecurityController: UIViewController {
    
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    var error = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text! = error
        
    }
    
    
    
    @IBAction func OK(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

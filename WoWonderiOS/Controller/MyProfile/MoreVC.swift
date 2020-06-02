

import UIKit
import WoWonderTimelineSDK
class MoreVC: UIViewController {
    
    var delegate : ProfileMoreDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func MoreAction(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            self.dismiss(animated: true) {
                self.delegate?.profileMore(tag: 0)
            }
        case 1:
            self.dismiss(animated: true) {
                self.delegate?.profileMore(tag: 1)
            }
        case 2:
            self.dismiss(animated: true) {
                self.delegate?.profileMore(tag: 2)
            }
        case 3:
            self.dismiss(animated: true) {
                self.delegate?.profileMore(tag: 3)
            }
        case 4:
            self.dismiss(animated: true) {
                self.delegate?.profileMore(tag: 4)
            }
        default:
            print("print")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

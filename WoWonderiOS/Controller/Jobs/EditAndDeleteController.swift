

import UIKit
import WoWonderTimelineSDK

class EditAndDeleteController: UIViewController {
    
    let Storyboard = UIStoryboard(name: "Jobs", bundle: nil)
    var delegate : EditJobDelegate!
    var deleteDelegate : DeleteJobDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func EditandDelete(_ sender: UIButton) {
        switch sender.tag {
        case 0:
        self.delegate.editJob()
        self.dismiss(animated: true, completion: nil)
        case 1:
            self.deleteDelegate.deleteJob(jobId: 0)
            self.dismiss(animated: true, completion: nil)
        default:
            print("Default")
        }
    }
    

  
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

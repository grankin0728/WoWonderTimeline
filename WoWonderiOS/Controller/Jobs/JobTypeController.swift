

import UIKit
import WoWonderTimelineSDK

class JobTypeController: UIViewController {

    
    var delegate : JobTypeDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func JobType(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.delegate.jobType(jobType: "Full Time", type: "full_time")
            self.dismiss(animated: true, completion: nil)
         case 1:
            self.delegate.jobType(jobType: "Part Time", type: "part_time")
            self.dismiss(animated: true, completion: nil)
        case 2:
            self.delegate.jobType(jobType: "Internship", type: "internship")
            self.dismiss(animated: true, completion: nil)
        case 3:
            self.delegate.jobType(jobType: "Volunteer", type: "volunteer")
            self.dismiss(animated: true, completion: nil)
        case 4:
            self.delegate.jobType(jobType: "Contract", type: "contract")
            self.dismiss(animated: true, completion: nil)
        default:
            print("Default")
        }
    }
    
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

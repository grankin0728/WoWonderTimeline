

import UIKit
import WoWonderTimelineSDK

class ProductDistanceController: UIViewController {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    
    var delegate :ProductDistanceDelegate!
    var distance = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.distanceSlider.value =  (self.distance as NSString).floatValue
        self.distanceLabel.text! = "\(self.distance)\(" Km")"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SliderChangedValue(_ sender: Any) {
        self.distanceLabel.text! = "\(String(format: "%i",Int(self.distanceSlider.value)))\(" km")"
        self.distance = String(format: "%i",Int(self.distanceSlider.value))
//        "\(self.distanceSlider.value)\(" ")\("Km")"
    }
    
    
    @IBAction func ApplyFilter(_ sender: Any) {
        self.delegate.productDistance(distance: Int(self.distance) ?? 0)
        self.dismiss(animated: true, completion: nil)
    }
    

}

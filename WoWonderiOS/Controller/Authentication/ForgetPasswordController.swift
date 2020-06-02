

import UIKit
import ZKProgressHUD
import WoWonderTimelineSDK


class ForgetPasswordController: UIViewController {
    
    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var sendBtn: RoundButton!
    
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ForgetPasswordController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
        
    }
    
    
    @objc func networkStatusChanged(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let status = userInfo["Status"] as! String
            print(status)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    
    
    @IBAction func Send(_ sender: Any) {
        if self.emailField.text!.isEmpty == true {
            print("Error")
//            self.error = "Please Enter Your Email"
//            self.performSegue(withIdentifier: "ErrorVC", sender: self)
        }
        else if !(isValidEmail(testStr: self.emailField.text!)){
            
            self.error = "Please Write your Full email address"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            }
            
            
        else {
            self.forgetPassword(email: self.emailField.text!)
        }
    }
    
    private func forgetPassword(email : String){
        
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            ZKProgressHUD.dismiss()
            self.error = "Internet Connection Failed"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
        case .online(.wwan), .online(.wiFi):
            ZKProgressHUD.show("Loading")
            ForgetPasswordManager.sharedInstance.forgetPassword(email: email) { (success, authError, error) in
                
                if success != nil {
                    ZKProgressHUD.dismiss()
                    self.error = "EMAIL HAS BEEN SEND"
                    self.performSegue(withIdentifier: "ErrorVC", sender: self)
                    
                }
                    
                else if authError != nil {
                    ZKProgressHUD.dismiss()
                    self.error = authError?.errors.errorText ?? ""
                    self.performSegue(withIdentifier: "ErrorVC", sender: self)
                    print(authError?.errors.errorText)
                }
                    
                else if error != nil {
                    ZKProgressHUD.dismiss()
                    print("error")
                    
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ErrorVC"{
            let destinationVc = segue.destination as! SecurityController
            destinationVc.error = error
        }
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}

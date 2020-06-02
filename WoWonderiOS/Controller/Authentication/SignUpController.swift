

import UIKit
import WoWonderTimelineSDK
import  ZKProgressHUD

class SignUpController: BaseVC {
    
    @IBOutlet weak var userNameField: RoundTextField!
    
    @IBOutlet weak var firstName: RoundTextField!
    
    @IBOutlet weak var lastName: RoundTextField!
    
    @IBOutlet weak var email: RoundTextField!
    
    @IBOutlet weak var passwordField: RoundTextField!
    
    @IBOutlet weak var confirmPassword: RoundTextField!
    
    @IBOutlet weak var genderField: RoundTextField!
    
    @IBOutlet weak var checkBtn: UIButton!
    
    var error = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("OneSignal device id = \(self.oneSignalID ?? "")")
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
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
    
    var check = 0
    @IBAction func Check(_ sender: Any) {
        if check == 0 {
            self.checkBtn.setImage(UIImage(named: "ic_check"), for: .normal)
        check = 1
        }
        else{
            self.checkBtn.setImage(UIImage(named: "ic_uncheck"), for: .normal)
            check = 0
        }
    }
    
    
    @IBAction func Register(_ sender: Any) {
      if self.userNameField.text?.isEmpty == true {
            self.error = "Error, Required Username"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
        }
        
      else if self.firstName.text?.isEmpty == true{
        self.error = "Error, Required FirstName"
        self.performSegue(withIdentifier: "ErrorVC", sender: self)
      }
      else if self.lastName.text?.isEmpty == true{
        self.error = "Error, Required LastName"
        self.performSegue(withIdentifier: "ErrorVC", sender: self)
      }
        else if self.email.text?.isEmpty == true{
            self.error = "Error, Required Email"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        }
        else if self.passwordField.text?.isEmpty == true{
            self.error = "Error, Required Password"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        }
        else if self.confirmPassword.text?.isEmpty == true{
            self.error = "Error, Required ConfirmPassword"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
            
        }
        
      else if self.checkBtn.currentImage == UIImage(named: "ic_uncheck"){
        self.error = "Please read terms of services"
        self.performSegue(withIdentifier: "ErrorVC", sender: self)
      }
            
        else {
            ZKProgressHUD.show("Loading")
        self.signUPAuthentication(userName: self.userNameField.text!, email: self.email.text!, password:self.passwordField.text!, confirmPassword: self.confirmPassword.text!, deviceID: self.oneSignalID ?? "")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ErrorVC"{
            let destinationVc = segue.destination as! SecurityController
            destinationVc.error = error
        }
        
    }
    
    private func updateUserData(){
        UpdateUserDataManager.sharedInstance.updateUserData(firstName: self.firstName.text!, lastName: self.lastName.text!, phoneNumber: "", website: "", address: "", workPlace: "", school: "", gender: self.genderField.text!) { (success,authError , error) in
            if success != nil{
                print(success?.message)
            }
            else if authError != nil {
                print(authError?.errors.errorText)
            }
            else if error != nil{
                print(error?.localizedDescription)
            }
        }
       
    }
    
    
    
    
    private func signUPAuthentication(userName : String,email : String, password : String,confirmPassword : String,deviceID:String) {
        
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            ZKProgressHUD.dismiss()
            self.error = "Internet Connection Failed"
            self.performSegue(withIdentifier: "ErrorVC", sender: self)
        case .online(.wwan), .online(.wiFi):
            
            AuthenticationManager.sharedInstance.signUPAuthentication(userName: userName, password: password, email: email, confirmPassword: confirmPassword,deviceId:deviceID) { (success, authError, error) in
                if success != nil {
                    UserData.setUSER_ID(success?.userID)
                    UserData.setaccess_token(success?.accessToken)
                    self.updateUserData()
                    ZKProgressHUD.dismiss()
                    AppInstance.instance.getProfile()
                    self.performSegue(withIdentifier: "imageSlider", sender: self)
                    print("SignUp Succesfull")
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
    
    
    @IBAction func Gender(_ sender: Any) {
        
        self.genderField.inputView = UIView()
        self.genderField.resignFirstResponder()
        let alert = UIAlertController(title: "", message: "Gender", preferredStyle: .actionSheet)
        
        alert.setValue(NSAttributedString(string: alert.message ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "Male", style: .default, handler: { (_) in
            self.genderField.text = "Male"
         }))

        alert.addAction(UIAlertAction(title: "Female", style: .default, handler: { (_) in
             self.genderField.text = "Female"
        }))
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
            self.genderField.resignFirstResponder()
        }))
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
    }
    
    @IBAction func PopView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TermsofService(_ sender: Any) {
        if let url = URL(string: "https://demo.wowonder.com//terms/terms") {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func PrivacyPolicy(_ sender: Any) {
        if let url = URL(string: "https://demo.wowonder.com/terms/privacy-policy") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
}

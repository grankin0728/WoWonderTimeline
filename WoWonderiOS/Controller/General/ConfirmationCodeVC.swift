
import UIKit
import ZKProgressHUD
import WoWonderTimelineSDK

class ConfirmationCodeVC: UIViewController {
    
    @IBOutlet weak var codeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sendPressed(_ sender: Any) {
        if self.codeTextField.text!.isEmpty{
            self.view.makeToast("Please enter code")
        }else{
            self.verifyCode(code: self.codeTextField.text ?? "", Type: "verify")
        }
    }
    private func verifyCode(code:String,Type:String){
        ZKProgressHUD.show()
        performUIUpdatesOnMain {
            TwoFactorManager.instance.updateVerifyTwoFactor(code: code, Type: Type) { (success, authError, error) in
                if success != nil {
                    self.view.makeToast(success?.message ?? "")
                    self.dismiss(animated: true) {
                        AppInstance.instance.getProfile()
                        ZKProgressHUD.dismiss()
                    }
                }
                else if authError != nil {
                    ZKProgressHUD.dismiss()
                    self.view.makeToast(authError?.errors.errorText)
                    self.showAlert(title: "", message: (authError?.errors.errorText)!)
                }
                else if error  != nil {
                    ZKProgressHUD.dismiss()
                    print(error?.localizedDescription)
                    
                }
            }
            
        }
    }
}

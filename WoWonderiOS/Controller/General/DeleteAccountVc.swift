

import UIKit
import ZKProgressHUD
import WoWonderTimelineSDK
class DeleteAccountVc: UIViewController {
    var password:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func yesPressed(_ sender: Any) {
        self.deleteUser()
    }
    
    @IBAction func noPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private func deleteUser(){
        ZKProgressHUD.show()
        let currentPass = self.password ?? ""
        performUIUpdatesOnMain {
            UpdateUserManager.instance.deleteAccount(currentPassword: currentPass) { (success, authError, error) in
                if success != nil {
                    self.view.makeToast(success?.message ?? "")
                    ZKProgressHUD.dismiss()
                }
                else if authError != nil {
                    ZKProgressHUD.dismiss()
                    self.view.makeToast(authError?.errors?.errorText)
                    self.showAlert(title: "", message: (authError?.errors?.errorText)!)
                }
                else if error  != nil {
                    ZKProgressHUD.dismiss()
                    print(error?.localizedDescription)
                    
                }
            }
        }
        
    }
}

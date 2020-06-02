

import UIKit
import XLPagerTabStrip
import ZKProgressHUD
import WoWonderTimelineSDK
class AddFundsVC: UIViewController {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTextfield: UITextField!
    @IBOutlet weak var addUserBtn: UIButton!
    
     var userId:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func continuePressed(_ sender: Any) {
          if self.amountTextfield.text!.isEmpty {
                          self.view.makeToast("Please enter some amount.")
          }else if self.userId == "" {
                          self.view.makeToast("Please Select one atleast one user.")
          }else{
              self.continuePress(userID: self.userId ?? "", type: "top_up")
          }
      }
      @IBAction func addUserPressed(_ sender: Any) {
                  let storyboard = UIStoryboard(name: "TellFriend", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "SelectUserVC") as! SelectUserVC
          vc.delegate = self
          self.navigationController?.pushViewController(vc, animated: true)
                  
      }
    private func continuePress(userID:String,type:String){
          let amount = Int(self.amountTextfield.text ?? "")
          
          ZKProgressHUD.show()
          
          performUIUpdatesOnMain {
              AddMoneyManager.instance.addMoney(amount: amount!, userID: userID, type: type) { (success, authError, error) in
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
extension AddFundsVC:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Add Funds")
    }
}
extension AddFundsVC:didSelectUserDelegate{
    func didSelectUser(userID: String, username: String, index: Int) {
        self.userId = userID
        self.addUserBtn.setTitle(username, for: .normal)
    }
    
    
}

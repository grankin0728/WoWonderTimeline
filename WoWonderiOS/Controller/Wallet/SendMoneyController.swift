
import UIKit
import Toast_Swift
import WoWonderTimelineSDK
import ZKProgressHUD

class SendMoneyController: UIViewController,selecteUSerDelegate{


    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var amountField: RoundTextField!
    @IBOutlet weak var emailField: RoundTextField!
    
    var myBalance: String? = nil
    var userId: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.balance.text = UserData.getWallet()
    }
    
    
    @IBAction func didTapTextField(_ sender: Any) {
        self.emailField.resignFirstResponder()
        self.emailField.inputView = UIView()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SelectUserVC") as! SelectUserController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    private func sendMoney(user_id: String){
        WalletManager.sharedInstance.sendMoney(user_id: user_id, amount: self.amountField.text!) { (success, authError, error) in
            if success != nil {
                ZKProgressHUD.dismiss()
                self.view.makeToast(success?.message)
            }
            else if authError != nil{
                ZKProgressHUD.dismiss()
                self.view.makeToast(authError?.errors.errorText)
            }
            else if error != nil {
                ZKProgressHUD.dismiss()
                self.view.makeToast(error?.localizedDescription)
            }
        }
    }

    @IBAction func Continue(_ sender: Any) {
        if self.amountField.text?.isEmpty == true{
            self.view.makeToast("Please Enter Amount")
        }
        else if (self.emailField.text?.isEmpty == true){
            self.view.makeToast("Please Enter name or email")
        }
        else{
            ZKProgressHUD.show("Loading")
            self.sendMoney(user_id: self.userId ?? "")
        }
    }
    
    func selectUser(name: String, user_id: String) {
        self.emailField.text = name
        self.userId = user_id
    }
}

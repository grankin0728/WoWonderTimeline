

import UIKit
import WoWonderTimelineSDK

class AddFundController: UIViewController {
    var payPalConfig = PayPalConfiguration() // default
     var environment:String = PayPalEnvironmentSandbox {
         willSet(newEnvironment) {
             if (newEnvironment != environment) {
                 PayPalMobile.preconnect(withEnvironment: newEnvironment)
             }
         }
     }
    
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var amountField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.balance.text = UserData.getWallet()

    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           PayPalMobile.preconnect(withEnvironment: environment)

       }
    
    
    
    private func topUpMoney(user_id: String){
        WalletManager.sharedInstance.topUpMoney(user_id: user_id, amount: self.amountField.text!) { (success, authError, error) in
            if success != nil {
//                ZKProgressHUD.dismiss()
                self.view.makeToast(success?.message)
            }
            else if authError != nil{
//                ZKProgressHUD.dismiss()
                self.view.makeToast(authError?.errors.errorText)
            }
            else if error != nil {
//                ZKProgressHUD.dismiss()
                self.view.makeToast(error?.localizedDescription)
            }
        }
    }
    
    
    @IBAction func Contnue(_ sender: Any) {
        if self.amountField.text?.isEmpty == true{
            self.view.makeToast("Enter Amount")
        }
        else{
            let item1 = PayPalItem(name: "Pay the card", withQuantity: 1, withPrice: NSDecimalNumber(string: self.amountField.text), withCurrency: "USD", withSku: "Hip-0037")
                  let items = [item1]
                  let subtotal = PayPalItem.totalPrice(forItems: items)
                  
                  // Optional: include payment details
                  let shipping = NSDecimalNumber(string: "0.00")
                  let tax = NSDecimalNumber(string: "0.00")
                  let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
                  
                  let total = subtotal.adding(shipping).adding(tax)
                  
                  let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Pay the card", intent: .sale)
                  
                  payment.items = items
                  payment.paymentDetails = paymentDetails
                  
                  if (payment.processable) {
                      let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
                      present(paymentViewController!, animated: true, completion: nil)
                  }
                  else {
                    
                      print("Payment not processalbe: \(payment)")
                  }
        }
    }
}
extension AddFundController:PayPalPaymentDelegate{
    // PayPalPaymentDelegate
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        self.topUpMoney(user_id: UserData.getUSER_ID()!)
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            print("Here is your proof of payment:nn(completedPayment.confirmation)nnSend this to your server for confirmation and fulfillment.")
            self.view.makeToast("Done")
        })
    }
}

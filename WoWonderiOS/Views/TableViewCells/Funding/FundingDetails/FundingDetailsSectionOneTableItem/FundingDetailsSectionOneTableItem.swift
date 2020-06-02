
import UIKit
import LinearProgressBar
import WoWonderTimelineSDK

class FundingDetailsSectionOneTableItem: UITableViewCell {
    
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressBar: LinearProgressBar!
    @IBOutlet weak var lastSeenLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImage: Roundimage!
    @IBOutlet weak var contactBtn: RoundButton!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    var hashID:String? = ""
    var payPalConfig = PayPalConfiguration() // default
    var environment:String = PayPalEnvironmentSandbox {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    
    var vc:ShowFundingDetailsVC?
    override func awakeFromNib() {
        super.awakeFromNib()
        PayPalMobile.preconnect(withEnvironment: environment)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func bind(_ object:GetFundingModel.Datum,index:Int){
        self.usernameLabel.text = object.userData?.username ?? ""
        self.titleLabel.text = object.title ?? ""
        self.descriptionLabel.text = object.datumDescription ?? ""
        self.amountLabel.text = "$\(object.raised ?? 0).00"
        self.totalAmountLabel.text = "$\(object.amount ?? "").00"
        self.timeLabel.text = object.time ?? ""
        self.progressBar.progressValue = CGFloat(object.bar ?? 0)
        
        let url = URL(string: object.image ?? "")
        self.thumImage.kf.setImage(with: url)
        let profileURL = URL(string: object.userData?.avatar ?? "")
        self.profileImage.kf.setImage(with: profileURL)
        self.hashID = object.hashedID ?? ""
        if object.userID == Int(UserData.getUSER_ID()!) {
            self.contactBtn.isHidden = true
        }else{
            self.contactBtn.isHidden = false
        }
        
    }
    @IBAction func contactPressed(_ sender: Any) {
        let appURLScheme = "AppToOpen://"
        guard let appURL = URL(string: appURLScheme) else {
            return
        }
        if UIApplication.shared.canOpenURL(appURL) {
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }
        else {
            self.vc!.view.makeToast("Please install WoWonder Messenger App")
        }
    }
    @IBAction func sharePressed(_ sender: Any) {
        self.shareAcitvity()
    }
    
    @IBAction func donatePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Funding", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SelectPaymentVC") as! SelectPaymentVC
        vc.delegate = self
         if (ControlSettings.showPaymentVC == true){
        self.vc?.present(vc, animated: true, completion: nil)
        }
    }
    private func shareAcitvity(){
        let string = "\(self.descriptionLabel.text!)\n\(APIClient.baseURl)//show_fund/\(self.hashID ?? "")"
//        let myWebsite = NSURL(string:"https://globalhitsradio.com/")
//        let shareAll = [ myWebsite]
//        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self
//        self.vc!.present(activityViewController, animated: true, completion: nil)
        
        let text = string
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.mail,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.message,UIActivity.ActivityType.postToFlickr,UIActivity.ActivityType.postToVimeo,UIActivity.ActivityType.init(rawValue: "net.whatsapp.WhatsApp.ShareExtension"),UIActivity.ActivityType.init(rawValue: "com.google.Gmail.ShareExtension"),UIActivity.ActivityType.init(rawValue: "com.toyopagroup.picaboo.share"),UIActivity.ActivityType.init(rawValue: "com.tinyspeck.chatlyio.share")]
        self.vc!.present(activityViewController, animated: true, completion: nil)
    }
    func GotoPayPal(){
        let item1 = PayPalItem(name: "Pay the card", withQuantity: 1, withPrice: NSDecimalNumber(string: "30"), withCurrency: "USD", withSku: "Hip-0037")
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
            self.vc!.present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            
            print("Payment not processalbe: \(payment)")
        }
    }
    func gotoBankTransfer(){
        let storyboard = UIStoryboard(name: "Funding", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BankTransferVC") as! BankTransferVC
        self.vc?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension FundingDetailsSectionOneTableItem:didSelectPaymentTypeDelegate{
    func didSelectPaymentType(typeString: String, index: Int) {
        if index == 0{
            self.GotoPayPal()
        }else if index == 1{
            gotoBankTransfer()
        }
    }
    
    
}
extension FundingDetailsSectionOneTableItem:PayPalPaymentDelegate{
    // PayPalPaymentDelegate
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        //        self.topUpMoney(user_id: UserData.getUSER_ID()!)
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            print("Here is your proof of payment:nn(completedPayment.confirmation)nnSend this to your server for confirmation and fulfillment.")
            self.vc!.view.makeToast("Done")
        })
    }
}


import UIKit
import WoWonderTimelineSDK


class UpgradeController: UIViewController {
    
    
    private var upgardeArray = [[String:Any]]()
    var selectedindex: Int? = nil
    
    var payPalConfig = PayPalConfiguration() // default
     var environment:String = PayPalEnvironmentSandbox {
         willSet(newEnvironment) {
             if (newEnvironment != environment) {
                 PayPalMobile.preconnect(withEnvironment: newEnvironment)
             }
         }
     }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pro1 = ["main_image":"star","price":"3","validity":"Per Week","pro_type":"STAR","feature_member":"Featured member","profile_visitor":"See profile visitors","last_seen":"Show / Hide last seen","badge":"Verified badge","boost_Post":"Posts promotion","boost_Page":"Pages promotion","discount":"Discount","BtnColor":"#4D7737","BtnTxt":"","pagePro_image":"cross","discount_image":"cross"]
        let pro2 = ["main_image":"flame","price":"8","validity":"Per Month","pro_type":"HOT","feature_member":"Featured member","profile_visitor":"See profile visitors","last_seen":"Show / Hide last seen","badge":"Verified badge","boost_Post":"Boost upto 5 posts","boost_Page":"Boost up to 5 Pages","discount":"10%","BtnColor":"#F9B340","BtnTxt":"","pagePro_image":"check","discount_image":"check"]
        let pro3 = ["main_image":"thunder","price":"89","validity":"Per Year","pro_type":"ULTIMA","feature_member":"Featured member","profile_visitor":"See profile visitors","last_seen":"Show / Hide last seen","badge":"Verified badge","boost_Post":"Boost upto 20 posts","boost_Page":"Boost up to 20 Pages","discount":"20%","BtnColor":"#E13C4B","BtnTxt":"","pagePro_image":"check","discount_image":"check"]
        let pro4 = ["main_image":"rocket","price":"259","validity":"life time","pro_type":"VIP","feature_member":"Featured member","profile_visitor":"See profile visitors","last_seen":"Show / Hide last seen","badge":"Verified badge","boost_Post":"Boost upto 60 posts","boost_Page":"Boost up to 60 Pages","discount":"60%","BtnColor":"#3F4BBA","BtnTxt":"","pagePro_image":"check","discount_image":"check"]
        
        self.upgardeArray.append(pro1)
        self.upgardeArray.append(pro2)
        self.upgardeArray.append(pro3)
        self.upgardeArray.append(pro4)
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        PayPalMobile.preconnect(withEnvironment: environment)
    }
    
    private func userUpGrade(){
        UpgardeUserManager.sharedInstance.upgradeUser(type: self.selectedindex ?? 0) { (success, authError, error) in
            if success != nil{
//                self.view.makeToast(success?.message_data)
                self.dismiss(animated: true, completion: nil)
            }
            else if authError != nil{
                self.view.makeToast(authError?.errors.errorText)
            }
            else if error != nil {
                self.view.makeToast(error?.localizedDescription)
            }
        }
    }
    

    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UpgradeController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.upgardeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpgradeUser", for: indexPath) as! UpgradeUserCell
        let index = self.upgardeArray[indexPath.row]
        if let price = index["price"] as? String{
            cell.priceLabel.text = "\("$")\(price)"
        }
        if let validity = index["validity"] as? String{
            cell.validityLabel.text = validity
        }
        if let type = index["pro_type"] as? String{
            cell.proType.text = type
        }
        if let post = index["boost_Post"] as? String{
            cell.postPromotionLabel.text = post
        }
        if let page = index["boost_Page"] as? String{
            cell.pagePromotion.text = page
        }
        if let color = index["BtnColor"] as? String{
            cell.upgradeBtn.backgroundColor = UIColor.hexStringToUIColor(hex: color)
            cell.priceLabel.textColor = UIColor.hexStringToUIColor(hex: color)
            cell.proType.textColor = UIColor.hexStringToUIColor(hex: color)
        }
        if let image = index["main_image"] as? String{
            if image == "star"{
                cell.mainImage.image = #imageLiteral(resourceName: "StarGreen")
            }
            else if image == "flame"{
                cell.mainImage.image = #imageLiteral(resourceName: "fire-symbol")
            }
            else if image == "thunder"{
                cell.mainImage.image = #imageLiteral(resourceName: "Shape-4")
            }
            else if image == "rocket"{
                cell.mainImage.image = #imageLiteral(resourceName: "small-rocket-ship-silhouette")
            }
        }
        
        if let discountImage = index["discount_image"] as? String{
            if discountImage == "cross"{
                cell.pageImage.image = #imageLiteral(resourceName: "cancel")
                cell.promotionImage.image = #imageLiteral(resourceName: "cancel")
                cell.discountImage.image = #imageLiteral(resourceName: "cancel")
            }
            else{
                cell.pageImage.image = #imageLiteral(resourceName: "checkmark")
                cell.promotionImage.image = #imageLiteral(resourceName: "checkmark")
                cell.discountImage.image = #imageLiteral(resourceName: "checkmark")
            }
        }
        cell.upgradeBtn.tag = indexPath.row
        if ControlSettings.showPaymentVC == true{
        cell.upgradeBtn.addTarget(self, action: #selector(self.GotoPayPal), for: .touchUpInside)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: 420.0)
     }
    
    @objc func GotoPayPal(sender: UIButton){
        self.selectedindex = sender.tag
        let item1 = PayPalItem(name: "Pay the card", withQuantity: 1, withPrice: NSDecimalNumber(string: self.upgardeArray[sender.tag]["price"] as? String), withCurrency: "USD", withSku: "Hip-0037")
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
extension UpgradeController:PayPalPaymentDelegate{
    // PayPalPaymentDelegate
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
//        self.topUpMoney(user_id: UserData.getUSER_ID()!)
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            self.userUpGrade()
            print("Here is your proof of payment:nn(completedPayment.confirmation)nnSend this to your server for confirmation and fulfillment.")
            self.view.makeToast("Done")
        })
    }
}

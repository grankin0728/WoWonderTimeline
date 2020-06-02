
import UIKit
import ZKProgressHUD
import WoWonderTimelineSDK
import GoogleMobileAds

protocol TwoFactorAuthDelegate {
    func getTwoFactorUpdateString(type:String)
}

class TwoFactorAuthenticationVC: UIViewController {
    
    
    @IBOutlet weak var selectBtn: UIButton!
    var bannerView: GADBannerView!

    
    var typeString:String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    private func setupUI(){
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = "Two Factor Authentication"
        
        self.typeString = self.selectBtn.titleLabel?.text ?? ""
        if AppInstance.instance.profile?.userData?.twoFactor == "0"{
            self.selectBtn.setTitle("Disable", for: .normal)
        }else{
            self.selectBtn.setTitle("Enable", for: .normal)
        }
        if ControlSettings.shouldShowAddMobBanner{
                          
                          bannerView = GADBannerView(adSize: kGADAdSizeBanner)
                          addBannerViewToView(bannerView)
                          bannerView.adUnitID = ControlSettings.addUnitId
                          bannerView.rootViewController = self
                          bannerView.load(GADRequest())
                      }
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
                [NSLayoutConstraint(item: bannerView,
                                    attribute: .bottom,
                                    relatedBy: .equal,
                                    toItem: bottomLayoutGuide,
                                    attribute: .top,
                                    multiplier: 1,
                                    constant: 0),
                 NSLayoutConstraint(item: bannerView,
                                    attribute: .centerX,
                                    relatedBy: .equal,
                                    toItem: view,
                                    attribute: .centerX,
                                    multiplier: 1,
                                    constant: 0)
                ])
        }
    
    @IBAction func selectBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "General", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UpdateTwoFactorVC") as! UpdateTwoFactorVC
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
        
        
    }
    @IBAction func savePressed(_ sender: Any) {
        ZKProgressHUD.show()
        if typeString == "on"{
            self.updateTwoFactorSendCode()
        }else{
               self.updateTwoFactor()
        }
     
    }
    private func updateTwoFactor(){
        let type = self.typeString ?? ""
        performUIUpdatesOnMain {
            UpdateUserManager.instance.updateTwoStepVerification(type: type) { (success,authError, error) in
                if success != nil {
                    self.view.makeToast(success?.message ?? "")
                    AppInstance.instance.getProfile()
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
     private func updateTwoFactorSendCode(){
            performUIUpdatesOnMain {
                TwoFactorManager.instance.updateTwoFactor { (success, authError, error) in
                    if success != nil {
                        self.view.makeToast(success?.message ?? "")
                        ZKProgressHUD.dismiss()
                        let vc = UIStoryboard(name: "General", bundle: nil).instantiateViewController(identifier: "ConfirmationCodeVC") as? ConfirmationCodeVC
                        self.present(vc!, animated: true, completion: nil)
                        
                        
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

extension TwoFactorAuthenticationVC:TwoFactorAuthDelegate{
    func getTwoFactorUpdateString(type: String) {
        if type == "on"{
            self.selectBtn.setTitle("Enable", for: .normal)
        }else{
             self.selectBtn.setTitle("Disable", for: .normal)
        }
        
        self.typeString = type
    }
}



import UIKit
import WoWonderTimelineSDK

class PageandGroupMoreController: UIViewController,DeletePageDelegate{
    
    @IBOutlet weak var reviews: UIButton!
    @IBOutlet weak var boostPage: UIButton!
    @IBOutlet weak var setting: UIButton!
    var copyurl = ""
    var isPageowner: Bool? = nil
    var delegate : EditPageDelegete!
    var pageData : ForwardPageData!
    var deletePageDelegate : DeletePageDelegate!
    var delegate1 : PageMoreDelegate?
    
    let Storyboard = UIStoryboard(name: "GroupsAndPages", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !(isPageowner ?? false){
            self.boostPage.isHidden = true
            self.setting.isHidden = true
        }
        else{
            self.boostPage.isHidden = false
            self.setting.isHidden = false
        }
        
    }
    
    
    @IBAction func CopyLink(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate1?.gotoSetting(type: "copy")
        }
    }
    
    @IBAction func Share(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate1?.gotoSetting(type: "share")
        }
    }
    
    
    @IBAction func reviews(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate1?.gotoSetting(type: "reviews")
        }
    }
    
    @IBAction func BoostPage(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate1?.gotoSetting(type: "BoostPage")
        }
    }
    
    
    @IBAction func Setting(_ sender: Any) {

//        self.delegate1?.gotoSetting(type: "setting")
//        if self.isPage == true{
//            self.boostPage.isEnabled = true
//            self.reviews.isEnabled = true
//        let vc = Storyboard.instantiateViewController(withIdentifier: "PageSettingVC") as! PageSettingController
//        vc.pageData = self.pageData
//        vc.delegate = self
//        vc.deleteDelegate = self
//        self.navigationController?.pushViewController(vc, animated: true)
////        self.present(vc, animated: true, completion: nil)
//        }
//        else {
//            let vc = Storyboard.instantiateViewController(withIdentifier: "GroupSettingVC") as! GroupSettingController
//            self.navigationController?.pushViewController(vc, animated: true)
//        }

        self.dismiss(animated: true) {
            self.delegate1?.gotoSetting(type: "setting")
        }

    }
    
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    func editPage(pageData: ForwardPageData) {
//        self.dismiss(animated: true) {
//            self.delegate.editPage(pageData: pageData)
//        }
//    }
    
    func deletePage(pageId: String) {
        self.dismiss(animated: true) {
            self.deletePageDelegate.deletePage(pageId: pageId)
        }
    }
    
}

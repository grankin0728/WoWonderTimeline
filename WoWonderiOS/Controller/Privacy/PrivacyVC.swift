
import UIKit
import ZKProgressHUD
import ActionSheetPicker_3_0
import WoWonderTimelineSDK
class PrivacyVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    private func setupUI(){       
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = "Privacy"
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TellFriendTableItem", bundle: nil), forCellReuseIdentifier: "TellFriendTableItem")
        tableView.register(UINib(nibName: "NotificationOneTableItem", bundle: nil), forCellReuseIdentifier: "NotificationOneTableItem")
        
    }
    
    private func showActionSheetContoller (Type:String){
        if Type == "follow"{
            
            ActionSheetMultipleStringPicker.show(withTitle: "Follow Privacy", rows: [
                ["Everyone", "People i Follow"]
                
                ], initialSelection: [Int(AppInstance.instance.profile?.userData?.followPrivacy ?? "0")], doneBlock: {
                    
                    picker, indexes, values in
                    let index =  (indexes![0] as? Int)!
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TellFriendTableItem
                    if index == 0{
                        cell!.descriptionLabel.text = "Everyone"
                    }else if  index == 1{
                        cell!.descriptionLabel.text = "People i Follow"
                        
                    }
                    
                    
                    self.updateprivacy(Type: Type, value:(indexes![0] as? Int)!)
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
        }else if Type == "message"{
            ActionSheetMultipleStringPicker.show(withTitle: "Message Privacy", rows: [
                ["Everyone", "People i Follow","Nobody"]
                
                ], initialSelection: [Int(AppInstance.instance.profile?.userData?.messagePrivacy ?? "0")], doneBlock: {
                    picker, indexes, values in
                    let index =  (indexes![0] as? Int)!
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? TellFriendTableItem
                    if index == 0{
                        cell!.descriptionLabel.text = "Everyone"
                    }else if  index == 1{
                        cell!.descriptionLabel.text = "People i Follow"
                        
                    }else if  index == 2{
                        cell!.descriptionLabel.text = "Nobody"
                        
                    }
                    self.updateprivacy(Type: Type, value:(indexes![0] as? Int)!)
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
            
        }else if Type == "friend"{
            ActionSheetMultipleStringPicker.show(withTitle: "Friends Privacy", rows: [
                ["Everyone", "People i Follow","People Follow me","Nobody"]
                
                ], initialSelection: [Int(AppInstance.instance.profile?.userData?.friendPrivacy ?? "0")], doneBlock: {
                    picker, indexes, values in
                    let index =  (indexes![0] as? Int)!
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? TellFriendTableItem
                    if index == 0{
                        cell!.descriptionLabel.text = "Everyone"
                    }else if  index == 1{
                        cell!.descriptionLabel.text = "People i Follow"
                        
                    }else if  index == 2{
                        cell!.descriptionLabel.text = "People Follow me"
                        
                    }else if  index == 3{
                        cell!.descriptionLabel.text = "Nobody"
                        
                    }
                    self.updateprivacy(Type: Type, value:(indexes![0] as? Int)!)
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
            
        }else if Type == "timeline"{
            ActionSheetMultipleStringPicker.show(withTitle: "Timeline Privacy", rows: [
                ["Everyone", "People i Follow","Nobody"]
                
                ], initialSelection: [Int(AppInstance.instance.profile?.userData?.postPrivacy ?? "0")], doneBlock: {
                    picker, indexes, values in
                    let index =  (indexes![0] as? Int)!
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? TellFriendTableItem
                    if index == 0{
                        cell!.descriptionLabel.text = "Everyone"
                    }else if  index == 1{
                        cell!.descriptionLabel.text = "People i Follow"
                        
                    }else if  index == 2{
                        cell!.descriptionLabel.text = "Nobody"
                        
                    }
                    self.updateprivacy(Type: Type, value:(indexes![0] as? Int)!)
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
            
        }else if Type == "birthday"{
            ActionSheetMultipleStringPicker.show(withTitle: "birthday Privacy", rows: [
                ["Everyone", "People i Follow","Nobody"]
                
                ], initialSelection: [Int(AppInstance.instance.profile?.userData?.birthPrivacy ?? "0")], doneBlock: {
                    picker, indexes, values in
                    let index =  (indexes![0] as? Int)!
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 4)) as? TellFriendTableItem
                    if index == 0{
                        cell!.descriptionLabel.text = "Everyone"
                    }else if  index == 1{
                        cell!.descriptionLabel.text = "People i Follow"
                        
                    }else if  index == 2{
                        cell!.descriptionLabel.text = "Nobody"
                        
                    }
                    self.updateprivacy(Type: Type, value:(indexes![0] as? Int)!)
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
            
        }else if Type == "status"{
            ActionSheetMultipleStringPicker.show(withTitle: "status", rows: [
                ["Online", "Offline"]
                
                ], initialSelection: [Int(AppInstance.instance.profile?.userData?.friendPrivacy ?? "0")], doneBlock: {
                    picker, indexes, values in
                    let index =  (indexes![0] as? Int)!
                    let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 7)) as? TellFriendTableItem
                    if index == 0{
                        cell!.descriptionLabel.text = "Online"
                    }else if  index == 1{
                        cell!.descriptionLabel.text = "Offline"
                        
                    }
                    self.updateprivacy(Type: Type, value:(indexes![0] as? Int)!)
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
            
        }
    }
    func updateprivacy(Type:String,value:Int){
        var key:String? = ""
        if Type == "follow"{
            key = "follow_privacy"
        }else if Type == "message"{
            key = "message_privacy"
            
        }else if Type == "friend"{
            key = "friend_privacy"
            
        }else if Type == "timeline"{
            key = "post_privacy"
        }else if Type == "birthday"{
            key = "birth_privacy"
        }else if Type == "status"{
            key = "message_privacy"
        }else if Type == "confirmFollowers"{
            key = "confirm_followers"
        }  else if Type == "showActivities"{
            key = "show_activities_privacy"
        } else if Type == "shareMyLocation"{
            key = "share_my_location"
        }
        
        
        
        ZKProgressHUD.show()
        performUIUpdatesOnMain {
            UpdateUserManager.instance.updatePrivacy(key: key!, value: value) { (success, authError, error) in
                if success != nil {
                    AppInstance.instance.getProfile()
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

extension PrivacyVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70.0
        
    }
    
}

extension PrivacyVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TellFriendTableItem") as! TellFriendTableItem
            cell.titleLabel.text = "Who can follow me?"
            if AppInstance.instance.profile?.userData?.followPrivacy == "0"{
                cell.descriptionLabel.text = "Everyone"
            }else if  AppInstance.instance.profile?.userData?.followPrivacy == "1"{
                cell.descriptionLabel.text = "People i Follow"
                
            }
            
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TellFriendTableItem") as! TellFriendTableItem
            cell.titleLabel.text = "Who can message me?"
            if AppInstance.instance.profile?.userData?.messagePrivacy == "0"{
                cell.descriptionLabel.text = "Everyone"
            }else if  AppInstance.instance.profile?.userData?.messagePrivacy == "1"{
                cell.descriptionLabel.text = "People i Follow"
                
            }else if  AppInstance.instance.profile?.userData?.messagePrivacy == "2"{
                cell.descriptionLabel.text = "Nobody"
                
            }
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TellFriendTableItem") as! TellFriendTableItem
            cell.titleLabel.text = "Who can see my friends?"
            if AppInstance.instance.profile?.userData?.friendPrivacy == "0"{
                cell.descriptionLabel.text = "Everyone"
            }else if  AppInstance.instance.profile?.userData?.friendPrivacy == "1"{
                cell.descriptionLabel.text = "People i Follow"
                
            }else if  AppInstance.instance.profile?.userData?.friendPrivacy == "2"{
                cell.descriptionLabel.text = "People Follow me"
                
            }else if  AppInstance.instance.profile?.userData?.friendPrivacy == "3"{
                cell.descriptionLabel.text = "Nobody"
                
            }
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TellFriendTableItem") as! TellFriendTableItem
            cell.titleLabel.text = "Who can post on my timeline?"
            if AppInstance.instance.profile?.userData?.postPrivacy == "0"{
                cell.descriptionLabel.text = "Everyone"
            }else if  AppInstance.instance.profile?.userData?.postPrivacy == "1"{
                cell.descriptionLabel.text = "People i Follow"
                
            }else if  AppInstance.instance.profile?.userData?.postPrivacy == "2"{
                cell.descriptionLabel.text = "Nobody"
                
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TellFriendTableItem") as! TellFriendTableItem
            cell.titleLabel.text = "Who can see my birthday?"
            if AppInstance.instance.profile?.userData?.birthPrivacy == "0"{
                cell.descriptionLabel.text = "Everyone"
            }else if  AppInstance.instance.profile?.userData?.birthPrivacy == "1"{
                cell.descriptionLabel.text = "People i Follow"
                
            }else if  AppInstance.instance.profile?.userData?.birthPrivacy == "2"{
                cell.descriptionLabel.text = "Nobody"
                
            }
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationOneTableItem") as! NotificationOneTableItem
            cell.titleLabel.text = "Confirm Request"
            cell.descriptionLabel.text = "When someone follow me"
            cell.privacyVC = self
            cell.TypeString = "confirmFollowers"
            if AppInstance.instance.profile?.userData?.confirmFollowers == "0"{
                cell.Switchlabel.isOn = false
                cell.value = 0
            }else if AppInstance.instance.profile?.userData?.confirmFollowers == "1"{
                cell.Switchlabel.isOn = true
                cell.value = 1
                
            }
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationOneTableItem") as! NotificationOneTableItem
            cell.titleLabel.text = "Show Activities"
            cell.descriptionLabel.isHidden = true
            if AppInstance.instance.profile?.userData?.showActivitiesPrivacy == "0"{
                cell.Switchlabel.isOn = false
                cell.value = 0
            }else if AppInstance.instance.profile?.userData?.showActivitiesPrivacy == "1"{
                cell.Switchlabel.isOn = true
                cell.value = 1
                
            }
            cell.privacyVC = self
            cell.TypeString = "showActivities"
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TellFriendTableItem") as! TellFriendTableItem
            cell.titleLabel.text = "Status"
            if AppInstance.instance.profile?.userData?.status == "0"{
                cell.descriptionLabel.text = "offline"
            }else if  AppInstance.instance.profile?.userData?.status == "1"{
                cell.descriptionLabel.text = "online"
                
            }
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationOneTableItem") as! NotificationOneTableItem
            cell.titleLabel.text = "Share my location with public"
            cell.descriptionLabel.isHidden = true
            if AppInstance.instance.profile?.userData?.shareMyLocation == "0"{
                cell.Switchlabel.isOn = false
                cell.value = 0
            }else if AppInstance.instance.profile?.userData?.shareMyLocation == "1"{
                cell.Switchlabel.isOn = true
                cell.value = 1
                
            }
            cell.privacyVC = self
            cell.TypeString = "shareMyLocation"
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            
            self.showActionSheetContoller(Type: "follow")
        case 1:
            
            self.showActionSheetContoller(Type: "message")
        case 2:
            self.showActionSheetContoller(Type: "friend")
        case 3:
            self.showActionSheetContoller(Type: "timeline")
        case 4:
            self.showActionSheetContoller(Type: "birthday")
            //        case 5:
            //
            //        case 6:
        //
        case 7:
            self.showActionSheetContoller(Type: "status")
            //        case 8:
        //
        default:
            break;
        }
        
    }
}



import UIKit
import AlamofireImage
import Kingfisher
import SDWebImage
import PaginatedTableView
import Toast_Swift
import ZKProgressHUD
import WoWonderTimelineSDK
import GoogleMobileAds



class ShowFundingsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let spinner = UIActivityIndicatorView(style: .gray)
    let pulltoRefresh = UIRefreshControl()
    var fundingsArray = [GetFundingModel.Datum]()
    let status = Reach().connectionStatus()
    var interstitial: GADInterstitial!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ControlSettings.shouldShowAddMobBanner{
        interstitial = GADInterstitial(adUnitID:  ControlSettings.interestialAddUnitId)
        let request = GADRequest()
        interstitial.load(request)
        }
    self.activityIndicator.startAnimating()
       self.setupUI()
    }
    func CreateAd() -> GADInterstitial {
              let interstitial = GADInterstitial(adUnitID:  ControlSettings.interestialAddUnitId)
              interstitial.load(GADRequest())
              return interstitial
          }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func addFundingPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Funding", bundle: nil)
              let vc = storyboard.instantiateViewController(withIdentifier: "AddUpdateFundingVC") as! AddUpdateFundingVC
              self.navigationController?.pushViewController(vc, animated: true)
    }
    private func setupUI(){
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = "Fundings"
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "GetFundingTableItem", bundle: nil), forCellReuseIdentifier: "GetFundingTableItem")
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .white
        self.pulltoRefresh.tintColor = UIColor.hexStringToUIColor(hex: "#984243")
        self.pulltoRefresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.tableView.addSubview(pulltoRefresh)
//        ZKProgressHUD.show()
        self.fundingsArray.removeAll()
        self.tableView.reloadData()
        self.loadFundings()
    }
    @objc func networkStatusChanged(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let status = userInfo["Status"] as! String
            print(status)
            
        }
        
    }
    @objc func refresh(){
        self.fundingsArray.removeAll()
        self.tableView.reloadData()
        loadFundings()
        pulltoRefresh.endRefreshing()
        
    }
    private func loadFundings(){
        switch status {
        case .unknown, .offline:
            ZKProgressHUD.dismiss()
            self.view.makeToast("Internet Connection Failed")
        case .online(.wwan), .online(.wiFi):
            performUIUpdatesOnMain {
                FundingManager.instance.getFundings(type: "funding", limit: 0, offset: 0) { (success, authError, error) in
                    if success != nil {
                        
                        success?.forEach({ (it) in
                            guard let id = it["id"] as? Int else{return}
                            guard let title = it["title"] as? String else{return}
                            guard let description = it["description"] as? String else {return}
                            guard let amount = it["amount"] as? String else {return}
                            guard let userID = it["user_id"] as? Int else{return}
                            guard let image = it["image"] as? String else {return}
                            guard let time = it["time"] as? String else {return }
                            guard let raised = it["raised"] as? Int else {return}
                            guard let bar = it["bar"] as? Int else {return }
                              guard let hashID = it["hashed_id"] as? String else {return }
                            guard let userdata = it["user_data"] as? [String:Any] else{return }
                            guard let user_id = userdata["user_id"] as? String else{return }
                            guard let username = userdata["username"] as? String else{return }
                            guard let avatar = userdata["avatar"] as? String else {return }
                            let Data = GetFundingModel.UserData(userID: user_id, username: username ,email: nil, firstName: nil , lastName: nil, avatar: avatar, cover: nil)
                            let object = GetFundingModel.Datum(id: id, hashedID: hashID, title: title, datumDescription: description, amount: amount, userID: userID, image: image, time: time, raised: raised, bar: bar, userData: Data)
                            self.fundingsArray.append(object)
                            self.activityIndicator.stopAnimating()
                            
                            //                            let object = GetFundingModel.Datum(id: it["id"] as? Int, hashedID: nil, title: id["title"] as? String, datumDescription: it["description"] as? String, amount: it["amount"] as? String, userID: it["user_id"] as? Int, image: it["image"] as? String, time: it["time"] as? String, raised: it["raised"] as? Int, bar: it["bar"] as? Int, userData:nil )
                        })
                        //                        self.fundingsArray = success?.data ?? []
                        self.tableView.reloadData()
                        ZKProgressHUD.dismiss()
                        
                    }
                    else if authError != nil {
                        self.activityIndicator.stopAnimating()
                        self.view.makeToast(authError?.errors?.errorText)
                        self.showAlert(title: "", message: (authError?.errors?.errorText)!)
                    }
                    else if error  != nil {
//                        ZKProgressHUD.dismiss()
                        print(error?.localizedDescription)
                        
                    }
                }
            }
        }
    }
}
extension ShowFundingsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 490.0
    }
}


extension ShowFundingsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fundingsArray.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GetFundingTableItem") as! GetFundingTableItem
        let object = self.fundingsArray[indexPath.row]
        cell.bind(object,index:indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if AppInstance.instance.addCount == ControlSettings.interestialCount {
                                         if interstitial.isReady {
                                             interstitial.present(fromRootViewController: self)
                                             interstitial = CreateAd()
                                             AppInstance.instance.addCount = 0
                                         } else {
                                             
                                             print("Ad wasn't ready")
                                         }
                                     }
                                     AppInstance.instance.addCount = AppInstance.instance.addCount! + 1
        let storyboard = UIStoryboard(name: "Funding", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ShowFundingDetailsVC") as! ShowFundingDetailsVC
        vc.object = self.fundingsArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



import UIKit
import WoWonderTimelineSDK

class ShowFundingDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var object:GetFundingModel.Datum?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.setupUI()
       }
    
    
    @IBAction func addFundingPressed(_ sender: Any) {
    }
    
    
       private func setupUI(){
           
           self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
           
           let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
           navigationController?.navigationBar.titleTextAttributes = textAttributes
           self.navigationItem.title = "Fundings"
           
           self.tableView.separatorStyle = .none
           tableView.register(UINib(nibName: "FundingDetailsSectionOneTableItem", bundle: nil), forCellReuseIdentifier: "FundingDetailsSectionOneTableItem")
    }
    
}
extension ShowFundingDetailsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 695.0
    }
}


extension ShowFundingDetailsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FundingDetailsSectionOneTableItem") as! FundingDetailsSectionOneTableItem
      
        cell.vc = self
        cell.bind(object!,index:indexPath.row)
        cell.backBtn.addTarget(self, action: #selector(self.Back(sender:)), for: .touchUpInside)
        return cell
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        let storyboard = UIStoryboard(name: "General", bundle: nil)
    //        let vc = storyboard.instantiateViewController(withIdentifier: "UpdateBlockUnBlockVC") as! UpdateBlockUnBlockVC
    //        vc.object = self.blockedUserArray[indexPath.row]
    //        self.present(vc, animated: true, completion: nil)
    //    }
    @IBAction func Back(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
}

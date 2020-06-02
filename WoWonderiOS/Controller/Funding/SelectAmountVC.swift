
import UIKit
import WoWonderTimelineSDK

class SelectAmountVC: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    let amountArray = [
        "5","10","15","20","25","30","35","40","45","50"
    
    ]
    var delegate : didGetFundingAmountDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableVIew.separatorStyle = .none
                  tableVIew.register(UINib(nibName: "SelectAmountTableItem", bundle: nil), forCellReuseIdentifier: "SelectAmountTableItem")
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension SelectAmountVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.amountArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAmountTableItem") as? SelectAmountTableItem
        cell?.bind(self.amountArray[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            self.delegate?.didGetFundingAmount(amount: self.amountArray[indexPath.row], index: indexPath.row)
        }
    }
}

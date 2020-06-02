

import UIKit
import XLPagerTabStrip
import NotificationCenter
import WoWonderTimelineSDK



class EventsParentController: ButtonBarPagerTabStripViewController,UITableViewDelegate {
    
    override func viewDidLoad() {
        self.setupTabbar()
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = "Event"

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    
        // change selected bar color
        
    }
    private func setupTabbar(){
        
    settings.style.buttonBarBackgroundColor = .white
    settings.style.buttonBarItemBackgroundColor = .white
    settings.style.selectedBarBackgroundColor = UIColor.hexStringToUIColor(hex: "984243")
    settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
    settings.style.selectedBarHeight = 1.0
    settings.style.buttonBarMinimumLineSpacing = 0
    settings.style.buttonBarItemTitleColor = UIColor.hexStringToUIColor(hex: "984243")
    settings.style.buttonBarItemsShouldFillAvailableWidth = true
    settings.style.buttonBarLeftContentInset = 0
    settings.style.buttonBarRightContentInset = 0
    changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
    guard changeCurrentIndex == true else { return }
    oldCell?.label.textColor = .black
        newCell?.label.textColor = UIColor.hexStringToUIColor(hex: "984243")
    }}
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let child_1 = UIStoryboard(name: "MarketPlaces-PopularPost-Events", bundle: nil).instantiateViewController(withIdentifier: "AllEventVC")
    let child_2 = UIStoryboard(name: "MarketPlaces-PopularPost-Events", bundle: nil).instantiateViewController(withIdentifier: "MyEventVC")
    return [child_1, child_2]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "createEvent"), object: nil)
    }

}

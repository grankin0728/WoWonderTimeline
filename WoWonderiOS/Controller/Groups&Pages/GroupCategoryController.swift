
import UIKit
import WoWonderTimelineSDK


class GroupCategoryController: UIViewController {
  
    var delegate : selectCategoryDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func Category(_ sender: UIButton) {
       switch sender.tag {
        case 0:
        print("Category ID 1")
        self.delegate.selectCategory(categoryID: 1, categoryName: "Cars and Vehicles")
        self.dismiss(animated: true, completion: nil)
        case 1:
        print("Category ID 2")
        self.delegate.selectCategory(categoryID: 2, categoryName: "Comedy")
        self.dismiss(animated: true, completion: nil)
        case 2:
        print("Category ID 3")
        self.delegate.selectCategory(categoryID: 3, categoryName: "Economics & Trade")
        self.dismiss(animated: true, completion: nil)
        case 3:
        print("Category ID 4")
        self.delegate.selectCategory(categoryID: 4, categoryName: "Education")
        self.dismiss(animated: true, completion: nil)
        case 4:
        print("Category ID 5")
        self.delegate.selectCategory(categoryID: 5, categoryName: "Entertainment")
        self.dismiss(animated: true, completion: nil)
        case 5:
        print("Category ID 6")
        self.delegate.selectCategory(categoryID: 6, categoryName: "Movies & Animation")
        self.dismiss(animated: true, completion: nil)
        case 6:
        print("Category ID 7")
        self.delegate.selectCategory(categoryID: 7, categoryName: "Gaming")
        self.dismiss(animated: true, completion: nil)
        case 7:
        print("Category ID 8")
        self.delegate.selectCategory(categoryID: 8, categoryName: "History and Facts")
        self.dismiss(animated: true, completion: nil)
        case 8:
        print("Category ID 9")
        self.delegate.selectCategory(categoryID: 9, categoryName: "Live Style")
        self.dismiss(animated: true, completion: nil)
        case 9:
        print("Category ID 10")
        self.delegate.selectCategory(categoryID: 10, categoryName: "Natural")
        self.dismiss(animated: true, completion: nil)
        case 10:
        print("Category ID 11")
        self.delegate.selectCategory(categoryID: 11, categoryName: "News and Politics")
        self.dismiss(animated: true, completion: nil)
        case 11:
        print("Category ID 12")
        self.delegate.selectCategory(categoryID: 12, categoryName: "People and Nations")
        self.dismiss(animated: true, completion: nil)
        case 12:
        print("Category ID 13")
        self.delegate.selectCategory(categoryID: 13, categoryName: "Pets & Animals")
        self.dismiss(animated: true, completion: nil)
       case 13:
        print("Category ID 14")
        self.delegate.selectCategory(categoryID: 14, categoryName: "Places & Regions")
        self.dismiss(animated: true, completion: nil)
        case 14:
        print("Category ID 15")
        self.delegate.selectCategory(categoryID: 15, categoryName: "Science and Technology")
        self.dismiss(animated: true, completion: nil)
       case 15:
       print("Category ID 16")
        self.delegate.selectCategory(categoryID: 16, categoryName: "Sports")
        self.dismiss(animated: true, completion: nil)
        case 16:
        print("Category ID 17")
        self.delegate.selectCategory(categoryID: 17, categoryName: "Traval and Events")
        self.dismiss(animated: true, completion: nil)
        case 17:
        print("Category ID 0")
        self.delegate.selectCategory(categoryID: 0, categoryName: "Other")
        self.dismiss(animated: true, completion: nil)
        default:
        print("Default")
        }
        
    }
    
  

    
}

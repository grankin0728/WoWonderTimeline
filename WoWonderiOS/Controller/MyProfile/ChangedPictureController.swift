

import UIKit
import WoWonderTimelineSDK


class ChangedPictureController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var delegate: changeProfilePicDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   private func showAlert() {

        let alert = UIAlertController(title: "", message: "Select Source", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    if let popoverController = alert.popoverPresentationController {
        popoverController.sourceView = self.view
        popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        popoverController.permittedArrowDirections = []
    }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {

            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            imagePickerController.modalTransitionStyle = .coverVertical
            imagePickerController.modalPresentationStyle = .fullScreen
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func Avatar(_ sender: Any) {
        self.delegate?.changePic(image: "avatar")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func Cover(_ sender: Any) {
         self.delegate?.changePic(image: "cover")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func Close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print(chosenImage)
        self.dismiss(animated: true, completion: nil)
    }
    
    

}

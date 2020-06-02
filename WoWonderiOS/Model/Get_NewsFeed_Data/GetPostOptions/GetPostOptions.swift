import WoWonderTimelineSDK
import Foundation
import UIKit

class GetPostOptions :AddReactionDelegate,SharePostDelegate {
    
    var targetController : UIViewController!
    var tableView : UITableView!
    var selectedIndex = 0
    var postArray = [[String:Any]]()
    var selectedIndexs = [[String:Any]]()
    let Storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    func getPostOptions(targertController :UIViewController,tableView : UITableView, indexpath:IndexPath, array : [[String:Any]], stackViewHeight: CGFloat,viewHeight: CGFloat, isHidden: Bool, viewColor :UIColor) -> UITableViewCell  {
        self.targetController = targertController
        self.tableView = tableView
        self.postArray = array
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostOptions") as! PostOptionCell
        let index = postArray[indexpath.row]
        cell.likeandcommentViewHeight.constant = viewHeight
        cell.stackViewHeight.constant = stackViewHeight
        cell.likesCountBtn.isHidden = isHidden
        cell.commentsCountBtn.isHidden = isHidden
        cell.LikeBtn.isHidden = isHidden
        cell.CommentBtn.isHidden = isHidden
        cell.ShareBtn.isHidden = isHidden
        cell.contentView.backgroundColor = viewColor
        cell.view1.isHidden = true
        cell.view2.isHidden = true
        cell.view3.isHidden = true
        cell.view4.isHidden = true
        cell.view5.isHidden = true
        cell.view6.isHidden = true
        cell.view7.isHidden = true
        cell.view8.isHidden = true
        cell.view9.isHidden = true
        cell.view10.isHidden = true
        var names = ""
        var isPro = ""
        var isVerified = ""
        var optionsArray = [[String:Any]]()
        if let options = index["options"] as? [[String:Any]]{
            for i in options {
                optionsArray.append(i)
            }
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200.0
        
        if let time = index["post_time"] as? String{
            cell.timeLabel.text! = time
        }
        if let textStatus = index["postText"] as? String {
            cell.statusLabel.text! = textStatus.htmlToString
        }
        if let publisher = index["publisher"] as? [String:Any] {
            if let profilename = publisher["name"] as? String{
                names = profilename
            }
            if let avatarUrl =  publisher["avatar"] as? String {
                let url = URL(string: avatarUrl)
                cell.profileImage.kf.setImage(with: url)
            }
            if let is_pro = publisher["is_pro"] as? String{
                isPro = is_pro
            }
            if let is_verify = publisher["verified"] as? String{
                isVerified = is_verify
            }
        }
        if let option = index["options"] as? [[String:Any]]{
            for i in option {
                if cell.view1.isHidden == true {
                    if let text = i["text"] as? String{
                        cell.label1.text! = text.htmlToString
                        cell.view1.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView1.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent1.text = "\(percentage)"
                    }
                    if let all_Vote = i["all"] as? Int{
                        cell.voteLabel.text = "\(all_Vote)\(" Votes")"
                    }
                }
                else if cell.view2.isHidden == true {
                    if let text = i["text"] as? String{
                        cell.label2.text! = text.htmlToString
                        cell.view2.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView2.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent2.text = "\(percentage)"
                    }
                    
                }
                else if cell.view3.isHidden == true {
                    if let text = i["text"] as? String{
                        cell.label3.text! = text.htmlToString
                        cell.view3.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView3.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent3.text = "\(percentage)"
                    }
                    
                }
                else if cell.view4.isHidden == true{
                    if let text = i["text"] as? String{
                        cell.label4.text! = text.htmlToString
                        cell.view4.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView4.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent4.text = "\(percentage)"
                    }
                    
                }
                    
                else if cell.view5.isHidden == true {
                    if let text = i["text"] as? String{
                        cell.label5.text! = text.htmlToString
                        cell.view5.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView5.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent5.text = "\(percentage)"
                    }
                    
                }
                    
                else if cell.view6.isHidden == true{
                    if let text = i["text"] as? String{
                        cell.label6.text! = text.htmlToString
                        cell.view6.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView6.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent6.text = "\(percentage)"
                    }
                }
                    
                else if cell.view7.isHidden == true {
                    if let text = i["text"] as? String{
                        cell.label7.text! = text.htmlToString
                        cell.view7.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView7.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent7.text = "\(percentage)"
                    }
                }
                    
                else if cell.view8.isHidden == true{
                    if let text = i["text"] as? String{
                        cell.label8.text! = text.htmlToString
                        cell.view8.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView8.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent8.text = "\(percentage)"
                    }
                }
                    
                else if cell.view9.isHidden == true {
                    
                    if let text = i["text"] as? String{
                        cell.label9.text! = text.htmlToString
                        cell.view9.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView9.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent9.text = "\(percentage)"
                    }
                    
                }
                    
                else if cell.view10.isHidden == true{
                    
                    if let text = i["text"] as? String{
                        cell.label10.text! = text.htmlToString
                        cell.view10.isHidden = false
                    }
                    if let percentage_num = i["percentage_num"] as? String{
                        if let floatValue = Float(percentage_num) {
                            print("Float value = \(floatValue)")
                            cell.ProgressView10.progress = floatValue/100
                        } else {
                            print("String does not contain Float")
                        }
                    }
                    if let percentage = i["percentage"] as? String{
                        cell.Percent10.text = "\(percentage)"
                    }
                }
            }
        }
        cell.statusLabel.handleURLTap { (URL) in
            print("Tap URL")
            UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        }
        cell.statusLabel.handleHashtagTap { (hash) in
            print(hash)
            let Storyboard = UIStoryboard(name: "Search", bundle: nil)
            let vc = Storyboard.instantiateViewController(withIdentifier: "PostHashTagVC") as! PostHashTagController
            vc.hashtag = hash
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(vc, animated: true, completion: nil)
        }
        if let commentsCount = index["post_comments"] as? String{
            cell.commentsCountBtn.setTitle("\("Comments ")\(commentsCount)", for: .normal)
        }
        
        if let reactions = index["reaction"] as? [String:Any]{
            if let count = reactions["count"] as? Int{
                cell.likesCountBtn.setTitle("\(count)\(" Likes")", for: .normal)
            }
            if let isreact  = reactions["is_reacted"] as? Bool {
                if isreact == true{
                    if let type = reactions["type"] as? String{
                        if type == "6"{
                            cell.LikeBtn.setImage(UIImage(named: "angry"), for: .normal)
                            cell.LikeBtn.setTitle("   Angry", for: .normal)
                            cell.LikeBtn.setTitleColor(.red, for: .normal)
                        }
                        else if type == "1"{
                            cell.LikeBtn.setImage(UIImage(named: "like-2"), for: .normal)
                            cell.LikeBtn.setTitle("   Like", for: .normal)
                            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "3D5898"), for: .normal)
                        }
                        else if type == "2"{
                            cell.LikeBtn.setImage(UIImage(named: "love"), for: .normal)
                            cell.LikeBtn.setTitle("   Love", for: .normal)
                            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FB1002"), for: .normal)
                        }
                        else if type == "4"{
                            cell.LikeBtn.setImage(UIImage(named: "wow"), for: .normal)
                            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
                            cell.LikeBtn.setTitle("   Wow", for: .normal)
                        }
                        else if type == "5"{
                            cell.LikeBtn.setImage(UIImage(named: "sad"), for: .normal)
                            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
                            cell.LikeBtn.setTitle("   Sad", for: .normal)
                        }
                        else if type == "3"{
                            cell.LikeBtn.setImage(UIImage(named: "haha"), for: .normal)
                            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
                            cell.LikeBtn.setTitle("   Haha", for: .normal)
                        }
                    }
                }
                else{
                    cell.LikeBtn.setTitleColor(.lightGray, for: .normal)
                    cell.LikeBtn.setImage(UIImage(named:"like"), for: .normal)
                    cell.LikeBtn.setTitle("  Like", for: .normal)
                }
            }
        }
        
        for i in self.selectedIndexs{
            if i["index"] as? Int == indexpath.row{
                if let reaction = i["reaction"] as? String{
                    if reaction == "6"{
                        cell.LikeBtn.setImage(UIImage(named: "angry"), for: .normal)
                        cell.LikeBtn.setTitle("   Angry", for: .normal)
                        cell.LikeBtn.setTitleColor(.red, for: .normal)
                    }
                    else if reaction == "1"{
                        cell.LikeBtn.setImage(UIImage(named: "like-2"), for: .normal)
                        cell.LikeBtn.setTitle("   Like", for: .normal)
                        cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "3D5898"), for: .normal)
                        //                        var localPostArray = self.postArray[(i["index"] as? Int)!]["reaction"] as! [String:Any]
                        //                        localPostArray["is_reacted"] = true
                    }
                    else if reaction == "2"{
                        cell.LikeBtn.setImage(UIImage(named: "love"), for: .normal)
                        cell.LikeBtn.setTitle("   Love", for: .normal)
                        cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FB1002"), for: .normal)
                    }
                    else if reaction == "4"{
                        cell.LikeBtn.setImage(UIImage(named: "wow"), for: .normal)
                        cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
                        cell.LikeBtn.setTitle("   Wow", for: .normal)
                    }
                    else if reaction == "5"{
                        cell.LikeBtn.setImage(UIImage(named: "sad"), for: .normal)
                        cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
                        cell.LikeBtn.setTitle("   Sad", for: .normal)
                    }
                    else if reaction == "3"{
                        cell.LikeBtn.setImage(UIImage(named: "haha"), for: .normal)
                        cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
                        cell.LikeBtn.setTitle("   Haha", for: .normal)
                    }
                        
                    else if reaction == ""{
                        cell.LikeBtn.setTitleColor(.lightGray, for: .normal)
                        cell.LikeBtn.setImage(UIImage(named:"like"), for: .normal)
                        cell.LikeBtn.setTitle("  Like", for: .normal)
                    }
                }
                if let count = i["count"] as? Int{
                    cell.likesCountBtn.setTitle("\(count)\(" Likes")", for: .normal)
                }
            }
        }
    
        cell.LikeBtn.tag = indexpath.row
        cell.CommentBtn.tag = indexpath.row
        cell.moreBtn.tag = indexpath.row
        cell.profileImage.tag = indexpath.row
        cell.profileName.tag = indexpath.row
        let normalTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.NormalTapped(gesture:)))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.LongTapped(gesture:)))
        normalTapGesture.numberOfTapsRequired = 1
        longGesture.minimumPressDuration = 0.30
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.gotoUserProfile(gesture:)))
        let gestureonLabel = UITapGestureRecognizer(target: self, action: #selector(self.gotoUserProfile(gesture:)))
        
        cell.LikeBtn.addGestureRecognizer(normalTapGesture)
        cell.LikeBtn.addGestureRecognizer(longGesture)
        cell.profileImage.addGestureRecognizer(gesture)
        cell.profileImage.isUserInteractionEnabled = true
        cell.profileName.isUserInteractionEnabled = true
        cell.profileName.addGestureRecognizer(gestureonLabel)
        cell.likesCountBtn.tag = indexpath.row
        cell.likesCountBtn.addTarget(self, action: #selector(self.GotoPostReaction(sender:)), for: .touchUpInside)
        cell.ShareBtn.tag = indexpath.row
        cell.ShareBtn.addTarget(self, action: #selector(self.GotoShare(sender:)), for: .touchUpInside)
        cell.CommentBtn.addTarget(self, action: #selector(self.GotoComments(sender:)), for: .touchUpInside)
        cell.moreBtn.addTarget(self, action: #selector(self.More(sender:)), for: .touchUpInside)
        let imageAttachment =  NSTextAttachment()
        let imageAttachment1 =  NSTextAttachment()
        imageAttachment.image = UIImage(named:"veirfied")
        imageAttachment1.image = UIImage(named: "flash-1")
        let imageOffsetY: CGFloat = -2.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        imageAttachment1.bounds = CGRect(x: 0, y: imageOffsetY, width: 11.0, height: 14.0)
        let attechmentString = NSAttributedString(attachment: imageAttachment)
        let attechmentString1 = NSAttributedString(attachment: imageAttachment1)
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.black]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let attributedString1 = NSMutableAttributedString(string: names, attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string: " ", attributes:attrs2)
        let attributedString3 = NSMutableAttributedString(attributedString: attechmentString)
        let attributedString4 = NSMutableAttributedString(string: " ", attributes:attrs2)
        let attributedString5 = NSMutableAttributedString(attributedString: attechmentString1)
        attributedString1.append(attributedString2)
        if (isVerified == "1") && (isPro == "1"){
            attributedString1.append(attributedString3)
            attributedString1.append(attributedString4)
            attributedString1.append(attributedString5)
        }
        else if (isVerified == "1"){
            attributedString1.append(attributedString3)
            attributedString1.append(attributedString4)
        }
        else if (isPro == "1"){
            attributedString1.append(attributedString5)
        }
        cell.profileName.attributedText = attributedString1
        
        cell.layoutIfNeeded()
        return cell
    }
    
    
    @IBAction func LongTapped(gesture: UILongPressGestureRecognizer){
        self.selectedIndex = gesture.view!.tag
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LikeReactionsVC") as! LikeReactionsController
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.targetController.present(vc, animated: true, completion: nil)
    }
    @IBAction func NormalTapped(gesture: UIGestureRecognizer){
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            self.tableView.makeToast("Internet Connection Failed")
        case .online(.wwan), .online(.wiFi):
            let cell = self.tableView.cellForRow(at: IndexPath(row: gesture.view!.tag, section: 5)) as! PostOptionCell
            if let reactions = self.postArray[gesture.view!.tag]["reaction"] as? [String:Any]{
                var totalCount = 0
                if let count = reactions["count"] as? Int{
                    totalCount = count
                }
                if let is_react = reactions["is_reacted"] as? Bool{
                    if is_react == true{
                        self.reactions(index: gesture.view!.tag, reaction: "")
                        var localPostArray = self.postArray[gesture.view!.tag]["reaction"] as! [String:Any]
                        localPostArray["is_reacted"] = false
                        localPostArray["type"]  = ""
                        localPostArray["count"] = totalCount - 1
                        totalCount =  localPostArray["count"] as? Int ?? 0
                        self.postArray[gesture.view!.tag]["reaction"] = localPostArray
                        cell.likesCountBtn.setTitle("\(totalCount)\(" Likes")", for: .normal)
                        cell.LikeBtn.setImage(UIImage(named: "like"), for: .normal)
                        cell.LikeBtn.setTitle("  Like", for: .normal)
                        cell.LikeBtn.setTitleColor(.lightGray, for: .normal)
                        let action = ["count": totalCount, "reaction": "","index":gesture.view?.tag ?? 0] as [String : Any]
                        var count = 0
                        if self.selectedIndexs.count == 0{
                            self.selectedIndexs.append(action)
                        }
                        else{
                            for i in self.selectedIndexs{
                                count += 1
                                if i["index"] as? Int == gesture.view?.tag{
                                    print((count) - 1)
                                    self.selectedIndexs[(count) - 1] = action
                                }
                                else{
                                    self.selectedIndexs.append(action)
                                }
                            }
                        }
                    }
                    else{
                        var localPostArray = self.postArray[gesture.view!.tag]["reaction"] as! [String:Any]
                        localPostArray["is_reacted"] = true
                        localPostArray["type"]  = "Like"
                        localPostArray["count"] = totalCount + 1
                        localPostArray["Like"] = 1
                        totalCount =  localPostArray["count"] as? Int ?? 0
                        self.postArray[gesture.view!.tag]["reaction"] = localPostArray
                        self.reactions(index: gesture.view!.tag, reaction: "1")
                        cell.likesCountBtn.setTitle("\(totalCount)\(" Likes")", for: .normal)
                        cell.LikeBtn.setImage(UIImage(named: "like-2"), for: .normal)
                        cell.LikeBtn.setTitle("   Like", for: .normal)
                        cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "3D5898"), for: .normal)
                        let action = ["count": totalCount, "reaction": "1","index":gesture.view?.tag ?? 0] as [String : Any]
                        var count = 0
                        print(self.selectedIndexs.count)
                        if self.selectedIndexs.count == 0 {
                            self.selectedIndexs.append(action)
                        }
                        else{
                            for i in self.selectedIndexs{
                                count += 1
                                if i["index"] as? Int == gesture.view?.tag{
                                    print((count) - 1)
                                    self.selectedIndexs[(count) - 1] = action
                                }
                                else{
                                    self.selectedIndexs.append(action)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    private func reactions(index :Int, reaction: String) {
        performUIUpdatesOnMain {
            var postID = ""
            if let postId = self.postArray[index]["post_id"] as? String{
                postID = postId
            }
            AddReactionManager.sharedInstance.addReaction(postId: postID, reaction: reaction) { (success, authError, error) in
                if success != nil{
                    print(success?.action)
                }
                else if authError != nil{
                    print(authError?.errors.errorText)
                }
                else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func GotoPostReaction(sender :UIButton){
        if let reaction = self.postArray[sender.tag]["reaction"] as? [String:Any]{
            if let count = reaction["count"] as? Int{
                if count > 0 {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "PostReactionVC") as! PostReactionController
                    if let postId = self.postArray[sender.tag]["post_id"] as? String{
                        vc.postId = postId
                    }
                    if let reactions = self.postArray[sender.tag]["reaction"] as? [String:Any]{
                        vc.reaction = reactions
                    }
                    targetController.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    func addReaction(reation: String) {
        let cell = self.tableView.cellForRow(at: IndexPath(row: self.selectedIndex, section: 5)) as! PostOptionCell
        self.reactions(index: self.selectedIndex, reaction: reation)
        var localPostArray = self.postArray[self.selectedIndex]["reaction"] as! [String:Any]
        var totalCount = 0
        if let reactions = self.postArray[self.selectedIndex]["reaction"] as? [String:Any]{
            if let is_react = reactions["is_reacted"] as? Bool{
                if !is_react {
                    if let count = reactions["count"] as? Int{
                        totalCount = count
                    }
                    localPostArray["count"] = totalCount + 1
                    totalCount =  localPostArray["count"] as? Int ?? 0
                    cell.likesCountBtn.setTitle("\(totalCount)\(" Likes")", for: .normal)
                }
                else{
                    if let count = reactions["count"] as? Int{
                        totalCount = count
                    }
                }

            }
        }
        
        let action = ["count": totalCount, "reaction": reation,"index": self.selectedIndex] as [String : Any]
        var count = 0
        print(self.selectedIndexs.count)
        if self.selectedIndexs.count == 0 {
            self.selectedIndexs.append(action)
        }
        else{
            for i in self.selectedIndexs{
                count += 1
                if i["index"] as? Int == self.selectedIndex{
                    print((count) - 1)
                    self.selectedIndexs[(count) - 1] = action
                }
                else{
                    self.selectedIndexs.append(action)
                }
            }
        }
        localPostArray["is_reacted"] = true
        localPostArray["type"]  = reation
        
        if reation == "1"{
            localPostArray["Like"] = 1
            localPostArray["1"] = 1
            self.postArray[self.selectedIndex]["reaction"] = localPostArray
            cell.LikeBtn.setImage(UIImage(named: "like-2"), for: .normal)
            cell.LikeBtn.setTitle("   Like", for: .normal)
            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "3D5898"), for: .normal)
        }
        else if reation == "2"{
            localPostArray["Love"] = 1
            localPostArray["2"] = 1
            self.postArray[self.selectedIndex]["reaction"] = localPostArray
            cell.LikeBtn.setImage(UIImage(named: "love"), for: .normal)
            cell.LikeBtn.setTitle("   Love", for: .normal)
            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FB1002"), for: .normal)
        }
        else if reation == "3"{
            localPostArray["HaHa"] = 1
            localPostArray["3"] = 1
            self.postArray[self.selectedIndex]["reaction"] = localPostArray
            cell.LikeBtn.setImage(UIImage(named: "haha"), for: .normal)
            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
            cell.LikeBtn.setTitle("   Haha", for: .normal)
        }
        else if reation == "4"{
            localPostArray["Wow"] = 1
            localPostArray["4"] = 1
            self.postArray[self.selectedIndex]["reaction"] = localPostArray
            cell.LikeBtn.setImage(UIImage(named: "wow"), for: .normal)
            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
            cell.LikeBtn.setTitle("   Wow", for: .normal)
        }
        else if reation == "5"{
            localPostArray["Sad"] = 1
            localPostArray["5"] = 1
            self.postArray[self.selectedIndex]["reaction"] = localPostArray
            cell.LikeBtn.setImage(UIImage(named: "sad"), for: .normal)
            cell.LikeBtn.setTitleColor(UIColor.hexStringToUIColor(hex: "FECD30"), for: .normal)
            cell.LikeBtn.setTitle("   Sad", for: .normal)
        }
        else {
            localPostArray["Angry"] = 1
            localPostArray["6"] = 1
            self.postArray[self.selectedIndex]["reaction"] = localPostArray
            cell.LikeBtn.setImage(UIImage(named: "angry"), for: .normal)
            cell.LikeBtn.setTitle("   Angry", for: .normal)
            cell.LikeBtn.setTitleColor(.red, for: .normal)
        }
    }
        
    @IBAction func GotoShare(sender :UIButton){
        self.selectedIndex = sender.tag
        let vc = Storyboard.instantiateViewController(withIdentifier: "ShareVC") as! ShareController
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        targetController.present(vc, animated: true, completion: nil)
    }
    
    func sharePost() {
        let vc = Storyboard.instantiateViewController(withIdentifier : "SharePostVC") as! SharePostController
        vc.posts =  [self.postArray[self.selectedIndex]]
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.targetController.present(vc, animated: true, completion: nil)
    }
    
    func sharePostTo(type:String) {
        if (type == "group") || (type == "page"){
            let Storyboard = UIStoryboard(name: "GroupsAndPages", bundle: nil)
            let vc = Storyboard.instantiateViewController(withIdentifier : "MyGroups&PagesVC") as! MyGroupsandMyPagesController
            vc.type = type
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.targetController.present(vc, animated: true, completion: nil)
        }
        else {
            let vc = Storyboard.instantiateViewController(withIdentifier : "SharePopUpVC") as! SharePopUpController
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.targetController.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func GotoComments (sender :UIButton){
        let vc = Storyboard.instantiateViewController(withIdentifier: "CommentVC") as! CommentController
        if let postId = self.postArray[sender.tag]["post_id"] as? String{
            vc.postId = postId
        }
        if let reaction = self.postArray[sender.tag]["reaction"] as? [String:Any]{
            if let count = reaction["count"] as? Int{
                vc.likes = count
            }
        }
        if let comments = self.postArray[sender.tag]["get_post_comments"] as? [[String:Any]]{
            print(comments)
            vc.comments = comments
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        targetController.present(vc, animated: true, completion: nil)
    }
    
    func selectPageandGroup(data: [String : Any],type : String) {
        let vc = Storyboard.instantiateViewController(withIdentifier : "SharePostVC") as! SharePostController
        vc.posts =  [self.postArray[self.selectedIndex]]
        if type == "group"{
            if let groupName = data["group_name"] as? String{
                vc.groupName = groupName
            }
            if let groupId = data["id"] as? String{
                vc.groupId = groupId
            }
            if let image  = data["avatar"] as? String{
                let trimmedString = image.trimmingCharacters(in: .whitespaces)
                vc.imageUrl = trimmedString
            }
            vc.isGroup = true
        }
        else {
            if let pageName = data["page_title"] as? String{
                vc.pageName = pageName
            }
            if let pageId = data["id"] as? String{
                vc.pageId = pageId
            }
            if let image  = data["avatar"] as? String{
                vc.imageUrl = image
            }
            vc.isPage = true
        }
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.targetController.present(vc, animated: true, completion: nil)
    }
    
    func sharePostLink() {
        
        // text to share
        var text = ""
        if let postUrl =  self.postArray[selectedIndex]["url"] as? String{
            text = postUrl
        }
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.targetController.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional,)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.mail,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.message,UIActivity.ActivityType.postToFlickr,UIActivity.ActivityType.postToVimeo,UIActivity.ActivityType.init(rawValue: "net.whatsapp.WhatsApp.ShareExtension"),UIActivity.ActivityType.init(rawValue: "com.google.Gmail.ShareExtension"),UIActivity.ActivityType.init(rawValue: "com.toyopagroup.picaboo.share"),UIActivity.ActivityType.init(rawValue: "com.tinyspeck.chatlyio.share")]
        
        // present the view controller
        self.targetController.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func gotoUserProfile(gesture: UIGestureRecognizer){
        if AppInstance.instance.vc == "myProfile"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
        else if (AppInstance.instance.vc == "newsFeedVC"){
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "performSegue"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "performSegue"), object: nil, userInfo: userInfo)
            }
        }
        else if AppInstance.instance.vc == "popularPostVC"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
        else if AppInstance.instance.vc == "hasTagPostVC"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
        else if AppInstance.instance.vc == "savedPostVC"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
        else if AppInstance.instance.vc == "showPostVC"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
        else if AppInstance.instance.vc == "eventDetailVC"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
        else if AppInstance.instance.vc == "pageVC"{

        }
        else if AppInstance.instance.vc == "groupVC"{
            if (AppInstance.instance.index != nil) && (gesture.view?.tag == 0){
                print(AppInstance.instance.index)
                let userInfo = ["userData":AppInstance.instance.index,"tag":gesture.view?.tag ?? 0,"type":"share"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
            else{
                let userInfo = ["userData":gesture.view!.tag,"type":"profile"] as [String : Any]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
            }
        }
    }
    
    @IBAction func More(sender: UIButton){
        var post_id: String? = nil
        if let postId = self.postArray[sender.tag]["post_id"] as? String{
            post_id = postId
        }
        let alert = UIAlertController(title: "", message: "More", preferredStyle: .actionSheet)
        
        alert.setValue(NSAttributedString(string: alert.message ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedMessage")
        
        if let is_saved = self.postArray[sender.tag]["is_post_saved"] as? Bool{
            if !is_saved{
                alert.addAction(UIAlertAction(title: "Save Post", style: .default, handler: { (_) in
                    let status = Reach().connectionStatus()
                    switch status {
                    case .unknown, .offline:
                        self.tableView.makeToast("Internet Connection Failed")
                    case .online(.wwan), .online(.wiFi):
                        self.postArray[sender.tag]["is_post_saved"] = true
                        SavePostManager.sharedInstance.savedPost(targetController: self.targetController, postId: post_id ?? "", action: "save")
                    }
                }))
            }
            else{
                alert.addAction(UIAlertAction(title: "Unsave Post", style: .default, handler: { (_) in
                    let status = Reach().connectionStatus()
                    switch status {
                    case .unknown, .offline:
                        self.tableView.makeToast("Internet Connection Failed")
                    case .online(.wwan), .online(.wiFi):
                        self.postArray[sender.tag]["is_post_saved"] = false
                        SavePostManager.sharedInstance.savedPost(targetController: self.targetController, postId: post_id ?? "", action: "save")
                    }
                }))
            }
        }
        if let copyText = self.postArray[sender.tag]["postText"] as? String{
            if copyText != ""{
                alert.addAction(UIAlertAction(title: "Copy Text", style: .default, handler: { (_) in
                    UIPasteboard.general.string = copyText
                    self.targetController.view.makeToast("Copied")
                }))
            }
        }
        if let copyLink = self.postArray[sender.tag]["url"] as? String{
            alert.addAction(UIAlertAction(title: "Copy Link", style: .default, handler: { (_) in
                UIPasteboard.general.string = copyLink
                self.targetController.view.makeToast("Copied")
            }))
        }
        if let publisher = self.postArray[sender.tag]["publisher"] as? [String:Any]{
            if let is_myPost = publisher["user_id"] as? String{
                if is_myPost != UserData.getUSER_ID(){
                    if let is_report = self.postArray[sender.tag]["is_post_reported"] as? Bool{
                        if !is_report{
                            alert.addAction(UIAlertAction(title: "Report Post", style: .default, handler: { (_) in
                                let status = Reach().connectionStatus()
                                switch status {
                                case .unknown, .offline:
                                    self.tableView.makeToast("Internet Connection Failed")
                                case .online(.wwan), .online(.wiFi):
                        ReportPostManager.sharedInstance.reportedPost(targetController: self.targetController, postId: post_id ?? "")
                                }
                            }))
                        }
                    }
                }
            }
        }
          if let publisher = self.postArray[sender.tag]["publisher"] as? [String:Any]{
          if let is_myPost = publisher["user_id"] as? String{
            if is_myPost == UserData.getUSER_ID(){
                //                alert.addAction(UIAlertAction(title: "Edit Post", style: .default, handler: { (_) in
                //                }))
                //                alert.addAction(UIAlertAction(title: "Boost Post", style: .default, handler: { (_) in
                //                }))
                alert.addAction(UIAlertAction(title: "Delete Post", style: .default, handler: { (_) in
                    DeletePostManager.sharedInstance.postDelete(targetController: self.targetController,   postId: post_id ?? "") { (success) in
                        if AppInstance.instance.vc == "myProfile"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "newsFeedVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "performSegue"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "popularPostVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "hasTagPostVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "savedPostVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "showPostVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "eventDetailVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "pageVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                        else if AppInstance.instance.vc == "groupVC"{
                            let userInfo = ["userData":sender.tag,"type":"delete"] as [String : Any]
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notifire"), object: nil, userInfo: userInfo)
                        }
                    }
                }))
            }
        }
    }
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.targetController.view
            popoverController.sourceRect = CGRect(x: self.targetController.view.bounds.midX, y: self.targetController.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.targetController.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    static let sharedInstance = GetPostOptions()
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()
    }
    
    ///Network Connectivity.
    @objc func networkStatusChanged(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let status = userInfo["Status"] as! String
            print(status)
            
        }
        
    }
    
    
}




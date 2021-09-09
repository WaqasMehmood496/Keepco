//
//  HomeViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Toast_Swift
import Alamofire
import SwiftyJSON
import Kingfisher
import NVActivityIndicatorView
import ImageViewer_swift


class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var labelError: UILabel!
    
    var postController: PostViewController!
    var userController: UserProfileViewController!
    var isHomeHidden = false
    
    var array = [Post]()
    
    var freeSelected = 0
    var marketingSelected = 1
    var experienceSelected = 0
    
    var homeAddress: String!
    var homeLat: String!
    var homeLng: String!
    var user_id: String!
    var user_image: String!
    var radius: String = "250"
    var isRunning = false
    let POSTS_URL = Config.BASE_URL + "nearbyhomepage";
    let LIKE_URL = Config.BASE_URL + "likeSystem";
    static var isActive = false
    var request: Alamofire.Request!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        tableView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 250,right: 0)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 410
        
        
        array.append(Post())
        getDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDetails()
        getPosts()
        HomeViewController.isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        HomeViewController.isActive = false
    }
    
    func getDetails(){
        let defaults = UserDefaults.standard
        homeAddress = defaults.string(forKey: Config.HOME_ADDRESS) ?? ""
        homeLat = defaults.string(forKey: Config.HOME_LAT) ?? "0"
        homeLng = defaults.string(forKey: Config.HOME_LNG) ?? "0"
        user_id = defaults.string(forKey: Config.USER_ID) ?? ""
        user_image = defaults.string(forKey: Config.USER_IMAGE) ?? ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func goBack(){
        if(postController != nil){
            postController.willMove(toParent: nil)
            postController.view.removeFromSuperview()
            postController.removeFromParent()
            
            isHomeHidden = false
        }
        
        if(userController != nil){
            userController.willMove(toParent: nil)
            userController.view.removeFromSuperview()
            userController.removeFromParent()
            
            isHomeHidden = false
        }
    }
    
    var count = 0
    
    @objc func valueChanged(sender: UISlider) {
       let newValue = Int(sender.value/15) * 15
        var value = 0
        if(sender.value < 100){
            value = 0
            radius = "0"
        }
        else if sender.value < 250 {
            value = 100
            radius = "100"
        }
        else if sender.value < 500 {
            value = 250
            radius = "250"
        }
        else {
            value = 500
            radius = "500"
        }
//        else {
//            value = 1000
//        }
        
        sender.setValue(Float(value), animated: false)
        print("Param Radius \(radius)")
        if(!isRunning){
            getPosts()
            print("Param Called \(radius)")

        }
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                // handle drag began
                print("Began")
                break
            case .moved:
                // handle drag moved
                print("Moved")
                break
            case .ended:
                // handle drag ended
                print("Ended")
                let newValue = Int(slider.value/15) * 15
                 var value = 0
                 if(slider.value < 50){
                     value = 0
                     radius = "0"
                 }
                 else if slider.value < 180 {
                     value = 100
                     radius = "100"
                 }
                 else if slider.value < 400 {
                     value = 250
                     radius = "250"
                 }
                 else {
                     value = 500
                     radius = "500"
                 }
                slider.setValue(Float(value), animated: false)
                if(!isRunning){
                    getPosts()
                    print("Param Called \(radius)")
                }
                break
            default:
                break
            }
        }
    }
    
    @objc func goToProfile(sender: MyTapGesture){
        print(sender.index)
        let row = sender.index
        if(array[row].user_id == self.user_id){
            return
        }
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        userController = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        userController.user_id = array[row].user_id
        userController.delegate = self
        addChild(userController)
        userController.view.frame = self.view.bounds
        self.view.addSubview(userController.view)
        userController.didMove(toParent: self)
    }
    
    
    
    func getTags() -> String {
        var tag = ""
        if(marketingSelected == 1){
            tag = "marketing"
        }
        if(freeSelected == 1){
            if(tag.isEmpty){
                tag = "free"
            }
            else {
                tag = tag + ",free"
            }
        }
        if(experienceSelected == 1){
            if(tag.isEmpty){
                tag = "experience"
            }
            else {
                tag = tag + ",experience"
            }
        }
        
        return tag
    }
    
    //REST API
    func getPosts(){
        var tag = getTags()
        if(tag.isEmpty){
            self.array.removeAll()
            self.array.append(Post())
            self.tableView.reloadData()
            return
        }
        isRunning = true
        
        self.labelError.isHidden = true
        self.array.removeAll()
        self.array.append(Post())
        
        self.tableView.reloadData()
        
        let parameters: [String: String] = [
            "lat": homeLat,
            "lng": homeLng,
            "distance": radius,
            "user_id": user_id,
            "tag": tag
        ]
        
        print("Param: \(parameters)")
        self.indicator.startAnimating()
        
        request = AF.request(POSTS_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    self.isRunning = false
                    
                    if success == 1 {
                        let jsonArray = json["data"].arrayValue
                        
                        for item in jsonArray {
                            let post = Post(post_id: item["posts_id"].stringValue, user_id: item["user_id"].stringValue, desc: item["description"].stringValue, type: item["type"].stringValue, post_category: item["post_category"].stringValue, distance: item["distance"].stringValue, isLiked: item["my_like_status"].boolValue, likes: item["no_of_likes"].stringValue, comments: item["no_of_comments"].stringValue, image: item["post_image"].stringValue, lat: item["checking_loc_lat"].stringValue, lng: item["checking_loc_lng"].stringValue, myImage: self.user_image, user_image: item["profile_photo"].stringValue, user_name: item["user_name"].stringValue, checkedLocation: item["checking_address"].stringValue)
                            
                            self.array.append(post)
                        }
                        
                        
                        if(jsonArray.count == 0){
                            self.labelError.isHidden = false
                        }
                        else {
                            self.labelError.isHidden = true
                        }
                        
                    }
                    else {
                        if(language == "en"){
                            let msg = json["msg"].stringValue
                            self.view.makeToast(msg)
                        }
                        else {
                            self.view.makeToast("קבלת פוסטים נכשלה")
                        }
                    }
                    if(self.getTags() == ""){
                        self.array.removeAll()
                        self.array.append(Post())
                    }
                    self.tableView.reloadData()
                    
                    

                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.isRunning = false
                    self.indicator.stopAnimating()
                }
        }
    }
    
    func like(post_id: String, index: Int){
           let parameters: [String: String] = [
               "post_id": post_id,
               "user_id": user_id!
           ]
           
           self.indicator.startAnimating()
           
           AF.request(POSTS_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
               .responseJSON { response in
                   switch response.result {
                   case .success(let data):
                       let json = JSON(data)
                       print(json)
                       let success = json["sucess"].int
                       self.isRunning = false
                       
                       var post = self.array[index]
                       
                       if success == 1 {
                        var isLiked = json["status"].stringValue
                        if(isLiked == "like"){
                            post.isLiked = true
                        }
                        else {
                            post.isLiked = false
                        }
                        
                        self.array[index] = post
                       }
                       self.tableView.reloadData()

                       self.indicator.stopAnimating()
                       break
                       
                   case .failure(let error):
                       print(error)
                       self.isRunning = false
                       self.indicator.stopAnimating()
                   }
           }
       }
    
}

//MARK:- Delegate
extension HomeViewController: UsersListDelegate {
    func closeController() {
        goBack()
    }
}



//MARK:- TableView

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
            
            cell.slider.setThumbImage(UIImage(named: "marker_rotated"), for: .normal)
//            cell.slider.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
            cell.slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
//            cell.slider.isContinuous = false
            
            if(language == "en"){
                cell.slider.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            else {
                cell.slider.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
            if(radius == "0"){
                cell.slider.setValue(0, animated: false)
            }
            else if(radius == "100"){
                cell.slider.setValue(100, animated: false)
            }
            else if(radius == "250"){
                cell.slider.setValue(250, animated: false)
            }
            else if(radius == "500"){
                cell.slider.setValue(500, animated: false)
            }
            
            cell.labelAddress.text = self.homeAddress
            
            cell.viewRadio.layer.borderColor = UIColor(hexString: "#343997").cgColor
            cell.viewRadio.layer.borderWidth = 1
            cell.viewRadio.layer.cornerRadius = 5
            
            
            cell.btnCamera.tag = indexPath.row
            cell.btnCamera.addTarget(self, action: #selector(goToPost(sender:)), for: .touchUpInside)

            cell.btnPhoto.tag = indexPath.row
            cell.btnPhoto.addTarget(self, action: #selector(goToPost(sender:)), for: .touchUpInside)

            cell.btnCheckIn.tag = indexPath.row
            cell.btnCheckIn.addTarget(self, action: #selector(goToPost(sender:)), for: .touchUpInside)

            cell.btnShare.tag = indexPath.row
            cell.btnShare.addTarget(self, action: #selector(goToPost(sender:)), for: .touchUpInside)

            
          
            cell.btnMarketing.tag = indexPath.row
            cell.btnMarketing.addTarget(self, action: #selector(marketingTapped(sender:)), for: .touchUpInside)
            
            cell.btnFree.tag = indexPath.row
            cell.btnFree.addTarget(self, action: #selector(freeTapped(sender:)), for: .touchUpInside)
            
            cell.btnExperience.tag = indexPath.row
            cell.btnExperience.addTarget(self, action: #selector(experienceTapped(sender:)), for: .touchUpInside)
            
            
            if marketingSelected == 1 {
                cell.btnMarketing.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
            }
            else {
                cell.btnMarketing.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
            }
            
            
            if freeSelected == 1 {
                cell.btnFree.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
            }
            else {
                cell.btnFree.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
            }
            
            
            if experienceSelected == 1 {
                cell.btnExperience.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
            }
            else {
                cell.btnExperience.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
            }
            
            
            
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .white
            cell.selectedBackgroundView = backgroundView
            return cell            
        }
        else {
            
            var index = indexPath.row
            let post = array[index]
            
            if(post.type == "media"){
                let cell = tableView.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath) as! PostsTableViewCell
                
                
                
                cell.labelName.text = post.user_name
                let tap2: MyTapGesture = MyTapGesture(target: self, action: #selector(HomeViewController.goToProfile(sender:)))
                cell.labelName.addGestureRecognizer(tap2)
                cell.labelName.isUserInteractionEnabled = true
                tap2.index = indexPath.row
                
                //User Image
                if(!post.user_image.isEmpty){
                    let url = URL(string: post.user_image)
                    cell.imgProfile.kf.setImage(with: url)
                }
                else {
                    cell.imgProfile.image = #imageLiteral(resourceName: "ic_no_image")
                }
                
                cell.imgProfile.isUserInteractionEnabled = true
                let tap1: MyTapGesture = MyTapGesture(target: self, action: #selector(HomeViewController.goToProfile(sender:)))
                cell.imgProfile.addGestureRecognizer(tap1)
                tap1.index = indexPath.row
                
                
                if(user_image.isEmpty){
                    cell.imgComment.image = #imageLiteral(resourceName: "ic_no_image")
                }
                else {
                    let url = URL(string: user_image)
                    cell.imgComment.kf.setImage(with: url)
                }
                
                
                //POST IMAGe
                if(!post.image.isEmpty){
                    let url = URL(string: post.image)
                    cell.imgPost.kf.indicatorType = .activity
                    (cell.imgPost.kf.indicator?.view as? UIActivityIndicatorView)?.color = UIColor(hexString: "#343997")
                    cell.imgPost.kf.setImage(with: url, options: [
                        .processor(DownsamplingImageProcessor(size: cell.imgPost.bounds.size)),
                        .loadDiskFileSynchronously,
                        .cacheOriginalImage,
                        .transition(.fade(0.25))
                    ])
                    cell.imgPost.setupImageViewer(url: url!)
                }
                else {
                    cell.imgPost.image = UIImage(named: "ic_no_post")
                }
                
                
                //Check In
                if(post.lat == "0" || post.lat.isEmpty){
                    cell.labelCheckIn.isHidden = true
                    cell.ic_location.isHidden = true
                    cell.topConstraintImage.constant = 10
                    cell.layoutIfNeeded()
                }
                else {
                    cell.labelCheckIn.isHidden = false
                    cell.ic_location.isHidden = false
                    cell.topConstraintImage.constant = 27
                    cell.layoutIfNeeded()
                }
                
                // Description
                if(!post.desc.isEmpty){
                    cell.labelDesc.text = post.desc
                    cell.labelDesc.isHidden = false
                }
                else {
                    cell.labelDesc.isHidden = true
                }
                
                cell.btnComment.tag = indexPath.row
                cell.btnComment.addTarget(self, action: #selector(HomeViewController.commentTapped(sender:)), for: .touchUpInside)
                
                cell.imgMsg.isUserInteractionEnabled = true
                let tap: MyTapGesture = MyTapGesture(target: self, action: #selector(HomeViewController.msgTapped(sender:)))
                cell.imgMsg.addGestureRecognizer(tap)
                tap.index = indexPath.row
                
                
                //            let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped(tapGestureRecognizer:)))
                //            tap.numberOfTapsRequired = 2
                //            cell.viewPost.tag = indexPath.row
                //            cell.viewPost.isUserInteractionEnabled = true
                //            cell.viewPost.addGestureRecognizer(tap)
                
                
                if(!array[index].isLiked){
                    cell.btnLike.setImage(UIImage(named: "ic_like"), for: .normal)
                }
                else {
                    cell.btnLike.setImage(UIImage(named: "ic_like_selected"), for: .normal)
                }
                
                
                cell.btnLike.tag = indexPath.row
                cell.btnLike.addTarget(self, action: #selector(likeTapped(sender:)), for: .touchUpInside)
                
                cell.labelDistance.text = post.distance
                
                cell.labelLikes.text = post.likes
                cell.labelComments.text = post.comments
                
                
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .white
                cell.selectedBackgroundView = backgroundView
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "postsTextCell", for: indexPath) as! PostsTableViewCell
                
                cell.labelName.text = post.user_name
                let tap2: MyTapGesture = MyTapGesture(target: self, action: #selector(HomeViewController.goToProfile(sender:)))
                cell.labelName.addGestureRecognizer(tap2)
                cell.labelName.isUserInteractionEnabled = true
                tap2.index = indexPath.row
                
                //User Image
                if(!post.user_image.isEmpty){
                    let url = URL(string: post.user_image)
                    cell.imgProfile.kf.setImage(with: url)
                }
                else {
                    cell.imgProfile.image = #imageLiteral(resourceName: "ic_no_image")
                }
                
                cell.imgProfile.isUserInteractionEnabled = true
                let tap1: MyTapGesture = MyTapGesture(target: self, action: #selector(HomeViewController.goToProfile(sender:)))
                cell.imgProfile.addGestureRecognizer(tap1)
                tap1.index = indexPath.row
                
                
                if(user_image.isEmpty){
                    cell.imgComment.image = #imageLiteral(resourceName: "ic_no_image")
                }
                else {
                    let url = URL(string: user_image)
                    cell.imgComment.kf.setImage(with: url)
                }
                
                
                
                //Check In
                if(post.lat == "0" || post.lat.isEmpty){
                    cell.labelCheckIn.isHidden = true
                    cell.ic_location.isHidden = true
                    cell.topConstraintImage.constant = 10
                    cell.layoutIfNeeded()
                }
                else {
                    cell.labelCheckIn.isHidden = false
                    cell.ic_location.isHidden = false
                    cell.topConstraintImage.constant = 27
                    cell.layoutIfNeeded()
                }
                
                // Description
                if(!post.desc.isEmpty){
                    cell.labelDesc.text = post.desc
                    cell.labelDesc.isHidden = false
                }
                else {
                    cell.labelDesc.isHidden = true
                }
                
                cell.btnComment.tag = indexPath.row
                cell.btnComment.addTarget(self, action: #selector(HomeViewController.commentTapped(sender:)), for: .touchUpInside)
                
                cell.imgMsg.isUserInteractionEnabled = true
                let tap: MyTapGesture = MyTapGesture(target: self, action: #selector(HomeViewController.msgTapped(sender:)))
                cell.imgMsg.addGestureRecognizer(tap)
                tap.index = indexPath.row
                
                
                if(!array[index].isLiked){
                    cell.btnLike.setImage(UIImage(named: "ic_like"), for: .normal)
                }
                else {
                    cell.btnLike.setImage(UIImage(named: "ic_like_selected"), for: .normal)
                }
                
                
                cell.btnLike.tag = indexPath.row
                cell.btnLike.addTarget(self, action: #selector(likeTapped(sender:)), for: .touchUpInside)
                
                cell.labelDistance.text = post.distance
                
                cell.labelLikes.text = post.likes
                cell.labelComments.text = post.comments
                
                
                let backgroundView = UIView()
                backgroundView.backgroundColor = .white
                cell.selectedBackgroundView = backgroundView
                
                return cell
            }
        }
    }
    
    @objc func commentTapped(sender: UIButton){
        let index = sender.tag
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        controller.modalPresentationStyle = .fullScreen
        controller.post_id = array[index].post_id
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func msgTapped(sender: MyTapGesture){
        let index = sender.index
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        controller.modalPresentationStyle = .fullScreen
        controller.post_id = array[index].post_id
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func doubleTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        // do something here
        print("abc")
        let v = tapGestureRecognizer.view!
        let index = v.tag
        
        var likes = Int(array[index].likes)
        
        if(array[index].isLiked){
            array[index].isLiked = false
            likes = likes! - 1
        } else {
            array[index].isLiked = true
            likes = likes! + 1
        }
        array[index].likes = "\(likes!)"
        
        //Call Rest Api
        like(post_id: array[index].post_id, index: index)
        
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func likeTapped(sender: UIButton){
        let index = sender.tag
        
        var likes = Int(array[index].likes)
        
        if(array[index].isLiked){
            array[index].isLiked = false
            likes = likes! - 1
        } else {
            array[index].isLiked = true
            likes = likes! + 1
        }
        array[index].likes = "\(likes!)"
        
        //Call Rest Api
        like(post_id: array[index].post_id, index: index)
        
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
      }
    
    @objc func marketingTapped(sender: UIButton){
        if(marketingSelected == 0){
            marketingSelected = 1
        }
        else {
            marketingSelected = 0
        }
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
      
        if(!isRunning){
            getPosts()
        }
        else {
            self.request.cancel()
            getPosts()
        }
    }
    
    @objc func freeTapped(sender: UIButton){
        if(freeSelected == 0){
            freeSelected = 1
        }
        else {
            freeSelected = 0
        }
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        
        if(!isRunning){
            getPosts()
        }
        else {
            self.request.cancel()
            getPosts()
        }
    }
    
    @objc func experienceTapped(sender: UIButton){
        if(experienceSelected == 0){
            experienceSelected = 1
        }
        else {
            experienceSelected = 0
        }
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        
        if(!isRunning){
            getPosts()
        }
        else {
            self.request.cancel()
            getPosts()
        }
    }
    
    @objc func goToPost(sender: UIButton){
//        performSegue(withIdentifier: "toPost", sender: nil)
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        postController = storyboard.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        addChild(postController)
        postController.lat = homeLat
        postController.lng = homeLng
        postController.delegate = self
        postController.view.frame = self.view.bounds
        self.view.addSubview(postController.view)
        postController.didMove(toParent: self)
        
        isHomeHidden = true
        HomeViewController.isActive = false

        
    }
    
    
}


//MARK:- Delegate
extension HomeViewController: PostControllerDelegate {
    func newPost() {
        goBack()
        getPosts()
    }
}


//MARK:- TEXT FIELD

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
   func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}



//MARK:- TEXT FIELD EXTENSION

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


//MARK:- UITapGesture
class MyTapGesture: UITapGestureRecognizer {
    var index = Int()
}

//
//  UserProfileViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 8/15/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON

class UserProfileViewController: UIViewController {

    @IBOutlet weak var viewTalk: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var viewProgress: UIView!
    @IBOutlet weak var btnTalk: UIButton!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelHomeAddress: UILabel!
    @IBOutlet weak var labelWorkAddress: UILabel!
    @IBOutlet weak var labelViews: UILabel!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    
    @IBOutlet weak var labelBoard: UILabel!
    @IBOutlet weak var labelBoardTop: UILabel!
    @IBOutlet weak var labelBoardBottom: UILabel!
    @IBOutlet weak var imgBoard: UIImageView!
    
    var isProfileHidden = false
    var funController: UserFunsViewController!
    var occupationController: UserOccupationViewController!
    var manageBoard: ManageAdvertisingViewController!
    
    let USER_PROFILE = Config.BASE_URL + "userdetail/";
    var user_id: String!
    var my_id: String!
    var user: User!
    var funAnswers: String!
    var occupationAnswers: String!
    var advert: String!
    var delegate: UsersListDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        my_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
        
        viewTalk.layer.cornerRadius = 23
        viewTalk.layer.borderColor = UIColor(hexString: "#343997").cgColor
        viewTalk.layer.borderWidth = 1
        
      
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
        
        imgView.layer.cornerRadius = imgView.frame.height/2
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(messagesTapped(tapGestureRecognizer:)))
        viewTalk.isUserInteractionEnabled = true
        viewTalk.addGestureRecognizer(tap1)
        
        getUser()
    }
    
    @objc func messagesTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        newViewController.user_id = user.id
        newViewController.user_image = user.image
        newViewController.user_name = user.username
        newViewController.modalPresentationStyle = .fullScreen
        
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func closePressed(_ sender: Any) {
        delegate.closeController()
    }
    
    //REST API
    func getUser(){
        self.viewProgress.isHidden = false
        self.indicator.startAnimating()
        
        let parameters : [String: String] = ["user_id": my_id]

                
        AF.request(USER_PROFILE + user_id, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        let object = json["user_detail"]
                        self.user = User(id: object["user_id"].stringValue, email: object["user_email"].stringValue, username: object["user_name"].stringValue, password: "", image: object["Image"].stringValue, gender: object["gender"].stringValue, phone: object["phone_number"].stringValue, dob: object["dob"].stringValue, home_address: object["address"].stringValue, work_address: object["work_address"].stringValue, home_lat: object["latitude"].stringValue, home_lng: object["logitude"].stringValue, work_lat: object["work_lat"].stringValue, work_lng: object["work_lng"].stringValue, occupation: object["occupation_id"].stringValue, sub_occupation: object["suboccupation_id"].stringValue, fun: object["fun_id"].stringValue, sub_fun: object["subfun_id"].stringValue, distance: "", no_of_views: object["no_of_view"].stringValue)
                        
                        let answersArray = json["youranswers"].arrayValue
                        let occupationsText = json["occupation_text"].arrayValue
                        
                        self.funAnswers = "\(answersArray)"
                        self.occupationAnswers = "\(occupationsText)"
                        
                        self.advert = "\(json["advertisment_banner"])"
                        
                        self.setData()
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("No results found")
                        }
                        else {
                            self.view.makeToast("לא נמצאו תוצאות")
                        }
                    }
                    
                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true
                }
        }
    }
    
    func setData(){
        
        labelName.text = user.username
        labelViews.text = user.no_of_views
        
        if(language == "en"){
            labelAge.text = "\(user.gender), \(getAgeFromDOF(date: user.dob).0)"
            labelHomeAddress.text = "Lives in \(user.home_address)"
            
            if(user.work_address.isEmpty){
                labelWorkAddress.text = "-"
            }
            else {
                labelWorkAddress.text = "Working at \(user.work_address)"
            }
            
            btnTalk.setTitle("Talk to \(user.username)", for: .normal)
            
        }
        else {
            labelAge.text = "\(getAgeFromDOF(date: user.dob).0) ,\(user.gender)"
            labelHomeAddress.text = "\(user.home_address) גר ב"
            
            if(user.work_address.isEmpty){
                labelWorkAddress.text = "-"
            }
            else {
                labelWorkAddress.text = "\(user.work_address) עובד ב"
            }
            
            btnTalk.setTitle("\(user.username) דבר עם", for: .normal)

        }
        
        
        if(user.image.isEmpty){
            imgView.image = #imageLiteral(resourceName: "ic_no_image")
        }
        else {
            let url = URL(string: user.image)
            self.imgView.kf.setImage(with: url)
        }
        
        
        if(advert.isEmpty || advert == "null"){
            return
        }
        
        let json = JSON.init(parseJSON: advert)
        let text = json["a_text"].stringValue
        let type = json["a_type"].stringValue
        var image_board = json["a_image"].stringValue
        let checking_lat = json["a_cecking_lat"].stringValue
        let checking_lng = json["a_cecking_lng"].stringValue
        let checking_address = json["a_checking_address"].stringValue
        var text_position = json["text_loc"].stringValue
        let local = json["a_local"].boolValue ?? false
        
        self.labelBoard.text = text
        if(!image_board.isEmpty){
            if(local){
                let img = convertBase64ToImage(imageString: image_board)
                self.imgBoard.image = img
                self.imgBoard.isHidden = false
            }
            else {
                let img = "http://www.buzzwaretech.com/keepco/\(image_board)"
                let url = URL(string: img)
                self.imgBoard.kf.setImage(with: url)
                self.imgBoard.isHidden = false
            }
        }
        
        if(text_position == "top_left"){
            self.labelBoardTop.isHidden = false
            self.labelBoardTop.text = text
            self.labelBoardTop.textAlignment = .left
            
            self.labelBoard.isHidden = true
            self.labelBoardBottom.isHidden = true
        }
        else if(text_position == "top_center"){
            self.labelBoardTop.isHidden = false
            self.labelBoardTop.text = text
            self.labelBoardTop.textAlignment = .center
            
            self.labelBoard.isHidden = true
            self.labelBoardBottom.isHidden = true

        }
        else if(text_position == "top_right"){
            self.labelBoardTop.isHidden = false
            self.labelBoardTop.text = text
            self.labelBoardTop.textAlignment = .right
            
            self.labelBoard.isHidden = true
            self.labelBoardBottom.isHidden = true

        }
        else if(text_position == "bottom_left"){
            self.labelBoardBottom.isHidden = false
            self.labelBoardBottom.text = text
            self.labelBoardBottom.textAlignment = .left
            
            self.labelBoard.isHidden = true
            self.labelBoardTop.isHidden = true

        }
        else if(text_position == "bottom_center"){
            self.labelBoardBottom.isHidden = false
            self.labelBoardBottom.text = text
            self.labelBoardBottom.textAlignment = .center
            
            self.labelBoard.isHidden = true
            self.labelBoardTop.isHidden = true
        }
        else if(text_position == "bottom_right"){
            self.labelBoardBottom.isHidden = false
            self.labelBoardBottom.text = text
            self.labelBoardBottom.textAlignment = .right
            
            self.labelBoard.isHidden = true
            self.labelBoardTop.isHidden = true
        }
        else if(text_position == "center_left"){
            self.labelBoard.isHidden = false
            self.labelBoard.text = text
            self.labelBoard.textAlignment = .left
            
            self.labelBoardTop.isHidden = true
            self.labelBoardBottom.isHidden = true
        }
        else if(text_position == "center"){
            self.labelBoard.isHidden = false
            self.labelBoard.text = text
            self.labelBoard.textAlignment = .center
            
            self.labelBoardTop.isHidden = true
            self.labelBoardBottom.isHidden = true
            
        }
        else if(text_position == "center_right"){
            self.labelBoard.isHidden = false
            self.labelBoard.text = text
            self.labelBoard.textAlignment = .right
            
            self.labelBoardTop.isHidden = true
            self.labelBoardBottom.isHidden = true
        }
    }
    
    func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    func getAgeFromDOF(date: String) -> (Int,Int,Int) {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let dateOfBirth = dateFormater.date(from: date) ?? Date()
        
        let calender = Calendar.current
        
        let dateComponent = calender.dateComponents([.year, .month, .day], from:
            dateOfBirth, to: Date())
        
        return (dateComponent.year!, dateComponent.month!, dateComponent.day!)
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        performSegue(withIdentifier: "toEdit", sender: nil)
    }
    @IBAction func hobbiesPressed(_ sender: Any) {
        //        performSegue(withIdentifier: "toMyFun", sender: nil)
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        funController = storyboard.instantiateViewController(withIdentifier: "UserFunsViewController") as! UserFunsViewController
        addChild(funController)
        funController.answers = funAnswers
        funController.funs = user.fun
        funController.delegate = self
        funController.subFuns = user.sub_fun
        funController.view.frame = self.view.bounds
        self.view.addSubview(funController.view)
        funController.didMove(toParent: self)
        
        isProfileHidden = true
    }
    
    
    func goBack(){
        if(funController != nil){
            funController.willMove(toParent: nil)
            funController.view.removeFromSuperview()
            funController.removeFromParent()
            
            isProfileHidden = false
        }
        if(occupationController != nil){
            occupationController.willMove(toParent: nil)
            occupationController.view.removeFromSuperview()
            occupationController.removeFromParent()
            
            isProfileHidden = false
        }
        
        if(manageBoard != nil){
            manageBoard.willMove(toParent: nil)
            manageBoard.view.removeFromSuperview()
            manageBoard.removeFromParent()
            
            isProfileHidden = false
        }
    }
    
    @IBAction func occupationPressed(_ sender: Any) {
        //        performSegue(withIdentifier: "toMyOccupation", sender: nil)
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        occupationController = storyboard.instantiateViewController(withIdentifier: "UserOccupationViewController") as! UserOccupationViewController
        addChild(occupationController)
        occupationController.answers = occupationAnswers
        occupationController.occupations = user.occupation
        occupationController.subOccupations = user.sub_occupation
        occupationController.delegate = self
        occupationController.view.frame = self.view.bounds
        self.view.addSubview(occupationController.view)
        occupationController.didMove(toParent: self)
        
        isProfileHidden = true
    }
    
    @IBAction func manageBoardPressed(_ sender: Any) {
        //        performSegue(withIdentifier: "toManageBoard", sender: nil)
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        manageBoard = storyboard.instantiateViewController(withIdentifier: "ManageAdvertisingViewController") as! ManageAdvertisingViewController
        addChild(manageBoard)
        manageBoard.view.frame = self.view.bounds
        self.view.addSubview(manageBoard.view)
        manageBoard.didMove(toParent: self)
        
        isProfileHidden = true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//MARK:- Delegate
extension UserProfileViewController: UserFunsDelegate {
    func closeController() {
        goBackController()
    }
    
    func goBackController(){
        if(occupationController != nil){
            occupationController.willMove(toParent: nil)
            occupationController.view.removeFromSuperview()
            occupationController.removeFromParent()
        }
        if(funController != nil){
            funController.willMove(toParent: nil)
            funController.view.removeFromSuperview()
            funController.removeFromParent()
            
            
        }
    }
    
    
}

//
//  ProfileViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON

class ProfileViewController: UIViewController {

    @IBOutlet weak var viewTalk: UIView!
    @IBOutlet weak var viewMyMessages: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelHomeAddress: UILabel!
    @IBOutlet weak var labelWorkAddress: UILabel!
    @IBOutlet weak var labelViews: UILabel!
    @IBOutlet weak var labelBoard: UILabel!
    @IBOutlet weak var labelBoardTop: UILabel!
    @IBOutlet weak var labelBoardBottom: UILabel!
    @IBOutlet weak var imgBoard: UIImageView!
    @IBOutlet weak var viewViews: UIView!
    
    
    var isProfileHidden = false
    var funController: MyFunboardViewController!
    var occupationController: MyOccupationViewController!
    var inboxController: InboxViewController!
    var manageBoard: ManageAdvertisingViewController!
    var visitsController: ProfileVisitsViewController!
    static var isActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        viewTalk.layer.cornerRadius = 23
//        viewTalk.layer.borderColor = UIColor(hexString: "#343997").cgColor
//        viewTalk.layer.borderWidth = 1
        
        viewMyMessages.layer.cornerRadius = 23
        viewMyMessages.layer.borderColor = UIColor(hexString: "#343997").cgColor
        viewMyMessages.layer.borderWidth = 1
        
        imgBoard.layer.cornerRadius = 10
    
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
        imgView.layer.cornerRadius = imgView.frame.height/2
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(messagesTapped(tapGestureRecognizer:)))
        viewMyMessages.isUserInteractionEnabled = true
        viewMyMessages.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(viewsTapped(tapGestureRecognizer:)))
        viewViews.addGestureRecognizer(tap2)
    }
    
    @objc func messagesTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        inboxController = storyboard.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
        addChild(inboxController)
        inboxController.view.frame = self.view.bounds
        self.view.addSubview(inboxController.view)
        inboxController.didMove(toParent: self)
        
        isProfileHidden = true
        ProfileViewController.isActive = false

    }
    
    @objc func viewsTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if(labelViews.text == "0"){
            return
        }
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        visitsController = storyboard.instantiateViewController(withIdentifier: "ProfileVisitsViewController") as! ProfileVisitsViewController
        visitsController.delegate = self
        addChild(visitsController)
        visitsController.view.frame = self.view.bounds
        self.view.addSubview(visitsController.view)
        visitsController.didMove(toParent: self)
        
        isProfileHidden = true
        ProfileViewController.isActive = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDetails()
        ProfileViewController.isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ProfileViewController.isActive = false
    }
    
    
    func getDetails(){
        let defaults = UserDefaults.standard
        let username = defaults.string(forKey: Config.USER_NAME) ?? ""
        var dob = defaults.string(forKey: Config.DOB) ?? ""
        let gender = defaults.string(forKey: Config.GENDER) ?? ""
        let homeAddress = defaults.string(forKey: Config.HOME_ADDRESS) ?? ""
        let workAddress = defaults.string(forKey: Config.WORK_ADDRESS) ?? ""
        let noOfViews = defaults.string(forKey: Config.VIEWS) ?? "0"
        let image = defaults.string(forKey: Config.USER_IMAGE) ?? ""
        let advert = defaults.string(forKey: Config.ADVERTISEMENT) ?? ""
        
//        dob = dob.replacingOccurrences(of: ".", with: "-")
        
        labelName.text = username
        labelViews.text = noOfViews
        if(language == "en"){
            labelAge.text = "\(gender), \(getAgeFromDOF(date: dob).0)"
            labelHomeAddress.text = "Lives in \(homeAddress)"
            
            if(workAddress.isEmpty){
                labelWorkAddress.text = "-"
            }
            else {
                labelWorkAddress.text = "Working at \(workAddress)"
            }
        }
        else {
            labelAge.text = "\(getAgeFromDOF(date: dob).0) ,\(gender)"
            labelHomeAddress.text = "\(homeAddress) גר ב"
            
            if(workAddress.isEmpty){
                labelWorkAddress.text = "-"
            }
            else {
                labelWorkAddress.text = "\(workAddress) עובד ב"
            }
        }
        
        
        if(image.isEmpty){
            imgView.image = #imageLiteral(resourceName: "ic_no_image")
        }
        else {
            let url = URL(string: image)
            self.imgView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "ic_no_image"))
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
                let img = "http://www.buzzwaretech.com/keepco/\(image_board)?" + loginTime
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
        funController = storyboard.instantiateViewController(withIdentifier: "MyFunboardViewController") as! MyFunboardViewController
        addChild(funController)
        funController.view.frame = self.view.bounds
        self.view.addSubview(funController.view)
        funController.didMove(toParent: self)
        
        isProfileHidden = true
        ProfileViewController.isActive = false
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
        if(inboxController != nil){
            inboxController.willMove(toParent: nil)
            inboxController.view.removeFromSuperview()
            inboxController.removeFromParent()
            
            isProfileHidden = false
        }
        
        if(manageBoard != nil){
            manageBoard.willMove(toParent: nil)
            manageBoard.view.removeFromSuperview()
            manageBoard.removeFromParent()
            
            isProfileHidden = false
        }
        
        if(visitsController != nil){
            visitsController.willMove(toParent: nil)
            visitsController.view.removeFromSuperview()
            visitsController.removeFromParent()
            
            isProfileHidden = false
        }
    }
    
    @IBAction func occupationPressed(_ sender: Any) {
//        performSegue(withIdentifier: "toMyOccupation", sender: nil)
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        occupationController = storyboard.instantiateViewController(withIdentifier: "MyOccupationViewController") as! MyOccupationViewController
        addChild(occupationController)
        occupationController.view.frame = self.view.bounds
        self.view.addSubview(occupationController.view)
        occupationController.didMove(toParent: self)
        
        isProfileHidden = true
        ProfileViewController.isActive = false
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
        ProfileViewController.isActive = false
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
}


//MARK:- Delegate
extension ProfileViewController: UsersListDelegate {
    func closeController() {
        goBack()
    }
}

//
//  PhoneViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import Toast_Swift
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class PhoneViewController: UIViewController {
    @IBOutlet weak var view1Code: UIView!
    @IBOutlet weak var view2Code: UIView!
    @IBOutlet weak var view3Code: UIView!
    @IBOutlet weak var view4Code: UIView!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var labelCode: UILabel!
    @IBOutlet weak var txtSelectCode: FPNTextField!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    var isChecked = false
    var user: User!
    var image: Data!
    var occupations: String!
    var subOccupations: String!
    var funs = ""
    var subFuns = ""
    let REGISTER_URL = Config.BASE_URL + "appregister";
    let SEND_CODE = Config.BASE_URL + "verifyphonenumber";

    var isVerified = false
    var code: String!
    var counter = 30
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeViews()
    }
    
    func customizeViews(){
        
        txt1.delegate = self
        txt2.delegate = self
        txt3.delegate = self
        txt4.delegate = self
        
        
        btnFinish.layer.cornerRadius = 7
        btnFinish.layer.masksToBounds = true
        
        
        view1Code.layer.borderColor = UIColor(hexString: "#353A97").cgColor
        view1Code.layer.borderWidth = 1
        view1Code.layer.cornerRadius = 5
        
        view2Code.layer.borderColor = UIColor.black.cgColor
        view2Code.layer.borderWidth = 1
        view2Code.layer.cornerRadius = 10
        
        view3Code.layer.borderColor = UIColor.black.cgColor
        view3Code.layer.borderWidth = 1
        view3Code.layer.cornerRadius = 10
        
        view4Code.layer.borderColor = UIColor.black.cgColor
        view4Code.layer.borderWidth = 1
        view4Code.layer.cornerRadius = 10
        
        
        if(language == "en"){
            self.txtPhone.placeholder = "Phone number"
        }
        else {
            self.txtPhone.placeholder = "מספר טלפון"
        }
        
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap3)
        
        txt1.tag = 1
        txt2.tag = 2
        txt3.tag = 3
        txt4.tag = 4
        txt1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txt2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txt3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txt4.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        let tag = textField.tag
        if(tag == 1 && !text.isEmpty){
            txt2.becomeFirstResponder()
        }
        else if(tag == 2 && !text.isEmpty){
            txt3.becomeFirstResponder()
        }
        else if(tag == 3 && !text.isEmpty){
            txt4.becomeFirstResponder()
        }
    }
    
    
    @objc func contactTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
      
    
    @objc func termsTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        goToTerms()
    }
    
    
    @objc func privacyTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        goToPrivacy()
    }
    
    
    func goToTerms(){
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func goToPrivacy(){
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
        newViewController.modalPresentationStyle = .fullScreen
        
        self.present(newViewController, animated: true, completion: nil)
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didnotPressed(_ sender: Any) {
    }
    @IBAction func zipPressed(_ sender: Any) {
        
        print(txtPhone.text)

        var phone = txtPhone.text ?? ""

        if(phone.isEmpty){
            self.view.makeToast("Please enter phone number")
            return
        }
        phone = phone.replacingOccurrences(of: "-", with: "")
        
        
        if(counter == 30){
            startTimer()
            sendCode(phone: phone)
        }
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end")
            counter -= 1
        }
        else if counter == 0 {
            timer.invalidate()
            counter = 30
        }
    }
    
    
    @IBAction func finishPressed(_ sender: Any) {
        let phone = txtPhone.text ?? ""
        
      if(phone.isEmpty){
            self.view.makeToast("Please enter phone number")
            return
        }
        else if(!isVerified){
            let a = txt1.text ?? ""
            let b = txt2.text ?? ""
            let c = txt3.text ?? ""
            let d = txt4.text ?? ""
            
            if(a.isEmpty || b.isEmpty || c.isEmpty || d.isEmpty){
                self.view.makeToast("Please Verify the OTP")
                return
            }
            
            
            let entered_code = a+b+c+d
            print("Entered Code \(entered_code)")
            if(entered_code == self.code){
                self.isVerified = true
            }
            else {
                self.view.makeToast("Wrong code")
                return
                isVerified = false
            }
                 
        }
        
        if (image != nil){
            registerWithImage(email: "", phone: phone)
        }
        else {
            register(email: "", phone: phone)
        }
        
    }
    
    func sendCode(phone: String){
           let parameters: [String: Any] = ["phone_number": phone ?? ""]
             
           print(parameters)
           
            AF.request(SEND_CODE, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                 .responseJSON { response in
                     debugPrint(response)
                     switch response.result {
                     case .success(let data):
                         let json = JSON(data)
                         print(json)
                         let success = json["success"].stringValue
                         
                         if success == "1" {
                            self.code = json["code"].stringValue
                            self.view.makeToast("Code Sent")
                            
                            self.txt1.becomeFirstResponder()
                         }
                         else {
                             self.view.makeToast("Failed to send code. Please try again")
                         }
                         
                         break
                         
                     case .failure(let error):
                         print(error)
                         self.view.makeToast("Server not responding. Please try again")
                         
                     }
             }
             
         }
    
    func registerWithImage(email: String, phone: String){
        self.indicator.startAnimating()
        
        let parameters: [String: String] = ["user_name": user.username ?? "",
                                  "user_email": email ?? "",
                                  "phone_number": phone ?? "",
                                  "user_password": user.password ?? "",
                                  "dob": user.dob ?? "",
                                  "gender": user.gender ?? "",
                                  "address": user.home_address ?? "",
                                  "latitude": user.home_lat ?? "",
                                  "logitude": user.home_lng ?? "",
                                  "work_address": user.work_address ?? "",
                                  "work_lat": user.work_lat ?? "",
                                  "work_lng": user.work_lng ?? "",
                                  "occupation_id": occupations ?? "",
                                  "suboccupation_id": subOccupations ?? "",
                                  "fun_id": funs ?? "",
                                  "subfun_id": subFuns ?? ""]
        
        print(parameters)
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(self.image, withName: "image", fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in parameters {
                multipartFormData.append((value.data(using: String.Encoding.utf8)!), withName: key)
            }
        }, to: REGISTER_URL)
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        let returnData = json["return_data"]
                        if(returnData.exists()){
                            _ = returnData["user_email"].stringValue
                            if(language == "en"){
                                self.view.makeToast("This email is already registered with us, please use another email")
                            }
                            else {
                                var style = ToastStyle()
                                style.messageAlignment = .right
                                var text = "דוא\"ל זה כבר רשום אצלנו, אנא השתמש בדוא\"ל אחר"
                                self.view.makeToast(text, duration: 3.0, position: .bottom, style: style)
                            }
                            self.indicator.stopAnimating()
                            return
                        }
                        
                        let object = json["user_detail"]
                        let user_id = object["user_id"].stringValue
                        let image = object["Image"].stringValue
                        self.user.id = user_id
                        self.user.image = image
                        self.savePreferences()

                    }
                    else {
                        self.view.makeToast("Failed to register. Please try again")
                    }
                    
                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                    self.view.makeToast("Server not responding. Please try again")
                    
                }
        }
        
    }
    
    func register(email: String, phone: String){
          self.indicator.startAnimating()
          
        let parameters: [String: Any] = ["user_name": user.username ?? "",
                            "user_email": email ?? "",
                            "phone_number": phone ?? "",
                            "user_password": user.password ?? "",
                            "dob": user.dob ?? "",
                            "gender": user.gender ?? "",
                            "address": user.home_address ?? "",
                            "latitude": user.home_lat ?? "",
                            "logitude": user.home_lng ?? "",
                            "work_address": user.work_address ?? "",
                            "work_lat": user.work_lat ?? "",
                            "work_lng": user.work_lng ?? "",
                            "occupation_id": occupations ?? "",
                            "suboccupation_id": subOccupations ?? "",
                            "fun_id": funs ?? "",
                            "subfun_id": subFuns ?? ""]
          
        print(parameters)

        
         AF.request(REGISTER_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
              .responseJSON { response in
                  debugPrint(response)
                  switch response.result {
                  case .success(let data):
                      let json = JSON(data)
                      print(json)
                      let success = json["sucess"].int
                      
                      if success == 1 {
                        let returnData = json["return_data"]
                        if(returnData.exists()){
//                            let msg = returnData["user_email"].stringValue
                            if(language == "en"){
                                self.view.makeToast("This email is already registered with us, please use another email")
                            }
                            else {
                                var style = ToastStyle()
                                style.messageAlignment = .right
                                var text = "דוא\"ל זה כבר רשום אצלנו, אנא השתמש בדוא\"ל אחר"
                                self.view.makeToast(text, duration: 3.0, position: .bottom, style: style)
                            }
                            self.indicator.stopAnimating()
                            return
                        }
                        
                        
                          let object = json["user_detail"]
                          let user_id = object["user_id"].stringValue
                          self.user.id = user_id
                          self.user.image = ""
                          self.savePreferences()

                      }
                      else {
                          self.view.makeToast("Failed to register. Please try again")
                      }
                      
                      self.indicator.stopAnimating()
                      break
                      
                  case .failure(let error):
                      print(error)
                      self.indicator.stopAnimating()
                      self.view.makeToast("Server not responding. Please try again")
                      
                  }
          }
          
      }
    
    func savePreferences(){
           let defaults = UserDefaults.standard
           
           defaults.set(user.id, forKey: Config.USER_ID)
           
           defaults.set(user.username, forKey: Config.USER_NAME)
           defaults.set(user.password, forKey: Config.USER_PASS)
           defaults.set(user.email, forKey: Config.USER_EMAIL)
           defaults.set(user.phone, forKey: Config.USER_PHONE)
           defaults.set(user.dob, forKey: Config.DOB)
           defaults.set(user.gender, forKey: Config.GENDER)
           defaults.set(user.home_address, forKey: Config.HOME_ADDRESS)
           defaults.set(user.home_lat, forKey: Config.HOME_LAT)
           defaults.set(user.home_lng, forKey: Config.HOME_LNG)
           defaults.set(user.work_address, forKey: Config.WORK_ADDRESS)
           defaults.set(user.work_lat, forKey: Config.WORK_LAT)
           defaults.set(user.work_lng, forKey: Config.WORK_LNG)
           defaults.set(user.image, forKey: Config.USER_IMAGE)
           defaults.set("0", forKey: Config.VIEWS)
           defaults.set(occupations, forKey: Config.OCCUPATIONS)
           defaults.set(subOccupations, forKey: Config.SUB_OCCUPATIONS)
           defaults.set(funs, forKey: Config.FUNS)
           defaults.set(subFuns, forKey: Config.SUB_FUNS)
           defaults.set(true, forKey: Config.IS_REG_COMPLETED)
           defaults.set(true, forKey: Config.IS_LOGGED_IN)
           
           defaults.set("", forKey: "funAnswers")
           defaults.set("", forKey: "occupationAnswers")
           
           defaults.synchronize()
           
           
        performSegue(withIdentifier: "toHome", sender: nil)

    }
    
    @IBAction func termsPressed(_ sender: Any) {
        //btnCheck.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
        isChecked = true
    }
    
}



//MARK:- Extension TapGesture
extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                              //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
                                                        // locationOfTouchInLabel.y - textContainerOffset.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }

}


//MARK:- Textfield
extension PhoneViewController: UITextFieldDelegate {
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 1
    }
}

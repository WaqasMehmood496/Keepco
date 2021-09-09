//
//  LoginViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON
import Toast_Swift


var loginTime: String = ""

class LoginViewController: UIViewController {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewSignup: UIView!
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var btnSigup: UIButton!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewEmail: UIView!
    let LOGIN_URL = Config.BASE_URL + "app_login"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTime = String(self.getCurrentMillis())
        
        customizeViews()
        
        
    }
    
    func customizeViews(){
        
        btnLogin.layer.cornerRadius = 7
        btnLogin.layer.masksToBounds = true
        
        viewEmail.layer.cornerRadius = 7
        viewPassword.layer.cornerRadius = 7
        
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.signupTapped(_:)))
        viewSignup.addGestureRecognizer(tap3)
        
        let text = "Don't have an account? Sign up"
        
        btnSigup.setTitle(text, for: .normal)
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Sign up")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#093EC5"), range: range1)
        btnSigup.setAttributedTitle(underlineAttriString, for: .normal)
    }
    
    
    @objc func signupTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func termsTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @objc func privacyTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
        newViewController.modalPresentationStyle = .fullScreen
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        let email = txtLogin.text ?? ""
        let password = txtPassword.text ?? ""
        
        
        if(email.isEmpty){
            self.view.makeToast("Username cannot be empty")
            return
        }
        else if(password.isEmpty){
            self.view.makeToast("Password cannot be empty")
            return
        }
        
        login(email: email, password: password)
        
    }
    @IBAction func forgotPressed(_ sender: Any) {
        performSegue(withIdentifier: "toForgot", sender: nil)
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRegistration", sender: nil)
    }
    
    
    
    //APIs
    
    func login(email: String, password: String){
           self.indicator.startAnimating()
        let parameters = ["user_name": email, "user_password": password]
                    
           AF.request(LOGIN_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
               .responseJSON { response in
                   switch response.result {
                   case .success(let data):
                       let json = JSON(data)
                       print(json)
                       let success = json["sucess"].int
                       
                       if success == 1 {
                        
                        let msg = json["msg"]
                        
                        if(msg == "Invalid User"){
                            if(language == "en"){
                               self.view.makeToast("Invalid User")
                            }
                            else {
                                self.view.makeToast("משתמש שגוי")
                            }
                            self.indicator.stopAnimating()
                            return
                        }
                        
                        let object = json["user_detail"]
                        let user = User(id: object["user_id"].stringValue, email: object["user_email"].stringValue, username: object["user_name"].stringValue, password: password, image: object["Image"].stringValue, gender: object["gender"].stringValue, phone: object["phone_number"].stringValue, dob: object["dob"].stringValue, home_address: object["address"].stringValue, work_address: object["work_address"].stringValue, home_lat: object["latitude"].stringValue, home_lng: object["logitude"].stringValue, work_lat: object["work_lat"].stringValue, work_lng: object["work_lng"].stringValue, occupation: object["occupation_id"].stringValue, sub_occupation: object["suboccupation_id"].stringValue, fun: object["fun_id"].stringValue, sub_fun: object["subfun_id"].stringValue, distance: "", no_of_views: object["no_of_view"].stringValue)
                        
                        let answersArray = json["youranswers"].arrayValue
                        
                        let occupationsText = json["occupation_text"].arrayValue
                        
                        
                        let advert = json["advertisment_banner"]
                        
                        self.savePreferences(user: user, funs: "\(answersArray)", occupations: "\(occupationsText)", advert: "\(advert)")
                       }
                       else {
                        if(language == "en"){
                           self.view.makeToast("The number is not registered")
                        }
                        else {
                            self.view.makeToast("אימייל או סיסמא שגויים")
                        }
                       }
                       
                       self.indicator.stopAnimating()
                       break
                       
                   case .failure(let error):
                       print(error)
                       self.indicator.stopAnimating()
                   }
           }
       }
    
    
    func savePreferences(user: User, funs: String, occupations: String, advert: String){
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
        if(user.image.isEmpty){
            defaults.set(user.image, forKey: Config.USER_IMAGE)
        }
        else {
            defaults.set(user.image + "?" + String(self.getCurrentMillis()), forKey: Config.USER_IMAGE)
        }
        defaults.set(user.no_of_views, forKey: Config.VIEWS)
        defaults.set(user.occupation, forKey: Config.OCCUPATIONS)
        defaults.set(user.sub_occupation, forKey: Config.SUB_OCCUPATIONS)
        defaults.set(user.fun, forKey: Config.FUNS)
        defaults.set(user.sub_fun, forKey: Config.SUB_FUNS)
        defaults.set(true, forKey: Config.IS_REG_COMPLETED)
        defaults.set(true, forKey: Config.IS_LOGGED_IN)
        defaults.setValue(advert, forKey: Config.ADVERTISEMENT)
        
        defaults.set(funs, forKey: "funAnswers")
        defaults.set(occupations, forKey: "occupationAnswers")
        
        defaults.synchronize()
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
//        newViewController.modalPresentationStyle = .fullScreen
//
//        self.present(newViewController, animated: true, completion: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let story = UIStoryboard(name: storyboard_name, bundle: nil)
        let initialViewController = story.instantiateViewController(withIdentifier: "TabBarViewController")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()

    }
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
}

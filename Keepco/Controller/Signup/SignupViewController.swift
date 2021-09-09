//
//  SignupViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON
import Toast_Swift

class SignupViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    let SIGNUP_URL = Config.BASE_URL + "firststepforregister";
    var user = User()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSignup.layer.cornerRadius = 27.5
        btnSignup.layer.masksToBounds = true
        
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap3)
        
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
    
    @IBAction func signupPressed(_ sender: Any) {
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        
        
        if(email.isEmpty){
            self.view.makeToast("Please enter email")
            return
        }
        else if(password.isEmpty){
            self.view.makeToast("Please enter password")
            return
        }
        else if(email.count < 4){
            self.view.makeToast("Username length must be at least 4 characters")
            return
        }
        else if(password.count < 8){
            self.view.makeToast("Password length must be at least 8 characters")
            return
        }
        
        
        login(email: email, password: password)
                
    }
    
    func login(email: String, password: String){
        self.indicator.startAnimating()
        let parameters = ["user_name": email, "user_password": password]
        
        AF.request(SIGNUP_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["success"].int
                    
                    if success == 1 {
                        self.user = User()
                        self.user.username = email
                        self.user.password = password
                        self.savePreferences()
                    }
                    else if(success == -1){
                        if(language == "en"){
                            self.view.makeToast("This username is already taken. Please use another username")
                        }
                        else {
                            var style = ToastStyle()
                            style.messageAlignment = .right
                            var text = "שם המשתמש הזה כבר תפוס. אנא השתמש בשם משתמש אחר"
//                            self.view.makeToast("שם המשתמש הזה כבר תפוס. אנא השתמש בשם משתמש אחר")
                            self.view.makeToast(text, duration: 3.0, position: .bottom, style: style)
                            
                        }
                    }
                    else {
                        let msg = json["msg"].stringValue
                        self.view.makeToast(msg)
                    }
                    
                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                }
        }
    }

    func savePreferences(){
        let defaults = UserDefaults.standard
        
        defaults.set(user.username, forKey: Config.USER_NAME)
        defaults.set(user.password, forKey: Config.USER_PASS)
        defaults.synchronize()
        
        
        self.performSegue(withIdentifier: "toRegistration", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toRegistration"){
            let controller = segue.destination as! RegistrationViewController
            controller.user = user
        }
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
    @IBAction func forgotPressed(_ sender: Any) {
        performSegue(withIdentifier: "toForgot", sender: nil)
    }
}

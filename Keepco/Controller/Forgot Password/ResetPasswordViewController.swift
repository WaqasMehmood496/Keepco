//
//  ResetPasswordViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/2/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class ResetPasswordViewController: UIViewController {
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtNewPass: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    var user_id: String!
    var code: String!
    let RESET_PASSWORD = Config.BASE_URL + "update_resetpwd/"
    var count = 0
    var delegate: PasswordChanged!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnReset.layer.cornerRadius = 27.5
        btnReset.layer.masksToBounds = true
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func resetPressed(_ sender: Any) {
        let code = txtCode.text ?? ""
        let password = txtNewPass.text ?? ""
        let confirmPass = txtConfirmPass.text ?? ""
        
        if(code.isEmpty){
            return
        }
        
        if(code != self.code){
            if(language == "en"){
                self.view.makeToast("Wrong password")
            }
            else {
                self.view.makeToast("סיסמה שגויה")
            }
            count += 1
            
            if(count > 3){
                self.dismiss(animated: true, completion: nil)
            }
            
            return
        }
        else if(password.isEmpty || confirmPass.isEmpty){
            if(language == "end"){
                self.view.makeToast("Please enter password")
            }
            else {
                self.view.makeToast("אנא הכנס סיסמה")
            }
            return
        }
        else if(password != confirmPass){
            if(language == "en"){
                self.view.makeToast("Passwords don't match")
            }
            else {
                self.view.makeToast("סיסמאות אינן תואמות")
            }
        }
        else if(password.count < 8){
            if(language == "en"){
                self.view.makeToast("Password length must be at least 8 characters")
            }
            else {
                self.view.makeToast("אורך הסיסמה חייב להיות לפחות 8 תווים")
            }
            return
        }
        
        resetPassword(password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
    }
    
    func resetPassword(password: String){
          self.indicator.startAnimating()
          
        let parameters: [String: Any] = ["user_password": password ?? ""]
          
        print(parameters)
        
         AF.request(RESET_PASSWORD + user_id, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
              .responseJSON { response in
                  debugPrint(response)
                  switch response.result {
                  case .success(let data):
                      let json = JSON(data)
                      print(json)
                      let success = json["sucess"].int
                      
                      if success == 1 {
                        if(language == "en"){
                            self.view.makeToast("Your password has been updated")
                        }
                        else {
                            self.view.makeToast("הסיסמא שלך עודכנה")
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                            self.dismiss(animated: true) {
                                self.delegate.passwordReset(check: true)
                            }
                        })
                      }
                      else {
                        if(language == "en"){
                            self.view.makeToast("Failed to update password")
                        }
                        else {
                            self.view.makeToast("עדכון הסיסמה נכשל")
                        }
                      }
                      
                      self.indicator.stopAnimating()
                      break
                      
                  case .failure(let error):
                      print(error)
                      self.indicator.stopAnimating()
                    if(language == "en"){
                      self.view.makeToast("Server not responding. Please try again")
                    }else {
                        self.view.makeToast("השרת לא מגיב. בבקשה נסה שוב")
                    }
                      
                  }
          }
          
      }

}

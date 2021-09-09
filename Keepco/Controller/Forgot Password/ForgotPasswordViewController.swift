//
//  ForgotPasswordViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/2/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    var option = "phone"
    var user_id: String!
    var code: String!
    let SEND_CODE = Config.BASE_URL  + "passwordresrt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSend.layer.cornerRadius = 7
        btnSend.layer.masksToBounds = true
        viewEmail.layer.cornerRadius = 7
        
        
    }
    
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        let email = txtEmail.text ?? ""
        if(email.isEmpty){
            if(language == "en"){
                self.view.makeToast("Please enter email")
            }
            else {
                self.view.makeToast("אנא הזן כתובת דואל")
            }
            return
        }
        
        sendCode(email: email)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toReset"){
            let controller = segue.destination as! ResetPasswordViewController
            controller.user_id = self.user_id
            controller.code = self.code
            controller.delegate = self
        }
    }
    
    
    func sendCode(email: String){
          self.indicator.startAnimating()
          
        let parameters: [String: Any] = ["user_email": email ?? "", "type": option ?? ""]
          
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
                        self.user_id = json["user_id"].stringValue
                        
                        self.performSegue(withIdentifier: "toReset", sender: nil)
                        
                      }
                      else {
                        if(language == "en"){
                            self.view.makeToast("Wrong email")
                        }
                        else {
                            self.view.makeToast("אימייל שגוי")
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

extension ForgotPasswordViewController: PasswordChanged {
    func passwordReset(check: Bool) {
        self.dismiss(animated: false, completion: nil)
    }
}

protocol PasswordChanged {
    func passwordReset(check: Bool)
}

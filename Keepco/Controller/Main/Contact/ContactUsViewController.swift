//
//  ContactUsViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 6/14/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class ContactUsViewController: UIViewController {

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewSend: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var txtMessage: KMPlaceholderTextView!
    let CONTACT_URL = Config.BASE_URL + "contact_us";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSend.layer.cornerRadius = viewSend.frame.height/2
        viewBottom.layer.cornerRadius = 5
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        txtUsername.delegate = self
        txtSubject.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        topConstraint.constant = -300
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
      topConstraint.constant = -20
        self.view.layoutIfNeeded()
    }
    

    @IBAction func closePressed(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        let user = txtUsername.text ?? ""
        let sub = txtSubject.text ?? ""
        let msg = txtMessage.text ?? ""
        
        if user.isEmpty || sub.isEmpty || msg.isEmpty {
            if(language == "en"){
                self.view.makeToast("Please fill all the fields")
            } else {
                self.view.makeToast("אנא מלא את כל השדות")
            }
            return
        }
        
        sendDetails(username: user, subject: sub, msg: msg)
    }
    
    
    //REST API
    func sendDetails(username: String, subject: String, msg: String){
        
        let parameters: [String: String] = [
            "subject": subject ?? "",
            "username": username ?? "",
            "message": msg ?? ""
        ]
        
        AF.request(CONTACT_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        if language == "en" {
                            self.view.makeToast("Your message has been sent")
                        }
                        else {
                            self.view.makeToast("הודעתך נשלחה")
                        }
                        
                        self.txtMessage.text = ""
                        self.txtUsername.text = ""
                        self.txtSubject.text = ""
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to send message. Please try again")
                        }
                        else {
                            self.view.makeToast("שליחת ההודעה נכשלה. בבקשה נסה שוב")
                        }
                    }
                    
                    
                    break
                    
                case .failure(let error):
                    print(error)
                    if(language == "en"){
                        self.view.makeToast("Server not responding. Please try again")
                    }
                    else {
                        self.view.makeToast("השרת לא מגיב. בבקשה נסה שוב")
                    }
                }
        }
    }
    
    
}


//MARK:- TextView and TextField
extension ContactUsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsername {
            txtSubject.becomeFirstResponder()
        }
        else if textField == txtSubject {
            txtMessage.becomeFirstResponder()
        }
        return false
    }
}

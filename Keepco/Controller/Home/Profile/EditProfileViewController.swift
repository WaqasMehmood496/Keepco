//
//  EditProfileViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/14/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import GooglePlaces
import NVActivityIndicatorView
import Kingfisher
import Alamofire
import SwiftyJSON

class EditProfileViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var viewDob: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var viewWorkAddress: UIView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtWorkAddress: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var viewLogOff: UIView!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContact: UIView!
    @IBOutlet weak var btnUpdateImage: UIButton!
    @IBOutlet weak var indicatorImage: NVActivityIndicatorView!
    
    let REGISTER_URL = Config.BASE_URL + "edit_profile";
    
    var selected = 0
    var user_id: String!
    var user_name: String!
    var user_image: String!
    var home_address: String!
    var homeLat: String!
    var homeLng: String!
    var work_address: String!
    var workLat: String!
    var workLng: String!
    var gender: String!
    var dob: String!
    var email: String!
    var password: String!
    var imagePicker = UIImagePickerController()
    var image: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        
        self.btnUpdateImage.tag = 0
        
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dobTapped(_:)))
        viewDob.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.addressTapped(_:)))
        viewAddress.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.workAddressTapped(_:)))
        viewWorkAddress.addGestureRecognizer(tap2)
        
        btnSave.layer.cornerRadius = 27.5
        btnSave.layer.masksToBounds = true
        btnSave.layer.borderColor = UIColor(hexString: "#343997").cgColor
        btnSave.layer.borderWidth = 1
        
    }
    
    func getDetails(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
        user_name = UserDefaults.standard.string(forKey: Config.USER_NAME) ?? ""
        user_image = UserDefaults.standard.string(forKey: Config.USER_IMAGE) ?? ""
        home_address = UserDefaults.standard.string(forKey: Config.HOME_ADDRESS) ?? ""
        homeLat = UserDefaults.standard.string(forKey: Config.HOME_LAT) ?? ""
        homeLng = UserDefaults.standard.string(forKey: Config.HOME_LNG) ?? ""
        work_address = UserDefaults.standard.string(forKey: Config.WORK_ADDRESS) ?? ""
        workLat = UserDefaults.standard.string(forKey: Config.WORK_LAT) ?? "0"
        workLng = UserDefaults.standard.string(forKey: Config.WORK_LNG) ?? "0"
        gender = UserDefaults.standard.string(forKey: Config.GENDER) ?? ""
        dob = UserDefaults.standard.string(forKey: Config.DOB) ?? ""
        email = UserDefaults.standard.string(forKey: Config.USER_EMAIL) ?? ""
        password = UserDefaults.standard.string(forKey: Config.USER_PASS) ?? ""
        
        txtAddress.text = home_address
        txtWorkAddress.text = work_address
        txtDob.text = dob
        txtEmail.text = email
        txtUsername.text = user_name
        txtPassword.text = password
        
        if(gender == "Male"){
            btnMale.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
            btnFemale.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        }
        else {
            btnFemale.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
            btnMale.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        }
        
        
        if(user_image.isEmpty){
            imgProfile.image = #imageLiteral(resourceName: "ic_no_image")
        }
        else {
            let url = URL(string: user_image)
            self.imgProfile.kf.setImage(with: url)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 100)
    }

    
    @objc func workAddressTapped(_ sender: UITapGestureRecognizer? = nil) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Specify the place data types to return.
          let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                 UInt(GMSPlaceField.placeID.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))!
        autocompleteController.placeFields = fields
        
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        
        selected = 1
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @objc func addressTapped(_ sender: UITapGestureRecognizer? = nil) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
            UInt(GMSPlaceField.placeID.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))!
        autocompleteController.placeFields = fields
        
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        selected = 0
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
    }
    
    
    @objc func dobTapped(_ sender: UITapGestureRecognizer? = nil) {
        viewTop.animHide()
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "SelectDateViewController") as! SelectDateViewController
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        myAlert.delegate = self
        self.present(myAlert, animated: true, completion: nil)
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
    @IBAction func updateImagePressed(_ sender: Any) {
        
        var tag = btnUpdateImage.tag
        
        
        if(tag == 1){
            registerWithImage()
        }
        else {
        
            var choose = "Choose your action:"
            var media = "Open media library"
            var camera = "Open camera"
            var cancel = "Cancel"
            
            if(language == "he"){
                choose = "בחר בפעולה שלך"
                media = "ספריית מדיה פתוחה"
                camera = "מצלמה פתוחה"
                cancel = "לבטל"
            }
            
            
            let alert = UIAlertController(title: choose, message: "", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: media, style: .default, handler: { action in
                if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    print("Button capture")
                    
                    self.imagePicker.delegate = self
                    self.imagePicker.sourceType = .savedPhotosAlbum
                    self.imagePicker.allowsEditing = false
                    
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
            }))
            
            alert.addAction(UIAlertAction(title: camera, style: .default, handler: { action in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    print("Button camera")
                    
                    self.imagePicker.delegate = self
                    self.imagePicker.sourceType = .camera
                    self.imagePicker.allowsEditing = false
                    
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
            }))
            alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func savePressed(_ sender: Any){
        email = txtEmail.text ?? ""
        password = txtPassword.text ?? ""
        dob = txtDob.text ?? ""
        home_address = txtAddress.text ?? ""
        user_name = txtUsername.text ?? ""
        
        work_address = txtWorkAddress.text ?? ""
        
        
        if(email.isEmpty){
            if(language == "en"){
                self.view.makeToast("Please enter email")
            }
            else {
                self.view.makeToast("אנא הכנס דוא\"ל")
            }
            return
        }
        else if(password.isEmpty){
            if(language == "en"){
                self.view.makeToast("Please enter password")
            }
            else {
                self.view.makeToast("אנא הכנס סיסמה")
            }
            return
        }
        else if(home_address.isEmpty){
            if(language == "en"){
                self.view.makeToast("Please enter home address")
            }
            else {
                self.view.makeToast("אנא הכנס את כתובת הבית")
            }
            return
        }
        else if(user_name.isEmpty){
            if(language == "en"){
                self.view.makeToast("Please enter username")
            }
            else {
                self.view.makeToast("אנא הזן את שם המשתמש")
            }
            return
        }
        
        register()
//        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI(check: Bool){
        if(check) {
            btnUpdateImage.setTitle("", for: .normal)
            self.indicatorImage.startAnimating()
        }
        else {
            if(language == "en"){
                btnUpdateImage.setTitle("Update Image", for: .normal)
            }
            else {
                btnUpdateImage.setTitle("עדכן תמונה", for: .normal)
            }
            self.indicatorImage.stopAnimating()
            self.btnUpdateImage.tag = 0
        }
    }
    
    func registerWithImage(){
        self.updateUI(check: true)
        
        let parameters: [String: String] = ["user_id": user_id ?? ""]
        
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
                    self.updateUI(check: false)
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        if(language == "en"){
                            self.view.makeToast("Profile photo updated")
                        }
                        else {
                            self.view.makeToast("תמונת הפרופיל עודכנה")
                            
                        }
                        self.saveImage()
                        
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to register. Please try again")
                        }
                        else {
                            self.view.makeToast("ההרשמה נכשלה. בבקשה נסה שוב")
                        }
                    }
                    
                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                    self.updateUI(check: false)
                    if(language == "en"){
                        self.view.makeToast("Server not responding. Please try again")
                    }
                    else {
                        self.view.makeToast("השרת לא מגיב. בבקשה נסה שוב")
                    }
                    
                }
        }
        
    }
       
    func register(){
        self.indicator.startAnimating()
        
        let parameters: [String: Any] = ["user_name": user_name ?? "",
                                         "user_email": email ?? "",
                                         "user_password": password ?? "",
                                         "dob": dob ?? "",
                                         "gender": gender ?? "",
                                         "address": home_address ?? "",
                                         "latitude": homeLat ?? "",
                                         "logitude": homeLng ?? "",
                                         "work_address": work_address ?? "",
                                         "work_lat": workLat ?? "",
                                         "work_lng": workLng ?? "",
                                         "user_id": user_id ?? ""]
        
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
                        if(language == "en"){
                            self.view.makeToast("Profile Updated")
                        }
                        else {
                            self.view.makeToast("הפרופיל עודכן")
                        }
                        self.savePreferences()
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to update profile. Please try again")
                        }
                        else {
                            self.view.makeToast("עדכון הפרופיל נכשל. בבקשה נסה שוב")
                        }
                    }
                    
                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                    if(language == "en"){
                        self.view.makeToast("Server not responding. Please try again")
                    }
                    else {
                        self.view.makeToast("השרת לא מגיב. בבקשה נסה שוב")
                    }
                    
                }
        }
        
    }
       
    func savePreferences(){
        let defaults = UserDefaults.standard
        
        defaults.set(user_name, forKey: Config.USER_NAME)
        defaults.set(password, forKey: Config.USER_PASS)
        defaults.set(email, forKey: Config.USER_EMAIL)
        defaults.set(dob, forKey: Config.DOB)
        defaults.set(gender, forKey: Config.GENDER)
        defaults.set(home_address, forKey: Config.HOME_ADDRESS)
        defaults.set(homeLat, forKey: Config.HOME_LAT)
        defaults.set(homeLng, forKey: Config.HOME_LNG)
        defaults.set(work_address, forKey: Config.WORK_ADDRESS)
        defaults.set(workLat, forKey: Config.WORK_LAT)
        defaults.set(workLng, forKey: Config.WORK_LNG)
        defaults.set(user_image, forKey: Config.USER_IMAGE)
        
        defaults.synchronize()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveImage(){
           let defaults = UserDefaults.standard
           defaults.set(user_image + "?" + String(self.getCurrentMillis()), forKey: Config.USER_IMAGE)
           defaults.synchronize()
    }
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
       
}


//MARK:- DATE SELECTED

extension EditProfileViewController: isDateSelected {
    
    func date_select(date: String) {
        txtDob.text = date
    }
}



//MARK:- GOOGLEPLACESCONTROLLER

extension EditProfileViewController: GMSAutocompleteViewControllerDelegate {
    
    
    // Handle the user's selection.
     func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place ID: \(place.placeID)")
        print("Place attributions: \(place.attributions)")
        print("Place Phone: \(place.phoneNumber)")
        
        
        
        if selected == 0 {
            txtAddress.text = place.name!
//            saveAddress(type: "home", address: place.name!)
            homeLat = "\(place.coordinate.latitude)"
            homeLng = "\(place.coordinate.longitude)"
        }
        else {
            txtWorkAddress.text = place.name!
//            saveAddress(type: "work", address: place.name!)
            workLat = "\(place.coordinate.latitude)"
            workLng = "\(place.coordinate.longitude)"
        }
        dismiss(animated: true, completion: nil)
     }

     func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
       // TODO: handle the error.
       print("Error: ", error.localizedDescription)
     }

     // User canceled the operation.
     func wasCancelled(_ viewController: GMSAutocompleteViewController) {
       dismiss(animated: true, completion: nil)
     }

     // Turn the network activity indicator on and off again.
     func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//       UIApplication.shared.isNetworkActivityIndicatorVisible = true
     }

     func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//       UIApplication.shared.isNetworkActivityIndicatorVisible = false
     }
    
    func saveAddress(type: String, address: String){
        if (type == "work"){
            UserDefaults.standard.set(address, forKey: Config.WORK_ADDRESS)
        }
        else {
            UserDefaults.standard.set(address, forKey: Config.HOME_ADDRESS)
        }
        UserDefaults.standard.synchronize()
    }
}



//MARK:- IMAGEPICKER

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
//        imageView.image = image
        self.image = image.pngData()
        imgProfile.image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        image = selectedImage.pngData()
        imgProfile.image = selectedImage
        
        self.btnUpdateImage.tag = 1
        
        if(language == "en"){
            self.btnUpdateImage.setTitle("Save Image", for: .normal)
        }
        else {
            self.btnUpdateImage.setTitle("שמור תמונה", for: .normal)
        }
//        imageTake.image = selectedImage
    }
}


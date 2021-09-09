//
//  RegistrationViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import GooglePlaces
import Toast_Swift

class RegistrationViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewWorkAddress: UIView!
    @IBOutlet weak var txtWorkAddress: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var viewDob: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var viewSignup: UIView!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var txtDay: UITextField!
    @IBOutlet weak var txtMonth: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var viewDay: UITextField!
    @IBOutlet weak var viewMonth: UITextField!
    @IBOutlet weak var viewYear: UITextField!
    @IBOutlet weak var viewFirstname: UIView!
    @IBOutlet weak var viewSurname: UIView!
    @IBOutlet weak var viewMale: UIView!
    @IBOutlet weak var viewFemale: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtRePassword: UITextField!
    @IBOutlet weak var viewRePassword: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    
    var selected = 0
    var imagePicker = UIImagePickerController()
    var user: User!
    var image: Data!
    var homeLat: String!
    var homeLng: String!
    var workLat: String = "0"
    var workLng: String = "0"
    var gender = "Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       customizeViews()
    }
    
    func customizeViews(){
        nextButton.layer.cornerRadius = 7
        nextButton.layer.masksToBounds = true
        
        viewFirstname.layer.cornerRadius = 7
        viewSurname.layer.cornerRadius = 7
        viewDay.layer.cornerRadius = 7
        viewMonth.layer.cornerRadius = 7
        viewYear.layer.cornerRadius = 7
        viewEmail.layer.cornerRadius = 7
        viewAddress.layer.cornerRadius = 7
        viewWorkAddress.layer.cornerRadius = 7
        viewPassword.layer.cornerRadius = 7
        viewRePassword.layer.cornerRadius = 7
        
        
        let text = "Already have an account? Login"
        
        btnLogin.setTitle(text, for: .normal)
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Login")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#093EC5"), range: range1)
        btnLogin.setAttributedTitle(underlineAttriString, for: .normal)
        
        
    
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dobTapped(_:)))
//        viewDob.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.addressTapped(_:)))
        viewAddress.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.workAddressTapped(_:)))
        viewWorkAddress.addGestureRecognizer(tap2)
        
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.signupTapped(_:)))
        viewSignup.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap4)
        
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap5)
        
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap6)
    }
    
    @objc func contactTapped(_ sender: UITapGestureRecognizer? = nil) {
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
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
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if (txtWorkAddress.isFirstResponder || txtPassword.isFirstResponder) {
            self.view.frame.origin.y = -150 // Move view 150 points upward
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
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

    @IBAction func loginPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        let fname = txtName.text ?? ""
        let surname = txtSurname.text ?? ""
        let day = txtDay.text ?? ""
        let month = txtMonth.text ?? ""
        let year = txtYear.text ?? ""
        let dob = "\(day) - \(month) - \(year)"
        let email = txtEmail.text ?? ""
        let address = txtAddress.text ?? ""
        let workAddress = txtWorkAddress.text ?? ""
        let password = txtPassword.text ?? ""
        let retype = txtRePassword.text ?? ""
        
        
        if fname.isEmpty {
            self.view.makeToast("Please enter First Name")
            txtName.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if surname.isEmpty {
            self.view.makeToast("Please enter Surname")
            txtSurname.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if email.isEmpty {
            self.view.makeToast("Please enter Email")
            txtEmail.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if day.isEmpty {
            self.view.makeToast("Please enter Day")
            txtDay.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if month.isEmpty {
            self.view.makeToast("Please enter Month")
            txtMonth.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if day.isEmpty {
            self.view.makeToast("Please enter Year")
            txtYear.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if address.isEmpty {
            self.view.makeToast("Please enter Address")
            txtAddress.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if password.isEmpty {
            self.view.makeToast("Please enter Password")
            txtPassword.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if retype.isEmpty {
            self.view.makeToast("Please retype Password")
            txtRePassword.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        else if password != retype {
            self.view.makeToast("Passwords do not match")
            txtRePassword.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 5, revert: true)
            return
        }
        
        user.home_address = address
        user.work_address = workAddress
        user.home_lat = homeLat
        user.home_lng = homeLng
        user.work_lat = workLat
        user.work_lng = workLng
        user.gender = gender
        user.email = email
        user.dob = dob
        
        performSegue(withIdentifier: "toOccupation", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOccupation" {
            let vc = segue.destination as! OccupationViewController
            vc.fromController = "signup"
            vc.user = user
            vc.image = image
        }
    }

    @IBAction func galleryPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Choose your action:", message: "(Optional) You can add the photo later.", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Open media library", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                print("Button capture")

                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .savedPhotosAlbum
                self.imagePicker.allowsEditing = false

                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                print("Button camera")
                
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = false
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    
    @IBAction func femalePressed(_ sender: Any) {
        btnFemale.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
        btnMale.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        gender = "Female"
        
    }
    @IBAction func malePressed(_ sender: Any) {
        btnMale.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
        btnFemale.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        gender = "Male"
    }
}



//MARK:- GOOGLEPLACESCONTROLLER

extension RegistrationViewController: GMSAutocompleteViewControllerDelegate {
    
    
    // Handle the user's selection.
     func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place ID: \(place.placeID)")
        print("Place attributions: \(place.attributions)")
        print("Place Phone: \(place.phoneNumber)")
        
        
        if selected == 0 {
            txtAddress.text = place.name!
            saveAddress(type: "home", address: place.name!)
            homeLat = "\(place.coordinate.latitude)"
            homeLng = "\(place.coordinate.longitude)"
        }
        else {
            txtWorkAddress.text = place.name!
            saveAddress(type: "work", address: place.name!)
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


//MARK:- DATE SELECTED

extension RegistrationViewController: isDateSelected {
    
    func date_select(date: String) {
//        txtDob.text = date
    }
}


//MARK:- IMAGEPICKER

extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
//        imageView.image = image
        self.image = image.pngData()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        image = selectedImage.pngData()
//        imageTake.image = selectedImage
    }
}




//MARK:- UITEXTFIELD ERROR EXTENSION

extension UITextField {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}

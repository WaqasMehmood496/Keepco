//
//  PostViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/2/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import CoreLocation
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON
import GooglePlaces


class PostViewController: UIViewController {
    @IBOutlet weak var slider: ThumbTextSlider!
    @IBOutlet weak var txtPost: UITextView!
    @IBOutlet weak var viewRadio: UIView!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var viewTop: UIView!

    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnMarkerting: UIButton!
    @IBOutlet weak var btnFree: UIButton!
    @IBOutlet weak var btnExperience: UIButton!
    
    
    @IBOutlet weak var imgCheckIn: UIImageView!
    @IBOutlet weak var labelCheckIn: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var topCheckInConstraint: NSLayoutConstraint!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    
    
    var delegate: PostControllerDelegate!
    var imagePicker = UIImagePickerController()
    var locationManager: CLLocationManager?
    
    let NEW_POST = Config.BASE_URL + "addnewpost";
    var user_id: String!
    var checkInLat = "0"
    var checkInLng = "0"
    var checkedText = ""
    var tag = "marketing"
    var lat: String!
    var lng: String!
    var radius = "250"
    var image: Data!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetails()
        
        btnClose.isHidden = true
        imgCheckIn.isHidden = true
        
        topConstraint.constant = 10
        self.view.layoutIfNeeded()
        
        btnPost.layer.cornerRadius = 27.5
        btnPost.layer.masksToBounds = true

        slider.setThumbImage(UIImage(named: "marker_rotated"), for: .normal)
        slider.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
        
        if(language == "en"){
            slider.transform = CGAffineTransform(scaleX: 1, y: 1)
            slider.setValue(500, animated: false)

        }
        else {
            slider.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        
        viewRadio.layer.borderColor = UIColor(hexString: "#343997").cgColor
        viewRadio.layer.borderWidth = 1
        viewRadio.layer.cornerRadius = 5
    }
    
    func getDetails(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
    }
    
    func openSettings(){
           if let appSettings = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
             if UIApplication.shared.canOpenURL(appSettings) {
               UIApplication.shared.open(appSettings)
             }
           }
       }
    @IBAction func removePressed(_ sender: Any) {
        labelCheckIn.isHidden = true
        imgCheckIn.isHidden = true
        checkedText = ""
        btnRemove.isHidden = true
        
        if(imgPost.isHidden == true){
            topConstraint.constant = 10
        }
        else {
            topCheckInConstraint.constant = 10
        }
        
        self.view.layoutIfNeeded()
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func marketingPressed(_ sender: Any) {
        btnMarkerting.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
        btnFree.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        btnExperience.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        tag = "marketing"
    }
    
    @IBAction func freePressed(_ sender: Any) {
        btnMarkerting.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        btnFree.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
        btnExperience.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        tag = "free"

    }
    
    @IBAction func experiencePressed(_ sender: Any) {
        btnMarkerting.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        btnFree.setImage(#imageLiteral(resourceName: "ic_unchecked"), for: .normal)
        btnExperience.setImage(#imageLiteral(resourceName: "ic_checked"), for: .normal)
        tag = "experience"

    }
    
    @IBAction func closePressed(_ sender: Any) {
        imgPost.isHidden = true
        btnClose.isHidden = true
        
        image = nil
        
        if(checkedText.isEmpty){
            self.topConstraint.constant = 10
        }
        else {
            self.topConstraint.constant = 40
        }
        self.view.layoutIfNeeded()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func valueChanged(sender: UISlider) {
        let newValue = Int(sender.value/15) * 15
        var value = 0
        if(sender.value < 100){
            value = 0
        }
        else if sender.value < 250 {
            value = 100
        }
        else if sender.value < 500 {
            value = 250
        }
        else if sender.value < 1000 {
            value = 500
        }
        else {
            value = 1000
            showDialog()
        }
        
        radius = "\(value)"
        
        sender.setValue(Float(value), animated: false)
    }
    
    
    func showDialog(){
        var text = "Coming Soon"
        if(language == "he"){
            text = "בקרוב"
        }
        let alert = UIAlertController(title: text, message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            self.slider.setValue(Float(500), animated: false)
            self.radius = "500"
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func cameraPressed(_ sender: Any){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = false
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func galleryPressed(_ sender: Any){
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .savedPhotosAlbum
        self.imagePicker.allowsEditing = false
        
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func checkInPressed(_ sender: Any) {
//        locationManager = CLLocationManager()
//        locationManager?.delegate = self
//        locationManager?.requestAlwaysAuthorization()
        
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
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        let desc = txtPost.text ?? ""
        
        if(image == nil && desc.isEmpty){
            return
        }
        
        if(image != nil){
            addImagePost(desc: desc)
        }
        else {
            addPost(desc: desc)
        }
    }
    
    //REST Api
    
    func addPost(desc: String){
        self.indicator.startAnimating()
        let parameters = ["lat": lat!, "lng": lng!, "user_distance": radius, "user_id": user_id!, "post_category": tag, "hobby_id": "1", "occupation_id": "1", "description": desc ?? "", "type": "checkin", "checking_loc_lat": checkInLat, "checking_loc_lng": checkInLng, "checking_address": checkedText]
        
        AF.request(NEW_POST, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        if(language == "en"){
                            self.view.makeToast("Posted successfully")
                        }
                        else {
                            self.view.makeToast("פורסם בהצלחה")
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                            self.delegate.newPost()
                        })
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to upload post. Please try again")
                        }
                        else {
                            self.view.makeToast("העלאת הפוסט נכשלה. בבקשה נסה שוב")
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
    
    func addImagePost(desc: String){
        self.indicator.startAnimating()
        let parameters = ["lat": lat!, "lng": lng!, "user_distance": radius, "user_id": user_id!, "post_category": tag, "hobby_id": "1", "occupation_id": "1", "description": desc ?? "", "type": "media", "checking_loc_lat": checkInLat, "checking_loc_lng": checkInLng, "checking_address": checkedText]
        
         AF.upload(multipartFormData: { multipartFormData in
                  multipartFormData.append(self.image, withName: "image", fileName: "file.jpg", mimeType: "image/jpg")
                  for (key, value) in parameters {
                      multipartFormData.append((value.data(using: String.Encoding.utf8)!), withName: key)
                  }
              }, to: NEW_POST)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        if(language == "en"){
                            self.view.makeToast("Posted successfully")
                        }
                        else {
                            self.view.makeToast("פורסם בהצלחה")
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                            self.delegate.newPost()
                        })
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to upload post. Please try again")
                        }
                        else {
                            self.view.makeToast("העלאת הפוסט נכשלה. בבקשה נסה שוב")
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
}


//MARK:- CLLOCATION

extension PostViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            
        }
        else if status == .denied {
            
        }
    }
}

//MARK:- GOOGLEPLACESCONTROLLER

extension PostViewController: GMSAutocompleteViewControllerDelegate {
    
    
    // Handle the user's selection.
     func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place ID: \(place.placeID)")
        print("Place attributions: \(place.attributions)")
        print("Place Phone: \(place.phoneNumber)")
        
        labelCheckIn.text = place.name
        labelCheckIn.isHidden = false
        imgCheckIn.isHidden = false
        checkedText = place.name ?? ""
        
        btnRemove.isHidden = false
        
        if(imgPost.isHidden == true){
            topConstraint.constant = 40
        }
        else {
            topCheckInConstraint.constant = 40
        }
        self.view.layoutIfNeeded()
        
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

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        imgPost.image = image
        imgPost.isHidden = false
        btnClose.isHidden = false
        if(checkedText.isEmpty){
            self.topCheckInConstraint.constant = 10
            self.topConstraint.constant = 182
        }
        else {
            self.topCheckInConstraint.constant = 40
            self.topConstraint.constant = 222

        }
        self.image = image.jpegData(compressionQuality: 0.2)
        self.view.layoutIfNeeded()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        imgPost.image = selectedImage
        imgPost.isHidden = false
        btnClose.isHidden = false
        if(checkedText.isEmpty){
            self.topCheckInConstraint.constant = 10
            self.topConstraint.constant = 182
        }
        else {
            self.topCheckInConstraint.constant = 40
            self.topConstraint.constant = 222
        }
        
        image = selectedImage.jpegData(compressionQuality: 0.2)
        
        self.view.layoutIfNeeded()
    }
}




//MARK:- SELECT Occupation PROTOCOL
protocol PostControllerDelegate {
    func newPost()  //data: string is an example parameter
}

//
//  ManageAdvertisingViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/2/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire
import NVActivityIndicatorView
import Mantis

class ManageAdvertisingViewController: UIViewController {
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var labelBoard: UILabel!
    @IBOutlet weak var labelBoardTop: UILabel!
    @IBOutlet weak var labelBoardBottom: UILabel!
    @IBOutlet weak var imgBoard: UIImageView!
    @IBOutlet weak var viewBoard: CardView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var btnReset: UIButton!
    var imagePicker: ImagePicker!
    let ADVERTISEMENT_URL = Config.BASE_URL + "addadvertisment_banner";

    
    var image: Data!
    var image_string: String!
    var text: String = ""
    var user_id: String!
    var text_pos: String = "center"
    var checking_lat = "0"
    var checking_lng = "0"
    var checking_address = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        imgBoard.layer.cornerRadius = 10
        
        txtField.delegate = self
        
        btnSave.layer.cornerRadius = 27.5
        btnSave.layer.masksToBounds = true
        btnSave.layer.borderColor = UIColor(hexString: "#343997").cgColor
        btnSave.layer.borderWidth = 1
        
        labelBoard.isUserInteractionEnabled = false
        imgBoard.isUserInteractionEnabled = false
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(_:)))
        viewBoard.addGestureRecognizer(tap)
        
        txtField.addTarget(self, action: #selector(enterPressed), for: .editingDidEndOnExit)

        
    }
    
    @objc func enterPressed(){
        //do something with typed text if needed
        text = txtField.text ?? ""
        
        self.btnSave.isHidden = false
        
        labelBoard.text = text
        labelBoardTop.text = text
        labelBoardBottom.text = text
        
        
        
        txtField.resignFirstResponder()
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer? = nil) {
        let alert = UIAlertController(title: "Choose your action:", message: "", preferredStyle: .actionSheet)
        

        alert.addAction(UIAlertAction(title: "Top Left", style: .default, handler: { action in
            self.labelBoardTop.isHidden = false
            self.labelBoardTop.text = self.text
            self.labelBoardTop.textAlignment = .left
            
            self.labelBoard.isHidden = true
            self.labelBoardBottom.isHidden = true
            self.text_pos = "top_left"
            self.btnSave.isHidden = false
        }))
        
        
        alert.addAction(UIAlertAction(title: "Top Center", style: .default, handler: { action in
            self.labelBoardTop.isHidden = false
            self.labelBoardTop.text = self.text
            self.labelBoardTop.textAlignment = .center
            
            self.labelBoard.isHidden = true
            self.labelBoardBottom.isHidden = true
            self.text_pos = "top_center"
            self.btnSave.isHidden = false
        }))
        alert.addAction(UIAlertAction(title: "Top Right", style: .default, handler: { action in
            self.labelBoardTop.isHidden = false
            self.labelBoardTop.text = self.text
            self.labelBoardTop.textAlignment = .right
            
            self.labelBoard.isHidden = true
            self.labelBoardBottom.isHidden = true
            self.text_pos = "top_right"
            self.btnSave.isHidden = false
        }))
        
        alert.addAction(UIAlertAction(title: "Center Left", style: .default, handler: { action in
            self.labelBoard.isHidden = false
            self.labelBoard.text = self.text
            self.labelBoard.textAlignment = .left
            
            self.labelBoardTop.isHidden = true
            self.labelBoardBottom.isHidden = true
            self.text_pos = "center_left"
            self.btnSave.isHidden = false
        }))
        
        alert.addAction(UIAlertAction(title: "Center", style: .default, handler: { action in
            self.labelBoard.isHidden = false
            self.labelBoard.text = self.text
            self.labelBoard.textAlignment = .center
            
            self.labelBoardTop.isHidden = true
            self.labelBoardBottom.isHidden = true
            self.text_pos = "center"
            self.btnSave.isHidden = false
        }))
        
        alert.addAction(UIAlertAction(title: "Center Right", style: .default, handler: { action in
            self.labelBoard.isHidden = false
            self.labelBoard.text = self.text
            self.labelBoard.textAlignment = .right
            
            self.labelBoardTop.isHidden = true
            self.labelBoardBottom.isHidden = true
            self.text_pos = "center_right"
            self.btnSave.isHidden = false
        }))
        
        alert.addAction(UIAlertAction(title: "Bottom Left", style: .default, handler: { action in
            self.labelBoardBottom.isHidden = false
            self.labelBoardBottom.text = self.text
            self.labelBoardBottom.textAlignment = .left
            
            self.labelBoard.isHidden = true
            self.labelBoardTop.isHidden = true
            self.text_pos = "bottom_left"
            self.btnSave.isHidden = false
        }))
        
        alert.addAction(UIAlertAction(title: "Bottom Center", style: .default, handler: { action in
            self.labelBoardBottom.isHidden = false
            self.labelBoardBottom.text = self.text
            self.labelBoardBottom.textAlignment = .center
            
            self.labelBoard.isHidden = true
            self.labelBoardTop.isHidden = true
            self.text_pos = "bottom_center"
            self.btnSave.isHidden = false
        }))
        alert.addAction(UIAlertAction(title: "Bottom Right", style: .default, handler: { action in
            self.labelBoardBottom.isHidden = false
            self.labelBoardBottom.text = self.text
            self.labelBoardBottom.textAlignment = .right
            
            self.labelBoard.isHidden = true
            self.labelBoardTop.isHidden = true
            self.text_pos = "bottom_right"
            self.btnSave.isHidden = false
        }))
        
        alert.addAction(UIAlertAction(title: "Clear Text", style: .default, handler: { action in
            self.labelBoardBottom.text = ""    
            self.labelBoard.text = ""
            self.labelBoardTop.text = ""
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    func getDetails(){
        let advert = UserDefaults.standard.string(forKey: Config.ADVERTISEMENT) ?? ""
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
        
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
        
        self.text = text
        self.text_pos = text_position
    
        
//        self.labelBoard.text = text
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
    
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    @IBAction func savePressed(_ sender: Any) {
        if(image == nil){
            self.addAdvert()
        }
        else {
            self.advertWithImage()
        }
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    @IBAction func photoPressed(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    @IBAction func checkInPressed(_ sender: Any) {
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        imgBoard.image = nil
        image = nil
        labelBoard.text = ""
        labelBoardTop.text = ""
        labelBoardBottom.text = ""
        text = ""
        btnSave.isHidden = true
    }
    
    func addAdvert(){
        self.indicator.startAnimating()
        
        let parameters: [String: Any] = [
            "user_id": user_id ?? "",
            "a_text": text ?? "",
            "text_loc": text_pos ?? "",
            "a_type": "gernal"
        ]
        
        print(parameters)
        
        AF.request(ADVERTISEMENT_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        self.savePreferences(type: "gernal", image: "")
                        if(language == "en"){
                            self.view.makeToast("Advertisement board updated")
                        }
                        else {
                            self.view.makeToast("לוח הפרסום עודכן")
                        }
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to update advertisement board")
                        }
                        else {
                            self.view.makeToast("עדכון לוח המודעות נכשל")
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
    
    func advertWithImage(){
        self.indicator.startAnimating()
        
        let parameters: [String: String] = [
            "user_id": user_id ?? "",
            "a_text": text ?? "",
            "text_loc": text_pos ?? "",
            "a_type": "media"
        ]
        print(parameters)
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(self.image, withName: "image", fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in parameters {
                multipartFormData.append((value.data(using: String.Encoding.utf8)!), withName: key)
            }
        }, to: ADVERTISEMENT_URL)
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        self.savePreferences(type: "media", image: self.image_string)
                        if(language == "en"){
                            self.view.makeToast("Advertisement board updated")
                        }
                        else {
                            self.view.makeToast("לוח הפרסום עודכן")
                        }
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to update advertisement board")
                        }
                        else {
                            self.view.makeToast("עדכון לוח המודעות נכשל")
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
    
    func savePreferences(type: String, image: String){
        var json: JSON = [:]
        json["a_text"].stringValue = self.text
        json["a_type"].stringValue = type
        json["a_local"].boolValue = true
        json["a_image"].stringValue = image
        json["text_loc"].stringValue = self.text_pos
        json["a_cecking_lat"].stringValue = self.checking_lat
        json["a_cecking_lng"].stringValue = self.checking_lng
        json["a_checking_address"].stringValue = self.checking_address
        
        UserDefaults.standard.setValue("\(json)", forKey: Config.ADVERTISEMENT)
        UserDefaults.standard.synchronize()
        
        self.btnSave.isHidden = true
        self.txtField.text = ""
    }
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}


//MARK:- IMAGEPICKER

extension ManageAdvertisingViewController: ImagePickerDelegate, CropViewControllerDelegate {
   
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        let config = Mantis.Config()
        let cropViewController = Mantis.cropViewController(image: image,
                                                           config: config)
        cropViewController.modalPresentationStyle = .fullScreen
        cropViewController.config.presetFixedRatioType = .alwaysUsingOnePresetFixedRatio(ratio: 16.0 / 9.0)
        cropViewController.config.showRotationDial = false
        cropViewController.delegate = self
        present(cropViewController, animated: true)
        
    }
    
    func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation) {
        print(transformation);
        imgBoard.isHidden = false
                
        if let imageData = cropped.jpeg(.low) {
            print(imageData.count)
            self.image = imageData
            self.imgBoard.image = UIImage(data: imageData)
            self.image_string = UIImage(data: imageData)?.toBase64()
        }

        self.dismiss(animated: true)
        self.btnSave.isHidden = false
    }
    
    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        self.dismiss(animated: true)
    }
}


//MARK:- TextField
extension ManageAdvertisingViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 20
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}


extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}


extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
}

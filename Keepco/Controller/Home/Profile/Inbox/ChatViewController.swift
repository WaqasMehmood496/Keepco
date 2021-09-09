//
//  ChatViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 8/16/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView
import SwiftyJSON
import Kingfisher
import AVKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewProgress: UIView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var viewSend: UIView!
    @IBOutlet weak var txtMsg: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var imgFullScreen: UIImageView!
    
    var my_id: String!
    var user_id: String!
    var user_name: String!
    var user_image: String!
    var array = [ChatMessage]()
    let INSERT_URL = Config.BASE_URL + "chatSystem/insert";
    let GET_CHAT = Config.BASE_URL + "chatSystem/read";
    var imagePicker: UIImagePickerController!
    var selectedType: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        
   
        DispatchQueue.main.async {
            self.imagePicker = UIImagePickerController()
        }
        
        txtMsg.delegate = self
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        
        if(!user_image.isEmpty){
            let url = URL(string: user_image)
            imgProfile.kf.setImage(with: url)
        }
        
        labelName.text = user_name
        getChat()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        tableView.contentInset = .zero
    }
    
   @objc func hideKeyboard() {
        tableView.endEditing(true)
    }
    
    func getDetails(){
        my_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        showDialog()
    }
    @IBAction func sendPressed(_ sender: Any) {
        let text = txtMsg.text ?? ""
        
        if(text.isEmpty){
            return
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        
        let chat = ChatMessage(messageText: text, name: user_name, day: formatter.string(from: date), messageType: "text", url: "", isLocal: true, isLoading: false)
        chat.userType = UserType.OTHER
        
        array.append(chat)
        
        txtMsg.text = ""
        tableView.reloadData()
         self.tableView.scrollToRow(at: IndexPath(item:self.array.count-1, section: 0), at: .bottom, animated: true)
        
        insertChat(text: text)
        
    }
    
    @IBAction func closeImage(_ sender: Any) {
        self.viewImage.isHidden = true
        self.imgFullScreen.image = nil
    }
    
    func sendImage(image: UIImage){

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        
        let chat = ChatMessage(messageText: "", name: user_name, day: formatter.string(from: date), messageType: "image", url: "", isLocal: true, isLoading: false)
        chat.userType = UserType.OTHER
        chat.data = image.pngData()
        array.append(chat)
        
        tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(item:self.array.count-1, section: 0), at: .bottom, animated: true)
        
        insertImage(image: image.pngData()!)
        
    }
    
    func sendVideo(video: URL){

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        
        let chat = ChatMessage(messageText: "", name: user_name, day: formatter.string(from: date), messageType: "video", url: "", isLocal: true, isLoading: false)
        chat.userType = UserType.OTHER
        chat.videoUrl = video
        array.append(chat)
        
        tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(item:self.array.count-1, section: 0), at: .bottom, animated: true)
                
    }
    
    func showDialog(){
        var choose = "Choose:"
        var photo = "Photo"
        var camera = "Camera"
        var video = "Video"
        var cancel = "Cancel"
        if(language == "he"){
            choose = "בחר"
            photo = "תמונה"
            camera = "מצלמה"
            video = "וידאוֹ"
            cancel = "לבטל"
        }
        let alert = UIAlertController(title: choose, message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: photo, style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                print("Button capture")
                
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .savedPhotosAlbum
                self.imagePicker.allowsEditing = false
                self.selectedType = "image"
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: camera, style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                print("Button camera")
                
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = false
                self.selectedType = "image"
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: video, style: .default, handler: { action in
                print("Button camera")
            
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .savedPhotosAlbum
            self.imagePicker.mediaTypes = ["public.movie"]
            self.imagePicker.allowsEditing = false
            self.selectedType = "video"
            
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: nil))

        
        self.present(alert, animated: true)
    }
    
    //REST API
    func getChat(){
        
        let parameters: [String: String] = ["user_id": my_id!, "selected_id": self.user_id!]
        
        self.viewProgress.isHidden = true
        self.indicator.startAnimating()
        
        AF.request(GET_CHAT, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    self.array.removeAll()
                    
                    if success == 1 {
                        let jsonArray = json["message"].arrayValue
                        
                        for item in jsonArray {
                            let chat = ChatMessage(messageText: item["msg"].stringValue, name: self.user_name, day: item["date"].stringValue, messageType: item["chat_type"].stringValue, url: item["media_url"].stringValue, isLocal: false, isLoading: false)
                            let receiver_id = item["reciver_id"].stringValue
                            
                            if(receiver_id == self.user_id){
                                chat.userType = UserType.OTHER
                            }
                            else {
                                chat.userType = UserType.SELF
                            }
                            
                            self.array.append(chat)
                        }
                        
                        
                        
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("No results found")
                        }
                        else {
                            self.view.makeToast("לא נמצאו תוצאות")
                        }
                    }
                    
                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true
                    self.tableView.reloadData()
                    if(self.array.count > 0){
                        self.tableView.scrollToRow(at: IndexPath(item:self.array.count-1, section: 0), at: .bottom, animated: false)

                    }

                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true

                }
        }
    }
    
    //REST API
    func insertChat(text: String){
           
        let parameters: [String: String] = ["user_id": my_id!, "selected_id": self.user_id!, "msg": text, "chat_type": "text"]
                      
           AF.request(INSERT_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
               .responseJSON { response in
                   switch response.result {
                   case .success(let data):
                       let json = JSON(data)
                       print(json)
                       let success = json["sucess"].int
                       
                       break
                       
                   case .failure(let error):
                       print(error)

                   }
           }
       }
    
    func insertImage(image: Data){           
        let parameters: [String: String] = ["user_id": my_id!, "msg": "", "selected_id": user_id!, "chat_type": "image"]
                      
           AF.upload(multipartFormData: { multipartFormData in
               multipartFormData.append(image, withName: "image", fileName: "file.jpg", mimeType: "image/jpg")
               for (key, value) in parameters {
                   multipartFormData.append((value.data(using: String.Encoding.utf8)!), withName: key)
               }
           }, to: INSERT_URL)
               .responseJSON { response in
                   debugPrint(response)
                   switch response.result {
                   case .success(let data):
                       let json = JSON(data)
                       print(json)
                       let success = json["sucess"].int
                       
                       break
                       
                   case .failure(let error):
                       print(error)
                       
                   }
           }
           
       }
    
    func insertVideo(url: URL){
        let parameters: [String: String] = ["user_id": my_id!, "msg": "", "selected_id": user_id!, "chat_type": "video"]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(url, withName: "video_file", fileName: "file.mp4", mimeType: "video/mp4")
            for (key, value) in parameters {
                multipartFormData.append((value.data(using: String.Encoding.utf8)!), withName: key)
            }
        }, to: INSERT_URL)
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    break
                    
                case .failure(let error):
                    print(error)
                    
                }
        }
        
    }
    
}


//MARK:- TableView
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = array[indexPath.row]
        
        //TEXT
        if(chat.userType == UserType.SELF && chat.messageType == "text"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "incomingCell", for: indexPath) as! IncomingTableViewCell
            
            cell.labelNAme.text = self.user_name
            cell.labelDate.text = chat.day
            cell.labelMsg.text = chat.messageText
            
            return cell
        }//IMAGE
        else if(chat.userType == UserType.SELF && chat.messageType == "image") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "incomingImageCell", for: indexPath) as! IncomingTableViewCell
            
            cell.labelNAme.text = self.user_name
            cell.labelDate.text = chat.day
            let url = URL(string: chat.url)
            cell.imgChat.kf.setImage(with: url)
            cell.btnPlay.isHidden = true
            
            return cell
            
        }//TEXT
        else if(chat.userType == UserType.OTHER && chat.messageType == "text") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "outgoingCell", for: indexPath) as! OutgoingTableViewCell
            
            cell.labelMsg.text = chat.messageText
            cell.labelDate.text = chat.day
            
            return cell
        }
        else if(chat.userType == UserType.OTHER && chat.messageType == "image") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "outgoingImageCell", for: indexPath) as! OutgoingTableViewCell
            
            cell.labelDate.text = chat.day
            if(chat.isLocal){
                cell.imgChat.image = UIImage(data: chat.data!)
            }
            else {
                let url = URL(string: chat.url)
                cell.imgChat.kf.setImage(with: url)
            }
            cell.btnPlay.isHidden = true

            
            return cell
        }//Video
        else if(chat.userType == UserType.OTHER && chat.messageType == "video") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "outgoingImageCell", for: indexPath) as! OutgoingTableViewCell
            
            cell.labelDate.text = chat.day
            cell.imgChat.image = UIImage(named: "black.png")
            cell.btnPlay.isHidden = false
            
            return cell
        }
        else {
           let cell = tableView.dequeueReusableCell(withIdentifier: "incomingImageCell", for: indexPath) as! IncomingTableViewCell
            
            cell.labelDate.text = chat.day
            cell.imgChat.image = UIImage(named: "black.png")
            cell.btnPlay.isHidden = false
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let chat = array[indexPath.row]
        
        //TEXT
        if(chat.userType == UserType.SELF && chat.messageType == "text"){
            
        }//IMAGE
        else if(chat.userType == UserType.SELF && chat.messageType == "image") {
           //Do
            let url = URL(string: chat.url)
            self.imgFullScreen.kf.setImage(with: url)
            self.viewImage.isHidden = false
        }//TEXT
        else if(chat.userType == UserType.OTHER && chat.messageType == "text") {
           
        }
        else if(chat.userType == UserType.OTHER && chat.messageType == "image") {
           //Do
            if(chat.isLocal){
                self.imgFullScreen.image = UIImage(data: chat.data!)
                self.viewImage.isHidden = false
            }
            else {
                let url = URL(string: chat.url)
                self.imgFullScreen.kf.setImage(with: url)
                self.viewImage.isHidden = false
            }
        }//Video
        else if(chat.userType == UserType.OTHER && chat.messageType == "video") {
           //Play
            if(chat.isLocal){
                let player = AVPlayer(url: chat.videoUrl!)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.present(playerViewController, animated: true) {
                    playerViewController.player!.play()
                }
            }
            else {
                let videoURL = URL(string: chat.url)
                let player = AVPlayer(url: videoURL!)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.present(playerViewController, animated: true) {
                    playerViewController.player!.play()
                }
            }
        }
        else {
            //Play
            let videoURL = URL(string: chat.url)
            let player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
}

//MARK:- ImagePicker
extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        //        imageView.image = image
//        self.image = image.pngData()
        sendImage(image: image)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        
        
        if(selectedType == "image"){
            guard let selectedImage = info[.originalImage] as? UIImage else {
                print("Image not found!")
                return
            }
            
            sendImage(image: selectedImage)
        }
        else {
            let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL
            sendVideo(video: videoURL!)
        }

//        image = selectedImage.pngData()
        //        imageTake.image = selectedImage
    }
}


//MARK:- TextField
extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK:- Extension of UIImage
extension UIImage {
    func resizeWithPercent(percentage: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    func resizeWithWidth(width: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
}

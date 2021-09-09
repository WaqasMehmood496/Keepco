//
//  InboxViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 8/15/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON
import Kingfisher

class InboxViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    
    let INBOX_URL = Config.BASE_URL + "chatSystem/massage_list";
    var array = [Chat]()
    var user_id: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getInbox()
    }
    
    func getDetails(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
    }
    
    //REST API
    func getInbox(){
        
        let parameters: [String: String] = ["user_id": user_id!]
        
        self.indicator.startAnimating()
        
        
        AF.request(INBOX_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    self.array.removeAll()

                    if success == 1 {
                        let jsonArray = json["messagelist"].arrayValue
                        
                        for item in jsonArray {
                            let chat = Chat(sender_id: item["userdetail"]["user_id"].stringValue, receiver_id: "", sender_name: item["userdetail"]["user_name"].stringValue, date: item["date"].stringValue, msg: item["last_massage"].stringValue, sender_image: item["userdetail"]["Image"].stringValue, receiver_image: "", msg_count: "")
                            
                            if item["chat_type"].stringValue == "video" {
                                chat.msg = "Video"
                            }
                            else if item["chat_type"].stringValue == "image" {
                                chat.msg = "Image"
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
                    self.tableView.reloadData()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                }
        }
    }
    

}


//MARK:- TableView
extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inboxCell", for: indexPath) as! InboxCell
        
        let chat = array[indexPath.row]
        
        cell.labelMsg.text = chat.msg
        cell.labelName.text = chat.sender_name
        
        if(chat.sender_image.isEmpty){
            cell.imgProfile.image = UIImage(named: "ic_no_image")
        }
        else {
            let url = URL(string: chat.sender_image)
            cell.imgProfile.kf.setImage(with: url)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chat = array[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        newViewController.user_id = chat.sender_id
        newViewController.user_image = chat.sender_image
        newViewController.user_name = chat.sender_name
        newViewController.modalPresentationStyle = .fullScreen
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
}

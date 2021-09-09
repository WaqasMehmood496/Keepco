//
//  CommentsViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 8/12/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON
import Kingfisher

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var txtComment: UITextField!
    @IBOutlet weak var imgComment: UIImageView!
    @IBOutlet weak var viewSend: UIView!
    
    let ADD_COMMENTS = Config.BASE_URL + "add_comments";
    let GET_COMMENTS = Config.BASE_URL + "readcomments/";

    var array = [Comment]()
    var user_id: String!
    var user_name: String!
    var user_image: String!
    var post_id: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 10
        txtComment.becomeFirstResponder()
        
        viewSend.layer.cornerRadius = viewSend.frame.height/2

        getDetails()
        getComments()
    }
    
    func getDetails(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
        user_name = UserDefaults.standard.string(forKey: Config.USER_NAME) ?? ""
        user_image = UserDefaults.standard.string(forKey: Config.USER_IMAGE) ?? ""
        
        if(user_image.isEmpty){
            imgComment.image = #imageLiteral(resourceName: "ic_no_image")
        }
        else {
            let url = URL(string: user_image)
            imgComment.kf.setImage(with: url)
        }
    }

    @IBAction func sendPressed(_ sender: Any) {
        let text = txtComment.text ?? ""
        
        if(text.isEmpty){
            return
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        
        let comment = Comment(id: "", user_id: user_id, user_name: user_name, user_image: user_image, date: formatter.string(from: date), comment: text)
        
        array.append(comment)
        tableView.reloadData()
        sendComment(comment: text)
        
        txtComment.text = ""
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //REST API
    func getComments(){
        self.indicator.startAnimating()
        
        AF.request(GET_COMMENTS + post_id!, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["success"].int
                    
                    if success == 1 {
                        let jsonArray = json["return_data"].arrayValue
                        
                        for item in jsonArray {
                            let comment = Comment(id: "", user_id: item["user_id"].stringValue, user_name: item["user_name"].stringValue, user_image: item["Image"].stringValue, date: item["cmt_inserted_date"].stringValue, comment: item["commment_text"].stringValue)
                            self.array.append(comment)
                        }
                        
                    }
                    else {
//                        self.view.makeToast("")
                    }
                    self.tableView.reloadData()
                    
                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                }
        }
    }
    
    func sendComment(comment: String){
        let parameters = ["post_id": post_id!, "commment_text": comment ?? "", "user_id": user_id!]
        
        AF.request(ADD_COMMENTS, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["success"].int
                    
                    
                    self.indicator.stopAnimating()
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                }
        }
    }
}



//MARK:- TableView
extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentsTableViewCell
        
        let comment = array[indexPath.row]
        
        cell.labelName.text = comment.user_name
        cell.labelComment.text = comment.comment
        
        cell.labelDate.text = comment.date
        
        if(comment.user_image.isEmpty){
            cell.imgProfile.image = #imageLiteral(resourceName: "ic_no_image")
        }
        else {
            let url = URL(string: comment.user_image)
            cell.imgProfile.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}



//MARK:- Structure

struct Comment {
    var id: String
    var user_id: String
    var user_name: String
    var user_image: String
    var date: String
    var comment: String
}

//
//  ProfileVisitsViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 2/17/21.
//  Copyright © 2021 Usman Meraj. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON

class ProfileVisitsViewController: UIViewController {

    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var array = [User]()
    var user_id: String!
    var delegate: UsersListDelegate!
    
    var VISITS_URL = Config.BASE_URL + "listofview/"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableView.tableFooterView = UIView()
        
        getUsers()
    }
    
    func getData(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
    }
    
    
    //REST API
    func getUsers(){
                
        self.indicator.startAnimating()
        
        AF.request(VISITS_URL + user_id, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    
                        let jsonArray = json["return_data"].arrayValue
                        
                        for item in jsonArray {
                            let user = User(id: item["user_id"].stringValue, email: item["user_email"].stringValue, username: item["user_name"].stringValue, password: "", image: item["profile_photo"].stringValue, gender: "", phone: item["phone_number"].stringValue, dob: "", home_address: "", work_address: "", home_lat: item["latitude"].stringValue, home_lng: item["logitude"].stringValue, work_lat: item["worklatitude"].stringValue, work_lng: item["worklogitude"].stringValue, occupation: item["occupation_id"].stringValue, sub_occupation: item["suboccupation_id"].stringValue, fun: item["fun_id"].stringValue, sub_fun: item["subfun_id"].stringValue, distance: item["distance"].stringValue, no_of_views: "")
                            user.workDistance = item["workdistance"].stringValue
                            self.array.append(user)
                            
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
    
    
}


//MARK:- Delegate
extension ProfileVisitsViewController: UsersListDelegate {
    func closeController() {
        delegate.closeController()
    }
}

//MARK:- TableView
extension ProfileVisitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inboxCell", for: indexPath) as! InboxCell
        
        let user = array[indexPath.row]
        
        cell.labelName.text = user.username
        
        if(user.image.isEmpty){
            cell.imgProfile.image = UIImage(named: "ic_no_image")
        }
        else {
            let url = URL(string: user.image)
            cell.imgProfile.kf.setImage(with: url)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(array[indexPath.row].id == user_id){
            return
        }
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        controller.user_id = array[indexPath.row].id
        controller.delegate = self
        addChild(controller)
        controller.view.frame = self.view.bounds
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
    }
    
}

//
//  UsersListViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 1/21/21.
//  Copyright © 2021 Usman Meraj. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var array = [User]()
    var user_id: String!
    var delegate: UsersListDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }

    @IBAction func closePressed(_ sender: Any) {
        delegate.closeController()
    }
}

//MARK:- Delegate
extension UsersListViewController: UsersListDelegate {
    func closeController() {
        delegate.closeController()
    }
}

//MARK:- TableView
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
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



//MARK:- SELECT Occupation PROTOCOL
protocol UsersListDelegate {
    func closeController()  //data: string is an example parameter
}

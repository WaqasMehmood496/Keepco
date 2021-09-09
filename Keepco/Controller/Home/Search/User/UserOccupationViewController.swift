//
//  UserOccupationViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 8/15/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserOccupationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    
    var array = [Occupation]()
    var answersArray = [Occupation]()
    var parentArray = [String]()
    var isManaging = false
    var manageBoard: AddOccupationsViewController!
    var answers: String!
    var occupations: String!
    var subOccupations: String!
    var delegate: UserFunsDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetails()

    }
    
    @IBAction func closePressed(_ sender: Any) {
        delegate.closeController()
    }
    
    func getDetails(){
        
        let json = JSON.init(parseJSON: answers)
        
        let occupationsText = json.arrayValue
        
        
        for item in occupationsText {
            let occupation = Occupation(id: item["suboccupation_id"].intValue, parentId: item["parent_id"].intValue, name: "", text: item["subocc_text"].stringValue, selected: true)
            
            answersArray.append(occupation)
        }
        
        
        occupations = occupations.replacingOccurrences(of: " ", with: "")
        subOccupations = subOccupations.replacingOccurrences(of: " ", with: "")
        
        
        let arr = occupations.components(separatedBy: ",")
        let subArr = subOccupations.components(separatedBy: ",")
        
        if(arr.count == 0){
            return
        }
        else if(arr.count == 1){
            addChild(occupationId: occupations.trimmingCharacters(in: .whitespaces), subId: subOccupations.trimmingCharacters(in: .whitespaces))
        }
        else {
            for (index, item) in arr.enumerated() {
                addChild(occupationId: item, subId: subArr[index])
            }
        }
        
        tableView.reloadData()
        
    }
    
    func addChild(occupationId: String, subId: String){
        let number = Int(occupationId)
        let child = Int(subId)
        
        var occupationsArray = [Occupation]()
        var parent = ""
        
        if number == 0 {
            occupationsArray = OccupationArrays.computerNames()
            parent = "Technology and computers"
        }//Repairs
        else if number == 1 {
            occupationsArray = OccupationArrays.repairNames()
            parent = "Creation and repairs"
        }//Repairs
        else if number == 2 {
            occupationsArray = OccupationArrays.restaurantNames()
            parent = "Restaurant"
        }//Security
        else if number == 3 {
            occupationsArray = OccupationArrays.securityNames()
            parent = "Security and Cyber"
        }//Teaching
        else if number == 4 {
            occupationsArray = OccupationArrays.teachingNames()
            parent = "Teaching and Guidance"
        }//Communication
        else if number == 5 {
            occupationsArray = OccupationArrays.communcationNames()
            parent = "Communication and Marketing"
        }//Medicine
        else if number == 6 {
            occupationsArray = OccupationArrays.medicineNames()
            parent = "Medicine and body"
        }//Humanities
        else if number == 7 {
            occupationsArray = OccupationArrays.humanityNames()
            parent = "Humanities"
        }//Design
        else if number == 8 {
            occupationsArray = OccupationArrays.designNames()
            parent = "Design"
        }//Engineering
        else if number == 9 {
            occupationsArray = OccupationArrays.engineerNames()
            parent = "Engineering"
        }//Finance
        else if number == 10 {
            occupationsArray = OccupationArrays.financeNames()
            parent = "Finance and Investment"
        }//Law
        else if number == 11 {
            occupationsArray = OccupationArrays.lawNames()
            parent = "Law"
        }//General Professions
        else if number == 12 {
            occupationsArray = OccupationArrays.generalProfessions()
        }//Aviation
        else if number == 13 {
            occupationsArray = OccupationArrays.aviationNames()
        }//Insurance
        else if number == 14 {
            occupationsArray = OccupationArrays.insuranceNames()
        }//Forwarding
        else if number == 15 {
            occupationsArray = OccupationArrays.forwardingNames()
        }//Transportation
        else if number == 16 {
            occupationsArray = OccupationArrays.transportationNames()
        }//Bulding
        else if number == 17 {
            occupationsArray = OccupationArrays.buildingNames()
        }//Care and fashion
        else if number == 18 {
            occupationsArray = OccupationArrays.careNames()
        }//Warehouse
        else if number == 19 {
            occupationsArray = OccupationArrays.warehouseNames()
        }//Cleaning
        else if number == 20 {
            occupationsArray = OccupationArrays.cleaningNames()
        }//Tourism
        else if number == 21 {
            occupationsArray = OccupationArrays.tourismNames()
        }//Vehicle Names
        else if number == 22 {
            occupationsArray = OccupationArrays.vehicleNames()
        }//Nature and Environmental
        else if number == 23 {
            occupationsArray = OccupationArrays.natureNames()
        }//Electricty
        else if number == 24 {
            occupationsArray = OccupationArrays.electricityNames()
        }//Water
        else if number == 25 {
            occupationsArray = OccupationArrays.waterNames()
        }//Agriculture
        else if number == 26 {
            occupationsArray = OccupationArrays.agricultureNames()
        }//Sport
        else if number == 27 {
            occupationsArray = OccupationArrays.sportNames()
        }//Culture
        else if number == 28 {
            occupationsArray = OccupationArrays.cultureAndEntertainmentNames()
        }//Welfare
        else if number == 29 {
            occupationsArray = OccupationArrays.welfareNames()
        }//General Management
        else if number == 30 {
            occupationsArray = OccupationArrays.generalManagementNames()
        }//Sales
        else if number == 31 {
            occupationsArray = OccupationArrays.salesNames()
        }//Religion
        else if number == 32 {
            occupationsArray = OccupationArrays.religionNames()
        }//Exact Sciences
        else if number == 33 {
            occupationsArray = OccupationArrays.exactScienceNames()
        }//Governmental
        else if number == 34 {
            occupationsArray = OccupationArrays.governmentalNames()
        }//Shop
        else if number == 35 {
            occupationsArray = OccupationArrays.shopNames()
        }//Food and Pharma
        else if number == 36 {
            occupationsArray = OccupationArrays.foodAndPharmaNames()
        }//Lab
        else if number == 37 {
            occupationsArray = OccupationArrays.labNames()
        }
        else if number == 38 {
            occupationsArray = OccupationArrays.moreRepairNames()
        }
        else if number == 39 {
            occupationsArray = OccupationArrays.moreComputerNames()
        }
        else if number == 40 {
            occupationsArray = OccupationArrays.moreSecurityNames()
        }
        else if number == 41 {
            occupationsArray = OccupationArrays.moreTeachingNames()
        }
        else if number == 42 {
            occupationsArray = OccupationArrays.moreCommunicationNames()
        }
        else if number == 43 {
            occupationsArray = OccupationArrays.moreMedicineNames()
        }
        else if number == 44 {
            occupationsArray = OccupationArrays.moreEngineerNames()
        }
        else if number == 45 {
            occupationsArray = OccupationArrays.moreFinanceNames()
        }
        
        if(!parentArray.contains(parent) && !parent.isEmpty){
            parentArray.append(parent)
        }
        
        
        for (i, item) in occupationsArray.enumerated() {
            
            if item.id == child {
                
                var isAdded = false
                
                
                for (j, item2) in self.answersArray.enumerated() {
                    
                    if(item2.id == child && item2.parentId == number){
                        item.text = item2.text
                        isAdded = true
                    }
                }
                
                if(!isAdded){
                    item.text = ""
                }
                
                self.array.append(item)
            }
        }
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //    @IBAction func addPressed(_ sender: Any) {
    //        performSegue(withIdentifier: "toAddOccupation", sender: nil)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddOccupation" {
            let vc = segue.destination as! OccupationViewController
            vc.fromController = "edit"
        }
    }
}


//MARK:- TableView
extension UserOccupationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "occupationsCell", for: indexPath) as! MyOccupationsCell
            
            let occupation = array[indexPath.row]
            
            cell.labelOccupation.text = occupation.name
            cell.txtView.text = occupation.text
            
            if(isManaging){
                cell.txtView.isUserInteractionEnabled = true
            }
            else {
                cell.txtView.isUserInteractionEnabled = false
            }
            
            return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 175
        }
        else {
            return 200
        }
    }
    
}


//MARK:- Protocol
protocol UserFunsDelegate {
    func closeController()
}

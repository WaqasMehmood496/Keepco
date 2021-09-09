//
//  SelectOccupationViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/18/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class SelectOccupationViewController: UIViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewOccupation: UIView!
    @IBOutlet weak var labelOccupationLeftConstraint: NSLayoutConstraint!
    
    let arrayEn: [Occupation] = [Occupation(id: 0, name: "Technology and computers", icon: UIImage(named: "cat_computer")!, selected: false),
                                 Occupation(id: 1, name: "Creation and repairs", icon: UIImage(named: "cat_creation")!, selected: false),
                                 Occupation(id: 2, name: "Restaurant", icon: UIImage(named: "cat_restaurant")!, selected: false),
                                 Occupation(id: 3, name: "Security and Cyber", icon: UIImage(named: "cat_security")!, selected: false),
                                 Occupation(id: 4, name: "Teaching and Guidance", icon: UIImage(named: "cat_teaching")!, selected: false),
                                 Occupation(id: 5, name: "Communication and Marketing", icon: UIImage(named: "cat_marketing")!, selected: false),
                                 Occupation(id: 6, name: "Medicine and body", icon: UIImage(named: "cat_medicine")!, selected: false),
                                 Occupation(id: 7, name: "Humanities", icon: UIImage(named: "cat_humanities")!, selected: false),
                                 Occupation(id: 8, name: "Design", icon: UIImage(named: "cat_design")!, selected: false),
                                 Occupation(id: 9, name: "Engineering", icon: UIImage(named: "cat_engineer")!, selected: false),
                                 Occupation(id: 10, name: "Finance and Investment", icon: UIImage(named: "cat_finance")!, selected: false),
                                 Occupation(id: 11, name: "Law", icon: UIImage(named: "cat_law")!, selected: false)
    ]
    let arrayHe: [Occupation] = [Occupation(id: 0, name: "טכנולוגיה ומחשבים", icon: UIImage(named: "cat_computer")!, selected: false),
                                 Occupation(id: 1, name: "יצירה ותיקונים", icon: UIImage(named: "cat_creation")!, selected: false),
                                 Occupation(id: 2, name: "מסעדנות", icon: UIImage(named: "cat_restaurant")!, selected: false),
                                 Occupation(id: 3, name: "ביטחון וסייבר", icon: UIImage(named: "cat_security")!, selected: false),
                                 Occupation(id: 4, name: "הוראה והנחיה", icon: UIImage(named: "cat_teaching")!, selected: false),
                                 Occupation(id: 5, name: "תקשורת ושיווק", icon: UIImage(named: "cat_marketing")!, selected: false),
                                 Occupation(id: 6, name: "רפואה וגוף", icon: UIImage(named: "cat_medicine")!, selected: false),
                                 Occupation(id: 7, name: "מדעי הרוח", icon: UIImage(named: "cat_humanities")!, selected: false),
                                 Occupation(id: 8, name: "עיצוב", icon: UIImage(named: "cat_design")!, selected: false),
                                 Occupation(id: 9, name: "הנדסה", icon: UIImage(named: "cat_engineer")!, selected: false),
                                 Occupation(id: 10, name: "פיננסים והשקעות", icon: UIImage(named: "cat_finance")!, selected: false),
                                 Occupation(id: 11, name: "משפטים", icon: UIImage(named: "cat_law")!, selected: false)
    ]
    
    var array = [Occupation]()
    var delegate: isOccupationSelected!
        
    var collArray = [Occupation]()
    var filtered:[Occupation] = []
    var collLayout: OccupationFlowLayout!
    @IBOutlet weak var btnBack: UIButton!
    
    var searchActive = false
    var isParentArray = true
    var fromController: String!
    var parentSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collLayout = OccupationFlowLayout()
        self.collectionView.collectionViewLayout = collLayout
        
        btnCancel.layer.cornerRadius = 27.5
        btnCancel.layer.masksToBounds = true
        
        viewSearch.layer.borderColor = UIColor(hexString: "#00FFFF").cgColor
        viewSearch.layer.borderWidth = 1
        viewSearch.layer.cornerRadius = 20
        
        if(language == "en"){
            txtSearch.attributedPlaceholder = NSAttributedString(string: "Search here...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            array = arrayEn
        }
        else {
            txtSearch.attributedPlaceholder = NSAttributedString(string: "אחר.....", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            array = arrayHe
        }
        
        collArray = array
        
        txtSearch.delegate = self
        txtSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.occupationTapped(_:)))
        viewOccupation.addGestureRecognizer(tap3)
        
    }
    
    
    @objc func occupationTapped(_ sender: UITapGestureRecognizer? = nil) {
        if btnBack.isHidden == false {
            labelOccupationLeftConstraint.constant = 0
            btnBack.isHidden = true
            isParentArray = true
            UIView.animate(withDuration: 0.5, animations:{
                self.view.layoutIfNeeded()
            })
            
            UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                //Do the data reload here
                self.collArray = self.array
                self.collectionView.reloadData()
            }, completion: nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if txtSearch.text == "" {
            self.searchActive = false
        }
        else {
            self.searchActive = true
        }
        collectionView.reloadData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        labelOccupationLeftConstraint.constant = 0
        btnBack.isHidden = true
        isParentArray = true
        UIView.animate(withDuration: 0.5, animations:{
            self.view.layoutIfNeeded()
        })
        
        UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            //Do the data reload here
            self.collArray = self.array
            self.collectionView.reloadData()
        }, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        delegate.select(name: "", type: "occupation", id: "", parentId: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

//MARK:- TableView

extension SelectOccupationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive == true {
            return filtered.count
        }
        else {
            return collArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "occupationCell", for: indexPath) as! OccupationCell
        
        if searchActive {
            cell.labelName.text = filtered[indexPath.row].name
            cell.imgView.image = filtered[indexPath.row].icon
            
            if filtered[indexPath.row].selected {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#FF698C").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
            
        }
        else {
            
            cell.labelName.text = collArray[indexPath.row].name
            cell.imgView.image = collArray[indexPath.row].icon
            
            if collArray[indexPath.row].selected{
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#FF698C").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !isParentArray {
            searchActive = false
            txtSearch.resignFirstResponder()
            txtSearch.text = ""
            setSelected(number: indexPath.row)
            return
        }
        
        parentSelected = indexPath.row
        
        labelOccupationLeftConstraint.constant = 20
        btnBack.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations:{
            self.view.layoutIfNeeded()
        })
        
        if(searchActive){
            searchActive = false
            txtSearch.resignFirstResponder()
            txtSearch.text = ""
            setSearchSelected(number: indexPath.row)
        }
        else {
            loadArray(number: array[indexPath.row].id)
        }
        
        isParentArray = false
    }
    
    func setSearchSelected(number: Int){
        delegate.select(name: filtered[number].name, type: "occupation", id: "\(filtered[number].id)", parentId: "\(filtered[number].parentId!)")
       }
    
    
    func setSelected(number: Int){
        delegate.select(name: collArray[number].name, type: "occupation", id: "\(collArray[number].id)", parentId: "\(collArray[number].parentId!)")
    }
    
    func loadArray(number: Int){
        UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            //Technology
            if number == 0 {
                self.collArray = OccupationArrays.computerNames()
            }//Repairs
            else if number == 1 {
                self.collArray = OccupationArrays.repairNames()
            }//Repairs
            else if number == 2 {
                self.collArray = OccupationArrays.restaurantNames()
            }//Security
            else if number == 3 {
                self.collArray = OccupationArrays.securityNames()
            }//Teaching
            else if number == 4 {
                self.collArray = OccupationArrays.teachingNames()
            }//Communication
            else if number == 5 {
                self.collArray = OccupationArrays.communcationNames()
            }//Medicine
            else if number == 6 {
                self.collArray = OccupationArrays.medicineNames()
            }//Humanities
            else if number == 7 {
                self.collArray = OccupationArrays.humanityNames()
            }//Design
            else if number == 8 {
                self.collArray = OccupationArrays.designNames()
            }//Engineering
            else if number == 9 {
                self.collArray = OccupationArrays.engineerNames()
            }//Finance
            else if number == 10 {
                self.collArray = OccupationArrays.financeNames()
            }//Law
            else if number == 11 {
                self.collArray = OccupationArrays.lawNames()
            }//General Professions
            else if number == 12 {
                self.collArray = OccupationArrays.generalProfessions()
            }//Aviation
            else if number == 13 {
                self.collArray = OccupationArrays.aviationNames()
            }//Insurance
            else if number == 14 {
                self.collArray = OccupationArrays.insuranceNames()
            }//Forwarding
            else if number == 15 {
                self.collArray = OccupationArrays.forwardingNames()
            }//Transportation
            else if number == 16 {
                self.collArray = OccupationArrays.transportationNames()
            }//Bulding
            else if number == 17 {
                self.collArray = OccupationArrays.buildingNames()
            }//Care and fashion
            else if number == 18 {
                self.collArray = OccupationArrays.careNames()
            }//Warehouse
            else if number == 19 {
                self.collArray = OccupationArrays.warehouseNames()
            }//Cleaning
            else if number == 20 {
                self.collArray = OccupationArrays.cleaningNames()
            }//Tourism
            else if number == 21 {
                self.collArray = OccupationArrays.tourismNames()
            }//Vehicle Names
            else if number == 22 {
                self.collArray = OccupationArrays.vehicleNames()
            }//Nature and Environmental
            else if number == 23 {
                self.collArray = OccupationArrays.natureNames()
            }//Electricty
            else if number == 24 {
                self.collArray = OccupationArrays.electricityNames()
            }//Water
            else if number == 25 {
                self.collArray = OccupationArrays.waterNames()
            }//Agriculture
            else if number == 26 {
                self.collArray = OccupationArrays.agricultureNames()
            }//Sport
            else if number == 27 {
                self.collArray = OccupationArrays.sportNames()
            }//Culture
            else if number == 28 {
                self.collArray = OccupationArrays.cultureAndEntertainmentNames()
            }//Welfare
            else if number == 29 {
                self.collArray = OccupationArrays.welfareNames()
            }//General Management
            else if number == 30 {
                self.collArray = OccupationArrays.generalManagementNames()
            }//Sales
            else if number == 31 {
                self.collArray = OccupationArrays.salesNames()
            }//Religion
            else if number == 32 {
                self.collArray = OccupationArrays.religionNames()
            }//Exact Sciences
            else if number == 33 {
                self.collArray = OccupationArrays.exactScienceNames()
            }//Governmental
            else if number == 34 {
                self.collArray = OccupationArrays.governmentalNames()
            }//Shop
            else if number == 35 {
                self.collArray = OccupationArrays.shopNames()
            }//Food and Pharma
            else if number == 36 {
                self.collArray = OccupationArrays.foodAndPharmaNames()
            }//Lab
            else if number == 37 {
                self.collArray = OccupationArrays.labNames()
            }
            
            self.collectionView.reloadData()
            
        }, completion: nil)
    }
}



//MARK:- TEXT FIELD

extension SelectOccupationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearch.resignFirstResponder()
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //input text
        let searchText  = textField.text! + string
        //add matching text to arryays
        filtered = OccupationArrays.allNames().filter({(($0.name).localizedCaseInsensitiveContains(searchText))})
        
        
        return true
    }
    
}




//MARK:- SELECT Occupation PROTOCOL
protocol isOccupationSelected {
    func select(name: String, type: String, id: String, parentId: String)  //data: string is an example parameter
}


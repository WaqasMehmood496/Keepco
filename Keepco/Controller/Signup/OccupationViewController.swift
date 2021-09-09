//
//  OccupationViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class OccupationViewController: UIViewController {
    
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var labelOccupationLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelSelected: UILabel!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewOccupation: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var btnDeselect: UIButton!
    
    var user: User!
    var image: Data!
    
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
    var selectedArray = [Occupation]()
    var selectedParent = [String]()
    
    var collArray = [Occupation]()
    var filtered:[Occupation] = []
    var collLayout: OccupationFlowLayout!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewTop: UIView!
    
    var searchActive = false
    var isParentArray = true
    var fromController: String!
    var parentSelected = 0
    var isSelectedShown = false
    var occupations = ""
    var subOccupations = ""
    
    
    
    //If view occupation is showing back button go back, else show selected occupations
    //Also change border of collectionview when showing selected
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collLayout = OccupationFlowLayout()
        self.collectionView.collectionViewLayout = collLayout
        
        btnNext.layer.cornerRadius = 7
        btnNext.layer.masksToBounds = true
        
        viewSearch.layer.cornerRadius = 7
        
        btnDeselect.layer.cornerRadius = 7
        btnDeselect.layer.borderWidth = 1
        btnDeselect.layer.borderColor = UIColor(hexString: "#FF698C").cgColor
        
        viewOccupation.layer.cornerRadius = 7
        viewOccupation.layer.borderColor = UIColor(hexString: "#A6A8AB").cgColor
        viewOccupation.layer.borderWidth = 1
        
        
        if(language == "en"){
            txtSearch.attributedPlaceholder = NSAttributedString(string: "Search your occupation", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            array = arrayEn
        }
        else {
            txtSearch.attributedPlaceholder = NSAttributedString(string: "חפש את העיסוק שלך", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            array = arrayHe
        }
        
        collArray = array

        txtSearch.delegate = self
        txtSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        
        if fromController == "edit"{
            btnNext.setTitle("UPDATE", for: .normal)
        }
  
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.occupationTapped(_:)))
        viewOccupation.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap4)
        
    }
    
    
    @objc func contactTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
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
    
    @objc func occupationTapped(_ sender: UITapGestureRecognizer? = nil) {
        if btnBack.isHidden == false {
            labelOccupationLeftConstraint.constant = 9
            btnBack.isHidden = true
            isParentArray = true
            btnNext.isHidden = false
            isSelectedShown = false
            UIView.animate(withDuration: 0.5, animations:{
                self.view.layoutIfNeeded()
            })
            
            collectionView.layer.borderColor = UIColor(hexString: "#FF698C").cgColor
            collectionView.layer.borderWidth = 1
            
            UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                //Do the data reload here
                self.collArray = self.array
                self.collectionView.reloadData()
            }, completion: nil)
        }
        else if selectedArray.count > 0 {
            var sArray = [Occupation]()
            
            for item in selectedArray {
                for i2 in OccupationArrays.allNames() {
                    if item.name == i2.name {
                        i2.selected = true
                        sArray.append(i2)
                    }
                }
            }
            
            collectionView.layer.borderColor = UIColor.white.cgColor
            collectionView.layer.borderWidth = 0
            
            collArray = sArray
            self.collectionView.reloadData()
            labelOccupationLeftConstraint.constant = 20
            btnBack.isHidden = false
            btnNext.isHidden = true
            isSelectedShown = true
            
            UIView.animate(withDuration: 0.5, animations:{
                self.view.layoutIfNeeded()
            })
               
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
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
    @IBAction func goBack(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToPrevious(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func deselectPressed(_ sender: Any) {
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        for item in selectedArray {
            if occupations.isEmpty {
                occupations = occupations + "\(item.parentId!)"
                subOccupations = subOccupations + "\(item.id)"
            }
            else {
                occupations = occupations + "," + "\(item.parentId!)"
                subOccupations = subOccupations + "," + "\(item.id)"
            }
        }
        
        
        if fromController == "edit"{
            self.dismiss(animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "toFun", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFun" {
            let vc = segue.destination as! FunViewController
            vc.user = user
            vc.image = image
            vc.occupations = occupations
            vc.subOccupations = subOccupations
            vc.fromController = "signup"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
    }
    
}

//MARK:- TableView

extension OccupationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
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
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#1fe2e2").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
            
            if selectedArray.contains(where: { $0.name == filtered[indexPath.row].name }) {
                // found
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#1fe2e2").cgColor
                cell.viewBorder.layer.borderWidth = 2
                cell.viewBorder.layer.cornerRadius = 7
            } else {
                 // not
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
//            if selectedArray.contains(filtered[indexPath.row].name){
//
//            }
//            else {
//
//            }
            
            
        }
        else {
        
            cell.labelName.text = collArray[indexPath.row].name
            cell.imgView.image = collArray[indexPath.row].icon
            
            if collArray[indexPath.row].selected{
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#23d6d6").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
            if selectedArray.contains(where: { $0.name == collArray[indexPath.row].name }) {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#23d6d6").cgColor
                cell.viewBorder.layer.borderWidth = 2
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
            if isParentArray && !isSelectedShown {
            
                if selectedParent.contains(array[indexPath.row].name){
                    cell.viewBorder.layer.borderColor = UIColor(hexString: "#23d6d6").cgColor
                    cell.viewBorder.layer.borderWidth = 2
                    cell.viewBorder.layer.cornerRadius = 7
                }
                else {
                    cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                    cell.viewBorder.layer.borderWidth = 0.4
                    cell.viewBorder.layer.cornerRadius = 7
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isSelectedShown {
            if !selectedArray.contains(where: { $0.name == collArray[indexPath.row].name }) {
//            if !selectedArray.contains(collArray[indexPath.row].name) {
                selectedArray.append(collArray[indexPath.row])
                if !selectedParent.contains(array[parentSelected].name){
                    selectedParent.append(array[parentSelected].name)
                }
            }
            else {
                selectedArray = selectedArray.filter { $0.name != collArray[indexPath.row].name }
                checkParentArray()
            }
            setLabelSelected()
            self.collectionView.reloadData()
            return
        }
        else if !isParentArray {
            if !selectedArray.contains(where: { $0.name == collArray[indexPath.row].name }) {
                selectedArray.append(collArray[indexPath.row])
                if !selectedParent.contains(array[parentSelected].name){
                    selectedParent.append(array[parentSelected].name)
                }
            }
            else {
                selectedArray = selectedArray.filter { $0.name != collArray[indexPath.row].name }
                checkParentArray()
            }
            setLabelSelected()
            setSelected(number: indexPath.row)
            return
        }
        else if searchActive {
            if !selectedArray.contains(where: { $0.name == filtered[indexPath.row].name }) {
                selectedArray.append(filtered[indexPath.row])
            }
            else {
                selectedArray = selectedArray.filter { $0.name != filtered[indexPath.row].name }
            }
            setLabelSelected()
            searchActive = false
            txtSearch.resignFirstResponder()
            txtSearch.text = ""
            setSelected(number: indexPath.row)
            return
        }
        
        parentSelected = indexPath.row
        
        labelOccupationLeftConstraint.constant = 20
        btnBack.isHidden = false
//        viewAlsoWorking.isHidden = false
        btnNext.isHidden = true
        
        UIView.animate(withDuration: 0.5, animations:{
            self.view.layoutIfNeeded()
        })
        
        if(searchActive){
            searchActive = false
            txtSearch.resignFirstResponder()
            txtSearch.text = ""
        }
        else {
            loadArray(number: array[indexPath.row].id)
        }
        
        isParentArray = false
    }
    
    func checkParentArray(){
        let number = array[parentSelected].id
        var tempArray = [Occupation]()
        
        if number == 0 {
            tempArray = OccupationArrays.computerNames()
        }//Repairs
        else if number == 1 {
            tempArray = OccupationArrays.repairNames()
        }//Repairs
        else if number == 2 {
            tempArray = OccupationArrays.restaurantNames()
        }//Security
        else if number == 3 {
            tempArray = OccupationArrays.securityNames()
        }//Teaching
        else if number == 4 {
            tempArray = OccupationArrays.teachingNames()
        }//Communication
        else if number == 5 {
            tempArray = OccupationArrays.communcationNames()
        }//Medicine
        else if number == 6 {
            tempArray = OccupationArrays.medicineNames()
        }//Humanities
        else if number == 7 {
            tempArray = OccupationArrays.humanityNames()
        }//Design
        else if number == 8 {
            tempArray = OccupationArrays.designNames()
        }//Engineering
        else if number == 9 {
            tempArray = OccupationArrays.engineerNames()
        }//Finance
        else if number == 10 {
            tempArray = OccupationArrays.financeNames()
        }//Law
        else if number == 11 {
            tempArray = OccupationArrays.lawNames()
        }
        
        var tempArrayString = [String]()
        for item in tempArray {
            tempArrayString.append(item.name)
        }
        
        var available = false
        
        for item in selectedArray {
            for i2 in tempArrayString {
                if item.name == i2 {
                    available = true
                    break
                }
            }
        }
        
        
        if selectedArray.count == 0 {
            self.selectedParent.removeAll()
        }
        else if !available {
            selectedParent = selectedParent.filter { $0 != array[parentSelected].name }
        }
        
    }
    
    func setSelected(number: Int){
        
//        self.array[parentSelected].selected = true
        
        labelOccupationLeftConstraint.constant = 9
        btnBack.isHidden = true
        isParentArray = true
        btnNext.isHidden = false
        UIView.animate(withDuration: 0.5, animations:{
            self.view.layoutIfNeeded()
        })
        
        UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            //Do the data reload here
            self.collArray = self.array
            self.collectionView.reloadData()
        }, completion: nil)
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
    
    func setLabelSelected(){
        if selectedArray.count == 0 {
            labelSelected.isHidden = true
        }
        else {
            labelSelected.isHidden = false
            if(language == "en"){
                labelSelected.text = "\(selectedArray.count) Occupations Selected"
            }
            else {
                labelSelected.text = "עיסוקים \(selectedArray.count) נבחר"
            }
        }
    }
}



//MARK:- TEXT FIELD

extension OccupationViewController: UITextFieldDelegate {
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




//
//  AddFunViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class AddFunViewController: UIViewController {

    @IBOutlet weak var collectionBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBackBottom: UIButton!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var labelFunLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewBottomHConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelSelected: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewFun: UIView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var viewProgress: UIView!
    
    
    var user: User!
    var user_id: String!
    var image: Data!
    var occupations: String!
    var subOccupations: String!
    
    var selectedArray = [Fun]()
    var selectedParent = [String]()
    var collArray = [Fun]()
    var filtered:[Fun] = []
    var collLayout: OccupationFlowLayout!
    var isParentArray = true
    var searchActive = false
    var fromController: String!
    var parentSelected = 0
    var isSelectedShown = false
    var funs = ""
    var subFuns = ""
    var delegate: AddFunDelegate!
    let REGISTER_URL = Config.BASE_URL + "edit_profile";

    
    var array = [Fun]()
    let arrayEn: [Fun] = [Fun(id: 0, name: "Dance", icon: UIImage(named: "ic_dance")!, selected: false),
                          Fun(id: 1, name: "Team Sports", icon: UIImage(named: "ic_team_sports")!, selected: false),
                          Fun(id: 2, name: "Unique Sports", icon: UIImage(named: "ic_unique_sports")!, selected: false),
                          Fun(id: 3, name: "Gaming", icon: UIImage(named: "ic_gaming")!, selected: false),
                          Fun(id: 4, name: "Culture", icon: UIImage(named: "ic_culture")!, selected: false),
                          Fun(id: 5, name: "Food", icon: UIImage(named: "ic_food")!, selected: false),
                          Fun(id: 6, name: "Fashion", icon: UIImage(named: "ic_fashion")!, selected: false),
                          Fun(id: 7, name: "Trips", icon: UIImage(named: "ic_trips")!, selected: false),
                          Fun(id: 8, name: "Thinking", icon: UIImage(named: "ic_thinking")!, selected: false),
                          Fun(id: 9, name: "Handymen", icon: UIImage(named: "ic_handymen")!, selected: false),
                          Fun(id: 10, name: "Arts & Skills", icon: UIImage(named: "ic_arts")!, selected: false),
                          Fun(id: 11, name: "HandiCraft", icon: UIImage(named: "ic_handicraft")!, selected: false)]
    let arrayHe: [Fun] = [Fun(id: 0, name: "ריקוד", icon: UIImage(named: "ic_dance")!, selected: false),
    Fun(id: 1, name: "ספורט קבוצתי", icon: UIImage(named: "ic_team_sports")!, selected: false),
    Fun(id: 2, name: "ספורט יחידני", icon: UIImage(named: "ic_unique_sports")!, selected: false),
    Fun(id: 3, name: "גיימינג", icon: UIImage(named: "ic_gaming")!, selected: false),
    Fun(id: 4, name: "תרבות", icon: UIImage(named: "ic_culture")!, selected: false),
    Fun(id: 5, name: "אוכל", icon: UIImage(named: "ic_food")!, selected: false),
    Fun(id: 6, name: "אופנה", icon: UIImage(named: "ic_fashion")!, selected: false),
    Fun(id: 7, name: "טיולים", icon: UIImage(named: "ic_trips")!, selected: false),
    Fun(id: 8, name: "חשיבה", icon: UIImage(named: "ic_thinking")!, selected: false),
    Fun(id: 9, name: "הנדימן", icon: UIImage(named: "ic_handymen")!, selected: false),
    Fun(id: 10, name: "אומנות", icon: UIImage(named: "ic_arts")!, selected: false),
    Fun(id: 11, name: "מלאכת יד", icon: UIImage(named: "ic_handicraft")!, selected: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetails()
        
        
        collLayout = OccupationFlowLayout()
        self.collectionView.collectionViewLayout = collLayout
        
        btnNext.layer.cornerRadius = 27.5
        btnNext.layer.masksToBounds = true
        
        btnBackBottom.layer.cornerRadius = 27.5
        btnBackBottom.layer.masksToBounds = true
        
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.funTapped(_:)))
        viewFun.addGestureRecognizer(tap3)
        
        if fromController == "edit"{
            if(language == "en"){
                btnNext.setTitle("UPDATE", for: .normal)
            }
            else {
                btnNext.setTitle("עדכון", for: .normal)
            }
        }
        
        
        if(selectedArray.count > 0){
            if(language == "en"){
                labelSelected.text = "\(selectedArray.count) Selected"
            }
            else {
                labelSelected.text = "נבחר \(selectedArray.count)"
            }
            labelSelected.isHidden = false
        }
        
    }
    
    func getDetails(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
    }
    
    
    @objc func funTapped(_ sender: UITapGestureRecognizer? = nil) {
        if btnBack.isHidden == false {
            labelFunLeftConstraint.constant = 0
            collectionBottomConstraint.constant = 20
            
            btnBack.isHidden = true
            isParentArray = true
            btnNext.isHidden = false
            btnBackBottom.isHidden = false
            isSelectedShown = false
            UIView.animate(withDuration: 0.5, animations:{
                self.view.layoutIfNeeded()
            })
            
            UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                //Do the data reload here
                self.collArray = self.array
                self.collectionView.reloadData()
            }, completion: nil)
        }
        else if selectedArray.count > 0 {
            var sArray = [Fun]()
            
            for item in selectedArray {
                for i2 in FunArrays.allNames() {
                    if item.name == i2.name {
                        i2.selected = true
                        sArray.append(i2)
                    }
                }
            }
            collArray = sArray
            self.collectionView.reloadData()
            labelFunLeftConstraint.constant = 20
            btnBack.isHidden = false
            btnNext.isHidden = true
            btnBackBottom.isHidden = true
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
    
    @objc func keyboardWillAppear() {
        //Do something here
        viewBottomHConstraint.constant = self.collectionView.frame.height - 80
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillDisappear() {
        //Do something here
        viewBottomHConstraint.constant = 274
        self.view.layoutIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    

    @IBAction func cancelPressed(_ sender: Any) {
        self.delegate.closePressed(isUpdated: false)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        labelFunLeftConstraint.constant = 0
        collectionBottomConstraint.constant = 20
        
        isSelectedShown = false
        btnBack.isHidden = true
        isParentArray = true
        btnNext.isHidden = false
        btnBackBottom.isHidden = false
        UIView.animate(withDuration: 0.5, animations:{
            self.view.layoutIfNeeded()
        })
        
        UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            //Do the data reload here
            self.collArray = self.array
            self.collectionView.reloadData()
        }, completion: nil)
    }
    

    @IBAction func finishPressed(_ sender: Any) {
        for item in selectedArray {
            if funs.isEmpty {
                funs = funs + "\(item.parentId)"
                subFuns = subFuns + "\(item.id)"
            }
            else {
                funs = funs + "," + "\(item.parentId)"
                subFuns = subFuns + "," + "\(item.id)"
            }
        }
        
        update()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toPhone"){
            let controller = segue.destination as! PhoneViewController
            controller.user = user
            controller.image = image
            controller.occupations = occupations
            controller.subOccupations = subOccupations
            controller.funs = funs
            controller.subFuns = subFuns
        }
    }
       
       
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
       }
    
    func update(){
        self.indicator.startAnimating()
        self.viewProgress.isHidden = false
        
        let parameters: [String: Any] = ["fun_id": funs ?? "",
                                         "subfun_id": subFuns ?? "",
                                         "user_id": user_id ?? ""]
        
        print(parameters)
        
        AF.request(REGISTER_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        if(language == "en"){
                            self.view.makeToast("Funs Updated")
                        }
                        else {
                            self.view.makeToast("כיף עודכן")
                        }
                        self.savePreferences()
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("Failed to update fun. Please try again")
                        }
                        else {
                            self.view.makeToast("עדכון הכיף נכשל. בבקשה נסה שוב")
                        }
                    }
                    
                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true
                    break
                    
                case .failure(let error):
                    print(error)
                    self.viewProgress.isHidden = true
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
    
    func savePreferences(){
        let defaults = UserDefaults.standard
        
        defaults.set(funs, forKey: Config.FUNS)
        defaults.set(subFuns, forKey: Config.SUB_FUNS)
        defaults.synchronize()
    
        self.delegate.closePressed(isUpdated: true)

    }

}


//MARK:- TableView

extension AddFunViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
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
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#23d6d6").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
            if selectedArray.contains(where: { $0.name == filtered[indexPath.row].name }){
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
        else {
            
            cell.labelName.text = collArray[indexPath.row].name
            cell.imgView.image = collArray[indexPath.row].icon
            
            if collArray[indexPath.row].selected {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#23d6d6").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            else {
                cell.viewBorder.layer.borderColor = UIColor(hexString: "#343997").cgColor
                cell.viewBorder.layer.borderWidth = 0.4
                cell.viewBorder.layer.cornerRadius = 7
            }
            
            if selectedArray.contains(where: { $0.name == collArray[indexPath.row].name }){
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
            if !selectedArray.contains(where: { $0.name == collArray[indexPath.row].name }){
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
            setSelected(number: indexPath.row)
            setLabelSelected()
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
        
        if(searchActive){
            searchActive = false
            txtSearch.resignFirstResponder()
            txtSearch.text = ""
            loadArray(number: filtered[indexPath.row].id)
//            setFields(number: filtered[indexPath.row].id)
            setConstraints(number: filtered[indexPath.row].id)
        }
        else {
            loadArray(number: array[indexPath.row].id)
//            setFields(number: array[indexPath.row].id)
            setConstraints(number: array[indexPath.row].id)
        }
        isParentArray = false
    }
    
    func checkParentArray(){
           let number = array[parentSelected].id
           var tempArray = [Fun]()
           
           if(number == 0){
               tempArray = FunArrays.danceNames()
           }
           else if number == 1 {
               tempArray = FunArrays.teamSportsNames()
           }
           else if number == 2 {
               tempArray = FunArrays.uniqueSportsNames()
           }
           else if number == 3 {
               tempArray = FunArrays.gamingNames()
           }
           else if number == 4 {
               tempArray = FunArrays.cultureNames()
           }
           else if number == 5 {
               tempArray = FunArrays.cookingNames()
           }
           else if number == 6 {
               tempArray = FunArrays.fashionNames()
           }
           else if number == 7 {
               tempArray = FunArrays.tripsNames()
           }
           else if number == 8 {
               tempArray = FunArrays.thinkingNames()
           }
           else if number == 9 {
               tempArray = FunArrays.handymenNames()
           }
           else if number == 10 {
               tempArray = FunArrays.artsAndSkillsNames()
           }
           else {
               tempArray = FunArrays.handiCraft()
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
           if !available {
               selectedParent = selectedParent.filter { $0 != array[parentSelected].name }
           }
           
       }
    
    func setConstraints(number: Int){
        labelFunLeftConstraint.constant = 20
        btnBack.isHidden = false
                
        UIView.animate(withDuration: 0.5, animations:{
            self.view.layoutIfNeeded()
        })
               
    }
    
    func setSelected(number: Int){
        
//        self.array[parentSelected].selected = true
        
        labelFunLeftConstraint.constant = 0
        collectionBottomConstraint.constant = 20
        
        
        btnBack.isHidden = true
        isParentArray = true
        btnNext.isHidden = false
        btnBackBottom.isHidden = false
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
            if(number == 0){
                self.collArray = FunArrays.danceNames()
            }
            else if number == 1 {
                self.collArray = FunArrays.teamSportsNames()
            }
            else if number == 2 {
                self.collArray = FunArrays.uniqueSportsNames()
            }
            else if number == 3 {
                self.collArray = FunArrays.gamingNames()
            }
            else if number == 4 {
                self.collArray = FunArrays.cultureNames()
            }
            else if number == 5 {
                self.collArray = FunArrays.cookingNames()
            }
            else if number == 6 {
                self.collArray = FunArrays.fashionNames()
            }
            else if number == 7 {
                self.collArray = FunArrays.tripsNames()
            }
            else if number == 8 {
                self.collArray = FunArrays.thinkingNames()
            }
            else if number == 9 {
                self.collArray = FunArrays.handymenNames()
            }
            else if number == 10 {
                self.collArray = FunArrays.artsAndSkillsNames()
            }
            else {
                self.collArray = FunArrays.handiCraft()
            }
            self.collectionView.reloadData()
        }, completion: nil)
        
        isParentArray = false

    }
 

        
        func setLabelSelected(){
            if selectedArray.count == 0 {
                labelSelected.isHidden = true
            }
            else {
                labelSelected.isHidden = false
                if(language == "en"){
                    labelSelected.text = "\(selectedArray.count) Selected"
                }
                else {
                    labelSelected.text = "נבחר \(selectedArray.count)"
                }
            }
        }
}


//MARK:- TEXT FIELD

extension AddFunViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearch.resignFirstResponder()
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //input text
        let searchText  = textField.text! + string
        //add matching text to arryays
        filtered = FunArrays.allNames().filter({(($0.name).localizedCaseInsensitiveContains(searchText))})
        
        
        
        return true
    }
    
}



//MARK:- Protocol
protocol AddFunDelegate {
    func closePressed(isUpdated: Bool)
}

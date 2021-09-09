//
//  SelectFunViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/29/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class SelectFunViewController: UIViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewOccupation: UIView!
    @IBOutlet weak var labelFunLeftConstraint: NSLayoutConstraint!
    
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
    
    var delegate: isOccupationSelected!
    
    var collArray = [Fun]()
    var filtered:[Fun] = []
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
            labelFunLeftConstraint.constant = 0
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
        
        labelFunLeftConstraint.constant = 0
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
        delegate.select(name: "", type: "fun", id: "", parentId: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

//MARK:- TableView

extension SelectFunViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
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
        
        labelFunLeftConstraint.constant = 20
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
        delegate.select(name: filtered[number].name, type: "fun", id: "\(filtered[number].id)", parentId: "\(filtered[number].parentId)")
    }
    
    
    func setSelected(number: Int){
        delegate.select(name: collArray[number].name, type: "fun", id: "\(collArray[number].id)", parentId: "\(collArray[number].parentId)")
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
}



//MARK:- TEXT FIELD

extension SelectFunViewController: UITextFieldDelegate {
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




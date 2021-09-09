//
//  FunViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class FunViewController: UIViewController {

//    @IBOutlet weak var viewBottomConstraint: KeyboardLayoutConstraint!
    @IBOutlet weak var collectionBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var labelFunLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelSelected: UILabel!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewFun: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var btnDeselect: UIButton!
    var user: User!
    var image: Data!
    var occupations: String!
    var subOccupations: String!
    
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
    
    var selectedArray = [Fun]()
    var selectedParent = [String]()
    var collArray = [Fun]()
    var filtered:[Fun] = []
    var collLayout: OccupationFlowLayout!
    @IBOutlet weak var btnBack: UIButton!
    var isParentArray = true
    var searchActive = false
    @IBOutlet weak var viewTop: UIView!
    var fromController: String!
    var parentSelected = 0
    var isSelectedShown = false
    var funs = ""
    var subFuns = ""
    
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
        
        viewFun.layer.cornerRadius = 7
        viewFun.layer.borderColor = UIColor(hexString: "#A6A8AB").cgColor
        viewFun.layer.borderWidth = 1
        
        if(language == "en"){
            txtSearch.attributedPlaceholder = NSAttributedString(string: "Search your fun", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            array = arrayEn
            
        }
        else {
            txtSearch.attributedPlaceholder = NSAttributedString(string: "חפש בכיף שלך", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            array = arrayHe
        }
        collArray = array

        
        txtSearch.delegate = self
        txtSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        if fromController == "edit"{
            btnNext.setTitle("UPDATE", for: .normal)
        }
 
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.funTapped(_:)))
        viewFun.addGestureRecognizer(tap3)
        
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
    
    
    @objc func funTapped(_ sender: UITapGestureRecognizer? = nil) {
        if btnBack.isHidden == false {
            labelFunLeftConstraint.constant = 9
            collectionBottomConstraint.constant = 20
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
            var sArray = [Fun]()
            
            for item in selectedArray {
                for i2 in FunArrays.allNames() {
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
            labelFunLeftConstraint.constant = 20
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
    
    @objc func keyboardWillAppear() {
        //Do something here
//        viewBottomHConstraint.constant = self.collectionView.frame.height - 80
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillDisappear() {
        //Do something here
//        viewBottomHConstraint.constant = 274
        self.view.layoutIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
    
    @IBAction func deselectPressed(_ sender: Any) {
    }
    
    @IBAction func backPressed(_ sender: Any) {
        labelFunLeftConstraint.constant = 9
        collectionBottomConstraint.constant = 20
//        viewBottomConstraint.constant = 0

        isSelectedShown = false
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
       
    @IBAction func goToPrevious(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextPressed(_ sender: Any) {
        
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
        
        
        if fromController == "edit"{
            self.dismiss(animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "toPhone", sender: nil)
        }
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
        viewTop.animHide()
       }

}


//MARK:- TableView

extension FunViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
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
            setConstraints(number: filtered[indexPath.row].id)
        }
        else {
            loadArray(number: array[indexPath.row].id)
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
//        viewBottomConstraint.constant = 0
        
        
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
                labelSelected.text = "\(selectedArray.count) Fun Selected"
            }
            else {
                labelSelected.text = "כיפים \(selectedArray.count) נבחר"
            }
        }
    }
}


//MARK:- TEXT FIELD

extension FunViewController: UITextFieldDelegate {
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

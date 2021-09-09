//
//  MyFunboardViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/1/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyFunboardViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var btnManage: UIButton!
    @IBOutlet weak var btnAddFuns: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var collLayout: MyFunboardLayout!
    var isManage = false
    var array = [Fun]()
    var answersArray = [Fun]()
    var manageBoard: AddFunViewController!
    var parentsArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnManage.layer.cornerRadius = 27.5
        btnManage.layer.masksToBounds = true
        
        btnAddFuns.layer.cornerRadius = 10
        
        btnSave.layer.cornerRadius = 27.5
        btnSave.layer.masksToBounds = true
        btnSave.layer.borderColor = UIColor(hexString: "#343997").cgColor
        btnSave.layer.borderWidth = 1
        
        
        collLayout = MyFunboardLayout()
        self.collectionView.collectionViewLayout = collLayout
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDetails()
    }
    
    func getDetails(){
        var funs = UserDefaults.standard.string(forKey: Config.FUNS) ?? ""
        var subFuns = UserDefaults.standard.string(forKey: Config.SUB_FUNS) ?? ""
        let answers = UserDefaults.standard.string(forKey: "funAnswers") ?? ""
        
        
        answersArray.removeAll()
        array.removeAll()
        
        let json = JSON.init(parseJSON: answers)
        
        let answersList = json.arrayValue
        
        
        for item in answersList {
            let answer1 = Answer(question_id: "1", answer: item["answer1"].stringValue)
            let answer2 = Answer(question_id: "2", answer: item["answer2"].stringValue)
            let answer3 = Answer(question_id: "3", answer: item["answer3"].stringValue)
            
            let answers = [answer1, answer2, answer3]
            
            let fun = Fun(id: item["subfun_id"].intValue, parentId: item["parent_id"].intValue, answers: answers, selected: true)
            answersArray.append(fun)
        }
        
        
        funs = funs.replacingOccurrences(of: " ", with: "")
        subFuns = subFuns.replacingOccurrences(of: " ", with: "")
        
        
        let arr = funs.components(separatedBy: ",")
        let subArr = subFuns.components(separatedBy: ",")
        
        if(arr.count == 0){
            return
        }
        else if(arr.count == 1){
            addChild(funId: funs.trimmingCharacters(in: .whitespaces), subId: subFuns.trimmingCharacters(in: .whitespaces))
        }
        else {
            for (index, item) in arr.enumerated() {
                addChild(funId: item, subId: subArr[index])
            }
        }
        
        collectionView.reloadData()
    }
    
    func addChild(funId: String, subId: String){
        let number = Int(funId)
        let child = Int(subId)
        
        var funArray = [Fun]()
        
        var parent = ""
        
        if(number == 0){
            funArray = FunArrays.danceNames()
            parent = "Dance"
        }
        else if number == 1 {
            funArray = FunArrays.teamSportsNames()
            parent = "Team Sports"
        }
        else if number == 2 {
            funArray = FunArrays.uniqueSportsNames()
            parent = "Unique Sports"
        }
        else if number == 3 {
            funArray = FunArrays.gamingNames()
            parent = "Gaming"
        }
        else if number == 4 {
            funArray = FunArrays.cultureNames()
            parent = "Culture"
        }
        else if number == 5 {
            funArray = FunArrays.cookingNames()
            parent = "Food"
        }
        else if number == 6 {
            funArray = FunArrays.fashionNames()
            parent = "Fashion"
        }
        else if number == 7 {
            funArray = FunArrays.tripsNames()
            parent = "Trips"
        }
        else if number == 8 {
            funArray = FunArrays.thinkingNames()
            parent = "Thinking"
        }
        else if number == 9 {
            funArray = FunArrays.handymenNames()
            parent = "Handymen"
        }
        else if number == 10 {
            funArray = FunArrays.artsAndSkillsNames()
            parent = "Arts & Skills"
        }
        else {
            funArray = FunArrays.handiCraft()
            parent = "HandiCraft"
        }
        
        
        if(!parentsArray.contains(parent)){
            parentsArray.append(parent)
        }
        
        
        let defAnswers = [Answer(question_id: "1", answer: ""), Answer(question_id: "2", answer: ""), Answer(question_id: "3", answer: "")]
        
        
        for (i, item) in funArray.enumerated() {
            
            if item.id == child {
                
                var isAdded = false
                
                
                for item2 in answersArray {
                    
                    if(item2.id == child && item2.parentId == number){
                        item.answers = item2.answers
                        isAdded = true
                    }
                }
                
              
                if(!isAdded){
                    item.answers = defAnswers
                }
                
                item.selected = true
                self.array.append(item)
            }
        }
        
        
    }
       
    
    override func viewDidLayoutSubviews() {
        var height = collectionView.collectionViewLayout.collectionViewContentSize.height
        heightConstraint.constant = height
    }
    
    @IBAction func menuPressed(_ sender: Any) {
//        viewTop.animShow()
    }

    @IBAction func managePressed(_ sender: Any) {
        isManage = true
        
        self.btnManage.isHidden = true
        self.btnAddFuns.isHidden = false
        self.btnSave.isHidden = false
        
        self.collectionView.reloadData()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        manageBoard = storyboard.instantiateViewController(withIdentifier: "AddFunViewController") as! AddFunViewController
        manageBoard.selectedArray = array
        manageBoard.selectedParent = parentsArray
        manageBoard.delegate = self
        addChild(manageBoard)
        manageBoard.view.frame = self.view.bounds
        self.view.addSubview(manageBoard.view)
        manageBoard.didMove(toParent: self)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        isManage = false
        
        self.btnManage.isHidden = false
        self.btnAddFuns.isHidden = true
        self.btnSave.isHidden = true
        
        self.collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddFun" {
            let vc = segue.destination as! FunViewController
            vc.fromController = "edit"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
    
    
    //UIPopoverPresentationControllerDelegate inherits from UIAdaptivePresentationControllerDelegate, we will use this method to define the presentation style for popover presentation controller
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
    }
     
    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
     
    }
     
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
    return true
    }
}



//MARK:- CollectionView
extension MyFunboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "funboardCell", for: indexPath) as! FunboardCollectionViewCell
        
        let fun = array[indexPath.row]
        
        cell.imgView.image = fun.icon
        
        if(isManage){
            cell.labelEdit.isHidden = false
        }
        else {
            cell.labelEdit.isHidden = true
        }
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "funboardCell", for: indexPath) as! FunboardCollectionViewCell
        
        let parentId = array[indexPath.row].parentId
        
        let answers = array[indexPath.row].answers
        
        if(parentId == 4 || parentId == 6 || parentId == 7 || parentId == 8 || parentId == 9
            || parentId == 11){
            return
        }
        
        if(isManage){
            let attributes = collectionView.layoutAttributesForItem(at: indexPath)
            showpopover(view: attributes!.frame, parentId: parentId, answers: answers!)
        }
    }
    
    
    func showpopover(view: CGRect, parentId: Int, answers: [Answer]){
//        let button = view
        let buttonFrame = view
        
        /* 2 */
        //Configure the presentation controller
        let popoverContentController = self.storyboard?.instantiateViewController(withIdentifier: "PopoverViewController") as? PopoverViewController
        popoverContentController?.modalPresentationStyle = .popover
        popoverContentController?.type = ""
        popoverContentController?.parent_id = parentId
        popoverContentController?.answers = answers

        /* 3 */
        if let popoverPresentationController = popoverContentController?.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: view.midX - 10, y: view.maxY - 40, width: 100, height: 100)
            popoverPresentationController.delegate = self
            if let popoverController = popoverContentController {
                present(popoverController, animated: true, completion: nil)
            }
        }
    }
    
}



//MARK:- Delegate
extension MyFunboardViewController: AddFunDelegate {
    func closePressed(isUpdated: Bool) {
        if(manageBoard != nil){
            manageBoard.willMove(toParent: nil)
            manageBoard.view.removeFromSuperview()
            manageBoard.removeFromParent()
        }
        
        if(isUpdated){
            getDetails()
        }
        else {
            
        }
        
       
    }
    
    
}

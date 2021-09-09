//
//  PopoverViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/1/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    @IBOutlet weak var viewCenter: CardView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var label2TopConstraint: NSLayoutConstraint!
    @IBOutlet weak var label3TopConstraint: NSLayoutConstraint!
    
    var type: String!
    var parent_id: Int!
    var answers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(type == "user"){
            txt1.isUserInteractionEnabled = false
            txt2.isUserInteractionEnabled = false
            txt3.isUserInteractionEnabled = false
        }
        
        
        let questions = FunAnswers.getQuestions(parent: parent_id, child: 0)
        
        label1.text = questions[0].question1
        label2.text = questions[0].question2
        label3.text = questions[0].question3
        
        txt1.text = answers[0].answer
        txt2.text = answers[1].answer
        txt3.text = answers[2].answer
        
        
        
        
        if(questions[0].question3.isEmpty){
            label3.isHidden = true
            txt3.isHidden = true
        }
        else {
            label3.isHidden = false
            txt3.isHidden = false
        }

        viewCenter.layer.borderColor = UIColor(hexString: "#FF698C").cgColor
        viewCenter.layer.borderWidth = 1
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if (txt2.isFirstResponder) {
            self.label2TopConstraint.constant = 25 // Move view 150 points upward
            self.label1.isHidden = true
            self.txt1.isHidden = true
        }
        else if(txt3.isFirstResponder){
            self.label3TopConstraint.constant = 25 // Move view 150 points upward
            self.label1.isHidden = true
            self.txt1.isHidden = true
            self.label2.isHidden = true
            self.txt2.isHidden = true
        }
        
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.label2TopConstraint.constant = 132.5
        self.label3TopConstraint.constant = 240
        
        self.txt1.isHidden = false
        self.txt2.isHidden = false
        self.label1.isHidden = false
        self.label2.isHidden = false
        
        self.view.layoutIfNeeded()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }

}

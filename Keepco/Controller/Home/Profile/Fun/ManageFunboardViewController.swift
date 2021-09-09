//
//  ManageFunboardViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/2/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class ManageFunboardViewController: UIViewController {
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var viewTop: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSave.layer.cornerRadius = 27.5
        btnSave.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
    }
}

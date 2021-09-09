//
//  SelectDateViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/7/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class SelectDateViewController: UIViewController {
    
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var centerView: UIView!
    
    var blurFxView: UIVisualEffectView!
    var delegate: isDateSelected!
    
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
        blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)

        btnDone.layer.cornerRadius = 27.5
        btnDone.layer.masksToBounds = true
        
        datepicker.datePickerMode = .date
        datepicker.maximumDate = Date()

        datepicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            date = "\(year)-\(month)-\(day)"
        }
    }
    
    @IBAction func donePressed(_ sender: Any) {
        if date == nil {
            return
        }
        
        delegate.date_select(date: self.date)
        self.dismiss(animated: true, completion: nil)

    }
}



//MARK:- SELECT DATE PROTOCOL


protocol isDateSelected {
    func date_select(date: String)  //data: string is an example parameter
}


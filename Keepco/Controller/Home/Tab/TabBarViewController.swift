//
//  TabBarViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var viewTabs: UIView!
    @IBOutlet var viewShadow: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var viewLogOff: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgLogoSmall: UIImageView!
    @IBOutlet weak var btnProfile: UIButton!
    
    var homeViewController: UIViewController!
    var workViewController: UIViewController!
    var profileViewController: UIViewController!
    var addressViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 2

    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        workViewController = storyboard.instantiateViewController(withIdentifier: "WorkViewController")
        profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        addressViewController = storyboard.instantiateViewController(withIdentifier: "AddressViewController")

        viewControllers = [homeViewController, workViewController, profileViewController, addressViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.logoutTapped(_:)))
        viewLogOff.addGestureRecognizer(tap4)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgLogo.isUserInteractionEnabled = true
        imgLogo.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))

        imgLogoSmall.isUserInteractionEnabled = true
        imgLogoSmall.addGestureRecognizer(tapGestureRecognizer1)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        changeTab(sender: btnProfile)

    }
    
    
    @objc func logoutTapped(_ sender: UITapGestureRecognizer? = nil){
        resetDefaults()
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
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
    
    
    func setViews(){
        self.viewShadow.layer.cornerRadius = 50
        self.viewShadow.clipsToBounds = true
        self.viewShadow.layer.shadowPath =
            UIBezierPath(roundedRect: self.viewShadow.bounds,
                         cornerRadius: self.viewShadow.layer.cornerRadius).cgPath
        self.viewShadow.layer.shadowColor = UIColor(hexString: "#efefef").cgColor
        self.viewShadow.layer.shadowOpacity = 0.25
        self.viewShadow.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.viewShadow.layer.shadowRadius = 1
        self.viewShadow.layer.masksToBounds = false
        
        self.viewTabs.layer.cornerRadius = 50
        self.viewTabs.clipsToBounds = true
    
    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        if(sender.tag == 1){
            let workAddress = UserDefaults.standard.string(forKey: Config.WORK_ADDRESS) ?? ""
            if(workAddress == ""){
                let alertController = UIAlertController(title: nil, message: "Browsing the workpage requires entering the workplace address", preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "Edit profile", style: .default, handler: { (action) in
                    let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
                }))
                
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

                self.present(alertController, animated: true, completion: nil)
                return
            }
        }
        changeTab(sender: sender)
    }
    
    
    func changeTab(sender: UIButton){
        checkTabs(sender: sender.tag)
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        sender.isSelected = true

        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
            
        updateIcon(sender: sender.tag)
    }
    
    func checkTabs(sender: Int){
        if(sender == 0 && selectedIndex == 0){
            let vc = viewControllers[sender] as! HomeViewController
            vc.goBack()
        }
        else if(sender == 1 && selectedIndex == 1){
            let vc = viewControllers[sender] as! WorkViewController
            vc.goBack()
        }
        else if(sender == 2 && selectedIndex == 2){
            let vc = viewControllers[sender] as! ProfileViewController
            vc.goBack()
        }
        else if(sender == 3 && selectedIndex == 3){
            let vc = viewControllers[sender] as! AddressViewController
            vc.goBack()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        viewTop.animHide()
    }
    
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func backPressed(_ sender: Any) {
//        if(!HomeViewController.isActive && !WorkViewController.isActive && !ProfileViewController.isActive && !AddressViewController.isActive){
//            self.dismiss(animated: true, completion: nil)
//        }
        viewTop.animHide()
    }

    
    func updateIcon(sender: Int){
        let index = sender
        if index == 0 {
            buttons[0].setImage(#imageLiteral(resourceName: "ic_home_selected"), for: .normal)
            buttons[1].setImage(#imageLiteral(resourceName: "ic_work"), for: .normal)
            buttons[2].setImage(#imageLiteral(resourceName: "ic_profile"), for: .normal)
            buttons[3].setImage(#imageLiteral(resourceName: "ic_location"), for: .normal)
        }
        else if index == 1 {
            buttons[0].setImage(#imageLiteral(resourceName: "ic_home"), for: .normal)
            buttons[1].setImage(#imageLiteral(resourceName: "ic_work_selected"), for: .normal)
            buttons[2].setImage(#imageLiteral(resourceName: "ic_profile"), for: .normal)
            buttons[3].setImage(#imageLiteral(resourceName: "ic_location"), for: .normal)
        }
        else if index == 2 {
            buttons[0].setImage(#imageLiteral(resourceName: "ic_home"), for: .normal)
            buttons[1].setImage(#imageLiteral(resourceName: "ic_work"), for: .normal)
            buttons[2].setImage(#imageLiteral(resourceName: "ic_profile_selected"), for: .normal)
            buttons[3].setImage(#imageLiteral(resourceName: "ic_location"), for: .normal)
        }
        else {
            buttons[0].setImage(#imageLiteral(resourceName: "ic_home"), for: .normal)
            buttons[1].setImage(#imageLiteral(resourceName: "ic_work"), for: .normal)
            buttons[2].setImage(#imageLiteral(resourceName: "ic_profile"), for: .normal)
            buttons[3].setImage(#imageLiteral(resourceName: "ic_location_selected"), for: .normal)
        }
    }
    
}



// MARK:- Extensions

extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}


extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

//
//  PrivacyPolicyViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/7/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {
    @IBOutlet weak var txtPrivacy: UITextView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewSignup: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.signupTapped(_:)))
        viewSignup.addGestureRecognizer(tap)
        
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap3)
        
        let text = """
Keepco is committed to maintaining user privacy on our app. This privacy policy governs the use of and describes the use of your personal information provided to us when you use our app.

You are agreeing to be legally bound by the terms of this privacy policy when you use this app. Do not use our app if you disagree in any way with our policy. By accepting the privacy policy, you clearly agree to our use of and disclosure of your personal information in accordance with the policy.

This privacy policy is integrated into and subject to the terms of any other agreement you sign with Keepco and becomes applicable upon your completion of registration as a user.
        

THE INFORMATION WE COLLECT

Information that you provide: When you register on our app, we may ask you to provide information such as your full name (or alias), email address, phone number, contact address, age, gender,  as well as your interests and activities.

Information about others: When you use our app to send messages, we may collect personal information about your recipients, including their full names, addresses, and email addresses.

Information collected through our use of cookies and other technologies: We use a number of technologies to gather certain information such as users' computer browser information and IP address, the language of use, and time from our users so that we can better understand our user base as a whole.
        

PERSONALLY-PROVIDED INFORMATION

Our app allows users to post information about themselves, to communicate with others, and/or upload content. Please understand that your information will be obtainable publicly and can be viewed and used by others when you voluntarily reveal personal information on publicly-accessible web pages. We, therefore, advise that you exercise caution and common sense as per uploading identifiable personal information.
        

HOW WE USE/SHARE YOUR INFORMATION

We may use your information to help us identify you and any accounts you hold with us; to enable us to evaluate, improve and develop our app and its services; to inform you about changes to our app and services; to inform you about services and/or events which we feel may interest you; to troubleshoot problems and resolve disputes; to customize your experience; and to discover and defend ourselves against error, fraud, and other nefarious activities.

We may share your information with third parties with whom you choose to let us share information; and with third-parties, including our authorized service providers, advertising companies, and ad networks, who exhibit advertisements on our app, but subject to the provisions of this privacy policy.

We may also share your information with our approved service providers who carry-out certain services on our behalf; and with appropriate legal authorities/government officials in reply to a subpoena, similar investigative demand, or court order if commanded to do so.
        

OUR COOKIES POLICY

We use cookies to allow you to register on our app without hassles to allow you to log in subsequently without problems and to ensure that you have a fantastic time each time you use the app.

You may choose to deny or accept cookies on your web browser even though most browsers accept cookies automatically. Should you choose this course of action, you may be unable to log in or use some of the interactive features provided on our app.
        
       
USE OF OUR APP BY MINORS

Only persons who have attained the age of 18 are welcome to use our app. We will never intentionally collect information from minors.
        

INFORMATION SECURITY

We work hard to prevent unauthorized access while ensuring the appropriate use of information and the preservation of data accuracy. Despite this, we will not be held liable for any breach of your personal information that is beyond our control.


CHANGES
We may occasionally review this Privacy Policy to better reflect our use and protection of your information. Once we upload a review policy, your continued use of the app afterwards shall indicate your continued acceptance of our privacy policy.
        
"""
        
        let attributedString = NSMutableAttributedString(string: text)
        
        let highlightedWords = ["THE INFORMATION WE COLLECT", "PERSONALLY-PROVIDED INFORMATION", "HOW WE USE/SHARE YOUR INFORMATION", "OUR COOKIES POLICY", "USE OF OUR APP BY MINORS", "INFORMATION SECURITY", "CHANGES"]
        
        for highlightedWord in highlightedWords {
            let textRange = (text as NSString).range(of: highlightedWord)
            
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "GillSansMT-Bd", size: 18) , range: textRange)
        }
        
        
        txtPrivacy.attributedText = attributedString
        txtPrivacy.sizeToFit()
    }

    @objc func termsTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        performSegue(withIdentifier: "toTerms", sender: nil)
    }
    
    @objc func contactTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @objc func signupTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        performSegue(withIdentifier: "toSignup", sender: nil)
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        viewTop.animHide()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backPressed(_ sender: Any) {
        viewTop.animHide()
        self.dismiss(animated: true, completion: nil)
    }
}

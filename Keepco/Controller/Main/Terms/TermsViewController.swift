//
//  TermsViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 5/7/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var txtPrivacy: UITextView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewSignup: UIView!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.signupTapped(_:)))
        viewSignup.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContactUs.addGestureRecognizer(tap2)
        
        
        let text = """
        Welcome to Keepco.
        
        Make sure to read the terms and conditions set out below, as they explain the terms on which you may make use of the app (including accessing, logging on to, making comments on and browsing the app).

        Your access and use of this app means that you agree to be lawfully bound by these terms and conditions. If you do not agree with any of these terms, you must discontinue using this app.

        Provided that they do not have an adverse effect on the quality of the service, Keepco reserves the right to make occasional changes to the service as required by law or relevant safety requirements. We will indicate the last date updated on this page every time we review our terms, and your use of the Keepco Web app after any such change means that you agree to be lawfully bound by the terms and conditions as changed.
        

        HOW THE APP WORKS
        
        Keepco is a global social communication system that allows users to interact with others. Users are able to use our service to communicate with neighbors or  according to their classification of common hobbies and specific occupations.
        
        ELIGIBILITY
        
        To be able to register for our services, you must be at least 18 years old. By using Keepco, you represent and warrant that you have attained the age of 18.
        You will also have to register as a user, after which you may create a user profile for yourself.
        
        During our unique registration process, you will be asked to define your hobbies (called "FUNS") and occupation, and indicate your residence and work addresses. It is not mandatory to enter the residence / work address for those who choose not to do so. It is also not mandatory to use your original name if you wish to keep your privacy.
        
        You hereby certify that the information you provide on Keepco are truthful, comprehensive, and not misleading.  We may delete your account if the information provided is found to be false, incorrect, or deliberately misleading.
        
        We reserve the right to refuse to register applications for membership and to terminate memberships at any time.
        
        
        USER PROFILES
        
        You accept that other users will be able to view your user profile. You will also be allowed to view the details and profiles of other registered users.

        User uploads are at the user’s discretion. If you decide to post or disclose any confidential or sensitive information about yourself, you do so entirely at your own risk.
        
        Keepco may replicate any information posted by you on the app in any form and in any manner as we may deem fit.

        At Keepco, we reserve the right and may exercise such right from time to time to assess user profiles to adjust and/or remove the entire profile or parts of it as we in our sole discretion deem fit.

        You should be aware that information posted by other users on their profiles are only a depiction of how they describe themselves, and you may not presume that the information filled in any profile is genuine.

        While we may implement a verification exercise once in a while, Keepco is not obligated to verify that the profiles of users are correct and not false.

        You are admonished to carry out investigations and verify the veracity of other users’ claims and information (at your own expense) before acting on information obtained from any profile or on any information that may be received by you through the use of the service.

        Should you arrange any meetings with any person through the use of the service, you do so at your own risk. We advise you to take such precautions as you may deem necessary to ensure personal safety.

        We will under no condition be held liable for any loss or damage that may occur in connection or relating to users’ use of the app and any acquaintance and/or meetings they make from their use of the app.


        HOW YOU CAN USE THE SERVICE/ACCEPTABLE USE

        You can use the Keepco service to communicate with neighbors within the specific radius set by you. You understand that you may set your communication radius within 0 (if you live in a building and want to only communicate with the neighbors in your building) up to 1000 meters.

        After registration, you will be able to view other members' funs and occupations and may send messages to each member or a group of people with an occupation/hobby in common with you, and according to the radius you have set from your residence/ workplace.

        All users who enter their place of residence / work during the registration process, or who subsequently edit the addresses on their profile page, will have access to their homepage and/or workpage. The posts that a user sees are only posts that someone has uploaded near his/her home/work. You cannot see a post uploaded by your chosen friends, except such friends live near your address.

        Anyone who connects to the app chooses to share his content and to assess shared content from his/her neighbors.

        You may, however, reduce your exposure by setting a short radius from your home/workspace.


        COPYRIGHT/INTELLECTUAL PROPERTY RIGHTS

        All materials, including and not in any way restricted to pictures, graphics, designs, icons, pictures, video clips, written materials, and all other items found on this app, are copyrighted, trademarked, controlled, or licensed by Keepco, its affiliates or by their respective creators.

        These materials are protected by Israeli laws and international copyright laws.

        Keepco, our app, logos, scripts, page headers, button icons, and service names included in or made available through Keepco are trademarks or trade dress of Keepco in the Israel and other countries.
        
        
        
        USER REPRESENTATIONS

        You hereby represent that you will adhere to the following codes of conduct:
        •    That you will access the Keepco app only for your own personal, non-commercial use;
        •    That you will not use the service to promote other websites, apps, services or other businesses, apart from providing private business owners service to the immediate residential / work environment.
        •    That you will not use the service to ask for other users' business or attempt to purchase or advertise products or services;
        •    That you will not attempt to gain unlawful access to any information available on our service or to any of the networks used in providing the service;
        •    That you will not send any junk email to other users;
        •    That you will not allow any other person to use your account in any way;
        •    That you will not use the app to spread crime-inducing content;
        •    That you will not use the app to breach any relevant laws or regulations;
        •    That you will not interfere with any other individual’s use of the app;
        •    That you will not make, transmit or store electronic duplicates of materials protected by copyright without our consent;
        •    That you will not use any device, software, or procedure to interfere with the proper working of Keepco;
        •    That you will not transmit or post sexually explicit, threatening, racist, abusive, sexually suggestive, or libelous content; or content that offends users’ political or religious beliefs through the service;

        If we find you to have breached any of the provisions of these terms, we will hold you liable for any legal costs and losses arising out of that breach. We may also terminate your use of the app in such a case.


        MARKETING CONTENT

        Keepco reserves the right to post marketing content anywhere it sees fit on the app pages, and at any time. Keepco uses the user information defined in the sign-up process and tries to target the marketing content to the right audience.
                
        
        LINKS TO THIRD PARTIES
        For the sake of convenience, Keepco may provide links to the resources of third-party apps and websites. Do not take our provision of such links as our endorsement of the content, procedures, products, and/or services, of that third party resource, except we specifically say so. We recommend that you always read through and understand before you accept third party resources’ policies, as you alone bear the risk for using such resources.
        

        DISCLAIMER/ LIMITATION OF LIABILITY

        THE KEEPCO APP IS PROVIDED BY US ON AN “AS IS” BASIS. THERE ARE NO REPRESENTATIONS OR ASSURANCES MADE BY US THAT IT WILL BE SATISFACTORY FOR YOU.

        IF YOUR BROWSING DEVICE DOES NOT SUPPORT SUPPER ENCRYPTION AND OTHER RELEVANT TECHNOLOGY, YOU MAY BE UNABLE TO USE THE APP AND/OR USE SOME PARTS OF OUR SERVICES.

        WE MAKE NO REPRESENTATIONS OF ANY KIND, IMPLIED OR DIRECT, REGARDING THE OPERATION OF THE APP OR THE CONTENT, INFORMATION OR MATERIALS MADE AVAILABLE ON THE APP.

        WE MAKE NO REPRESENTATIONS, WHETHER EXPRESS OR IMPLIED (INCLUDING, BUT NOT RESTRICTED TO IMPLIED WARRANTIES OF MERCHANTABILITY, SUITABILITY, AND FITNESS FOR A PARTICULAR PURPOSE) TO THE FULLEST EXTENT PERMISSIBLE BY APPLICABLE LAW, AND SHALL BEAR NO LIABILITY FOR ANY LOSS/DAMAGE (BE THEY DIRECT, SECONDARY, PENAL, RELATED, OR FAR-REACHING) IN CONNECTION WITH YOUR USE OF THIS APP.

        NOTHING INCLUDED IN THESE TERMS AND CONDITIONS IS INTENDED TO EXCLUDE OR LIMIT OUR LEGAL RESPONSIBILITY FOR DEATH OR INJURY THAT MAY ARISE FROM OUR NEGLIGENCE, TRICKERY, OR ANY OTHER LIABILITY THAT CANNOT BE EXCLUDED OR EXEMPTED BY LAW.
        
        
        INDEMNIFICATION

        You declare that you will not claim any indemnity, and will keep Keepco innocent and guilty of any claims, expenses, fees and damages in connection with your use of the App. You accept that this may include legal fees as well as accounting costs.
        

        GOVERNING LAW

        This agreement is construed under and shall be governed by the laws of the Israeli law. Both parties hereby agree to the exclusive jurisdiction of its courts.
        
        
        
        
        
        
        
        

        """
        
        let attributedString = NSMutableAttributedString(string: text)
        
        let highlightedWords = ["HOW THE APP WORKS", "ELIGIBILITY", "USER PROFILES", "HOW YOU CAN USE THE SERVICE/ACCEPTABLE USE", "COPYRIGHT/INTELLECTUAL PROPERTY RIGHTS", "USER REPRESENTATIONS", "MARKETING CONTENT", "LINKS TO THIRD PARTIES", "DISCLAIMER/ LIMITATION OF LIABILITY", "INDEMNIFICATION", "GOVERNING LAW"]
        
        for highlightedWord in highlightedWords {
            let textRange = (text as NSString).range(of: highlightedWord)
            
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "GillSansMT-Bd", size: 18) , range: textRange)
        }
        
        
        txtPrivacy.attributedText = attributedString
        txtPrivacy.sizeToFit()
    }
    
    @objc func contactTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard_name, bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @objc func privacyTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        performSegue(withIdentifier: "toPrivacy", sender: nil)
    }
    
    @objc func signupTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        performSegue(withIdentifier: "toSignup", sender: nil)
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        viewTop.animHide()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

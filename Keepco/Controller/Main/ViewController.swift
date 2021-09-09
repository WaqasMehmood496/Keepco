//
//  ViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/28/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import AVKit


class ViewController: UIViewController {
    @IBOutlet weak var viewLanguage: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewSignup: UIView!
    @IBOutlet weak var viewPrivacy: UIView!
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewContact: UIView!
    @IBOutlet weak var tableView: UITableView!
    private var player: AVPlayer!

    let array = ["","Community", "Fast, Easy & Efficient" , "Mutual Responsibility"]
    let images = [UIImage(named: ""), UIImage(named: "community"), UIImage(named: "fast_easy"), UIImage(named: "mutual_response")]
    let desc = ["", "Keepco aims to bring back the community life that has passed with the ages. We see the importance of creating community life in each of us' living environments, creating interpersonal connections and new relationships.", "We have created a very convenient and friendly platform through which you can get to know your surroundings, communicate with neighbors, and examine whether you share the same hobbies / occupations as others around you. Keepco is committed to making the information experience-friendly, convenient and efficient to operate.", "It is the responsibility of each of us to maintain the social value in everything we do, among all the people in my environment. Mutual guarantee will help each of us achieve life goals."]
    
    let array_he = ["","חיי קהילה", "מהיר, פשוט ויעיל" , "ערבות הדדית"]
    let desc_he = ["", "\u{200F}Keepco שמה לה למטרה להחזיר את חיי הקהילה שחלפה עם הדורות. אנו רואים חשיבות ביצירת חיי קהילה בסביבת המגורים של כל אחד מאיתנו, יצירת חיבורים בין אישיים והתקשרויות חדשות.", "יצרנו פלטפורמה נוחה וידידותית מאד, באמצעותה תוכל להכיר את הסביבה שלך, לתקשר עם השכנים, לבחון האם אתה חולק את אותם תחומיעניין/ עיסוק כמו אחרים בסביבה. Keepco דוגלת נגשת המידעבאופן חווייתי, נוח וקל לתפעול.", "זוהי האחריות של כל אחד מאיתנו לשמור על הערך הסוציאלי בכל דבר שאנו עושים, בין כל הדרים בסביבה שלי. הערבות ההדדית תעזור לכל אחד מאיתנו להשיג ולכבוש מטרות בחיים."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.signupTapped(_:)))
        viewSignup.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.privacyTapped(_:)))
        viewPrivacy.addGestureRecognizer(tap1)
        
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.termsTapped(_:)))
        viewTerms.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.contactTapped(_:)))
        viewContact.addGestureRecognizer(tap3)
                
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
        performSegue(withIdentifier: "toTerms", sender: nil)
    }
     
   
    @objc func privacyTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        performSegue(withIdentifier: "toPrivacy", sender: nil)
    }
  
    @objc func signupTapped(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        viewTop.animHide()
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        viewTop.animHide()
        if(viewLanguage.isHidden == false) {viewLanguage.animHide()}
    }

    @IBAction func menuPressed(_ sender: Any) {
        viewTop.animShow()
    }
    @IBAction func closeMenuPressed(_ sender: Any) {
        viewTop.animHide()
    }
    
    @objc func connected(sender: UIButton){
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    @IBAction func languagePressed(_ sender: Any) {
        viewLanguage.langShow()
    }
    
    @IBAction func englishPressed(_ sender: Any) {
        viewLanguage.animHide()
        language = "en"
        storyboard_name = "Main"
        saveLanguage(lang: "en")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController");
        appDelegate.window?.rootViewController = Main
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @IBAction func hePressed(_ sender: Any) {
        viewLanguage.animHide()
        language = "he"
        storyboard_name = "MainHe"
        saveLanguage(lang: "he")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Main = UIStoryboard(name: "MainHe", bundle: nil).instantiateViewController(withIdentifier: "ViewController");
        appDelegate.window?.rootViewController = Main
        appDelegate.window?.makeKeyAndVisible()
    }
    
    func saveLanguage(lang: String){
        UserDefaults.standard.set(lang, forKey: Config.LANGUAGE)
        UserDefaults.standard.synchronize()
    }
    
    
    @objc func play(sender: UIButton){
        playVideo()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "intro", ofType:"mp4") else {
            debugPrint("intro.mp4 not found")
            return
        }

        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! MainTableViewCell
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = cell.viewVideo.bounds
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
//        }
//        cell.viewVideo.layer.addSublayer(playerLayer)
            self.player.play()
        }
    }
}

//MARK:- TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "1stCell", for: indexPath) as! MainTableViewCell
            
//            cell.viewSearch.layer.borderColor = UIColor(hexString: "#00FFFF").cgColor
//            cell.viewSearch.layer.borderWidth = 1
//            cell.viewSearch.layer.cornerRadius = 20
            
            cell.btnJoin.layer.cornerRadius = 7.0
            cell.btnJoin.layer.masksToBounds = true
            
            cell.btnJoin.tag = indexPath.row
            cell.btnJoin.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)

            cell.btnPlay.tag = indexPath.row
            cell.btnPlay.addTarget(self, action: #selector(play(sender:)), for: .touchUpInside)
            
            cell.imgVideo.layer.cornerRadius = 10
            
            cell.viewBg.clipsToBounds = true
            cell.viewBg.layer.cornerRadius = 20
            cell.viewBg.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

                      
//            cell.txtSearch.attributedPlaceholder = NSAttributedString(string: "Where do you looking for...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
//            
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .white
            cell.selectedBackgroundView = backgroundView
            
            return cell
        }
        else if indexPath.row >= 1 && indexPath.row <= 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "2ndCell", for: indexPath) as! MainSecondCell
            
            cell.viewBg.layer.cornerRadius = 7.0
            
            if(language == "en"){
                cell.labelName.text = array[indexPath.row]
                cell.labelDesc.text = desc[indexPath.row]
                cell.imgView.image = images[indexPath.row]
            }
            else {
                cell.labelName.text = array_he[indexPath.row]
                cell.labelDesc.text = desc_he[indexPath.row]
                cell.imgView.image = images[indexPath.row]
            }
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .white
            cell.selectedBackgroundView = backgroundView
            return cell
        }
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "3rdCell", for: indexPath) as! MainThirdCell
         
            cell.imgMap.layer.cornerRadius = 10
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .white
            cell.selectedBackgroundView = backgroundView
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "4thCell", for: indexPath) as! MainForthCell

            let backgroundView = UIView()
            backgroundView.backgroundColor = .white
            cell.selectedBackgroundView = backgroundView

            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 460
        }
        else if indexPath.row == 1 {
            return 150
        }
        else if indexPath.row == 2 {
            return 170
        }
        else if indexPath.row == 3 {
            return 150
        }
        else if indexPath.row == 4 {
            return 580
        }
        else {
            return 230
        }
    }
    
    
}


//MARK:- Color Extension

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


extension UIView{
    func animShow(){
        self.center.y = -150
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
    
    func langShow(){
        self.center.y = -70
           UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn],
                          animations: {
                           self.center.y += self.bounds.height
                           self.layoutIfNeeded()
           }, completion: nil)
           self.isHidden = false
       }
}



//MARK:- EXTENSION AVPLAYER
extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}

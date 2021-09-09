//
//  AddressViewController.swift
//  Keepco
//
//  Created by Usman Meraj on 4/30/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import DropDown
import GoogleMaps
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import GoogleMapsUtils

class AddressViewController: UIViewController {
    @IBOutlet weak var txtHome: UITextField!
    @IBOutlet weak var txtOccupation: UITextField!
    @IBOutlet weak var txtFun: UITextField!
    @IBOutlet weak var txtRadius: UITextField!
    @IBOutlet weak var txtSecondRadius: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var viewTalk: UIView!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewOccupation: UIView!
    @IBOutlet weak var viewFun: UIView!
    @IBOutlet weak var viewRadius1: UIView!
    @IBOutlet weak var viewRadius2: UIView!
    @IBOutlet weak var btnDeleteOccupation: UIButton!
    @IBOutlet weak var btnDeleteFun: UIButton!
    @IBOutlet weak var btnDeleteRadius1: UIButton!
    @IBOutlet weak var btnDeleteRadius2: UIButton!
    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet weak var viewProgress: UIView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    @IBOutlet weak var btnTalk: UIButton!
    @IBOutlet weak var viewResults: UIView!
    @IBOutlet weak var btnResults: UIButton!
    
    let dropDown = DropDown()
    let dropDown2 = DropDown()
    var postController: SelectOccupationViewController!
    var postController2: SelectFunViewController!
    var postController3: UserProfileViewController!
    var postController4: UsersListViewController!
    var isOccupationHidden = false
    var isFunHidden = false
    var homeLat: String!
    var homeLng: String!
    var workLat: String!
    var workLng: String!
    var user_id: String!
    var fun_id: String!
    var funParentId: String!
    var occupation_id: String!
    var occupationParentId: String!
    let SEARCH_URL = Config.BASE_URL + "sreach";
    var array = [User]()
    private var clusterManager: GMUClusterManager!
    var addressType = "home"
    static var isActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        googleMap.delegate = self
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: googleMap, clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: googleMap, algorithm: algorithm, renderer: renderer)
        googleMap.isMyLocationEnabled = true
        googleMap.settings.myLocationButton = true
        
        renderer.delegate = self
        renderer.minimumClusterSize = 2
        renderer.maximumClusterZoom = 22
        customizeViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AddressViewController.isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AddressViewController.isActive = false
    }
    
    func customizeViews(){
        
        if(language == "en"){
            txtHome.attributedPlaceholder = NSAttributedString(string: "MyHome", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtOccupation.attributedPlaceholder = NSAttributedString(string: "Occupation", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtFun.attributedPlaceholder = NSAttributedString(string: "Fun", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtRadius.attributedPlaceholder = NSAttributedString(string: "Radius", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtSecondRadius.attributedPlaceholder = NSAttributedString(string: "Radius", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
        }
        else {
            txtHome.attributedPlaceholder = NSAttributedString(string: "הבית שלי", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtOccupation.attributedPlaceholder = NSAttributedString(string: "תחום עיסוק", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtFun.attributedPlaceholder = NSAttributedString(string: "תחום עניין", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtRadius.attributedPlaceholder = NSAttributedString(string: "טווח", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
            
            txtSecondRadius.attributedPlaceholder = NSAttributedString(string: "טווח", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#343997")])
        }
        
        
        btnSearch.layer.cornerRadius = btnSearch.frame.height/2
        btnSearch.layer.borderWidth = 1
        btnSearch.layer.borderColor = UIColor(hexString: "#343997").cgColor

        viewTalk.layer.cornerRadius = viewTalk.frame.height/2
        viewTalk.layer.borderWidth = 1
        viewTalk.layer.borderColor = UIColor(hexString: "#343997").cgColor
        
        
        viewResults.layer.cornerRadius = viewResults.frame.height/2
        viewResults.layer.borderWidth = 1
        viewResults.layer.borderColor = UIColor(hexString: "#343997").cgColor
        viewResults.isHidden = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.homePressed(_:)))
        viewHome.tag = 0
        viewHome.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.radiusPressed(_:)))
        viewRadius1.tag = 1
        viewRadius1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.radius2Pressed(_:)))
        viewRadius2.tag = 2
        viewRadius2.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.occupationPressed(_:)))
        viewOccupation.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.funPressed(_:)))
        viewFun.addGestureRecognizer(tap4)
    }
    
    func getDetails(){
        user_id = UserDefaults.standard.string(forKey: Config.USER_ID) ?? ""
        
        homeLat = UserDefaults.standard.string(forKey: Config.HOME_LAT) ?? "0"
        homeLng = UserDefaults.standard.string(forKey: Config.HOME_LNG) ?? "0"
        
        workLat = UserDefaults.standard.string(forKey: Config.WORK_LAT) ?? "0"
        workLng = UserDefaults.standard.string(forKey: Config.WORK_LNG) ?? "0"
        
        
        createCircles(homeLat: homeLat, homeLng: homeLng)
    }
    
    func createCircles(homeLat: String, homeLng: String){
        googleMap.clear()
        
        
        
        var lat = (homeLat as NSString).doubleValue
        var lng = (homeLng as NSString).doubleValue
        
        let camera = GMSCameraPosition.camera(withLatitude: (lat), longitude: (lng), zoom: 15.35)
        self.googleMap?.animate(to: camera)
        
        let circleCenter = CLLocationCoordinate2DMake(lat, lng);
        
        let circle = GMSCircle(position: circleCenter, radius: 500)
        circle.fillColor = UIColor(hexString: "40FFF460")
        circle.strokeColor = UIColor.clear
        circle.strokeWidth = 0
        circle.map = googleMap
        
        let circle2 = GMSCircle(position: circleCenter, radius: 250)
        circle2.fillColor = UIColor(hexString: "80FFF460")
        circle2.strokeColor = UIColor.clear
        circle2.strokeWidth = 0
        circle2.map = googleMap
        
        let circle3 = GMSCircle(position: circleCenter, radius: 100 )
        circle3.fillColor = UIColor(hexString: "DBD14A")
        circle3.strokeColor = UIColor.clear
        circle3.strokeWidth = 0
        circle3.map = googleMap
        
        
        
        let latitude1 = lat + 0.000010;
        let longitude1 = lng + 0.000010;
        
        let latitude2 = lat + 0.00130;
        let longitude2 = lng + 0.00130;
        
        let latitude3 = lat + 0.00320;
        let longitude3 = lng + 0.00320;
        
        let marker = GMSMarker()
        let markerImage = imageWithImage(image: UIImage(named: "ic_hundred")!, scaledToSize: CGSize(width: 50.0, height: 20.0))
        let markerView = UIImageView(image: markerImage)
        markerView.tintColor = UIColor.red
        marker.position = CLLocationCoordinate2D(latitude: latitude1, longitude: longitude1)
        marker.iconView = markerView
        marker.map = googleMap
        
        let marker1 = GMSMarker()
        let markerImage1 = imageWithImage(image: UIImage(named: "ic_twofifty")!, scaledToSize: CGSize(width: 50.0, height: 20.0))
        let markerView1 = UIImageView(image: markerImage1)
        markerView1.tintColor = UIColor.red
        marker1.position = CLLocationCoordinate2D(latitude: latitude2, longitude: longitude2)
        marker1.iconView = markerView1
        marker1.map = googleMap
        
        let marker2 = GMSMarker()
        let markerImage2 = imageWithImage(image: UIImage(named: "ic_fivehundred")!, scaledToSize: CGSize(width: 50.0, height: 20.0))
        let markerView2 = UIImageView(image: markerImage2)
        markerView2.tintColor = UIColor.red
        marker2.position = CLLocationCoordinate2D(latitude: latitude3, longitude: longitude3)
        marker2.iconView = markerView2
        marker2.map = googleMap
        
        googleMap.selectedMarker = marker
        googleMap.selectedMarker = marker1
        googleMap.selectedMarker = marker2
        
    }
    
    
   func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @objc func homePressed(_ sender: UITapGestureRecognizer? = nil){
        if(language == "en"){
            showDropDown(list: ["MyHome", "MyWork"], view: self.viewHome)
        }
        else {
            showDropDown(list: ["הבית שלי","העבודה שלי"], view: self.viewHome)
        }
    }
    
    @objc func radiusPressed(_ sender: UITapGestureRecognizer? = nil){
        if(language == "en"){
            showDropDown2(list: ["0 m", "100 m", "250 m", "500 m"], view: self.viewRadius1)
        }
        else {
            let list = ["0 מ '", "100 מ '", "250 מ '", "500 מ '"]
            showDropDown2(list: list, view: self.viewRadius1)
        }
    }
    
    @objc func radius2Pressed(_ sender: UITapGestureRecognizer? = nil){
        if(language == "en"){
            showDropDown2(list: ["0 m", "100 m", "250 m", "500 m"], view: self.viewRadius2)
        }
        else {
            let list = ["0 מ '", "100 מ '", "250 מ '", "500 מ '"]
            showDropDown2(list: list, view: self.viewRadius2)
        }
    }
    
    @objc func occupationPressed(_ sender: UITapGestureRecognizer? = nil){
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        postController = storyboard.instantiateViewController(withIdentifier: "SelectOccupationViewController") as! SelectOccupationViewController
        postController.delegate = self
        addChild(postController)
        postController.view.frame = self.view.bounds
        self.view.addSubview(postController.view)
        postController.didMove(toParent: self)
        
        isOccupationHidden = true
        AddressViewController.isActive = false

    }
    
    @objc func funPressed(_ sender: UITapGestureRecognizer? = nil){
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        postController2 = storyboard.instantiateViewController(withIdentifier: "SelectFunViewController") as! SelectFunViewController
        postController2.delegate = self
        addChild(postController2)
        postController2.view.frame = self.view.bounds
        self.view.addSubview(postController2.view)
        postController2.didMove(toParent: self)
        
        isFunHidden = true
        AddressViewController.isActive = false

       }
    
    
    func goBack(){
        if(postController != nil){
            postController.willMove(toParent: nil)
            postController.view.removeFromSuperview()
            postController.removeFromParent()
            
            isOccupationHidden = false
        }
        if(postController2 != nil){
            postController2.willMove(toParent: nil)
            postController2.view.removeFromSuperview()
            postController2.removeFromParent()
            
            isFunHidden = false
        }
        if(postController3 != nil){
            postController3.willMove(toParent: nil)
            postController3.view.removeFromSuperview()
            postController3.removeFromParent()
            
            isFunHidden = false
        }
        if(postController4 != nil){
            postController4.willMove(toParent: nil)
            postController4.view.removeFromSuperview()
            postController4.removeFromParent()
            
            isFunHidden = false
        }
    }
    
    
    func showDropDown(list: [String], view: UIView){
        dropDown.anchorView = view // UIView or UIBarButtonItem
        let appearance = DropDown.appearance()
        appearance.textColor = UIColor(hexString: "#343997")
        if(view.tag == 0){
            appearance.textFont = UIFont(name: "GillSansMT-BdIt", size: 14)!
        }
        else {
            appearance.textFont = UIFont(name: "GillSansMT", size: 14)!
        }
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = list
//        dropDown.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        if language != "en" {
            dropDown.semanticContentAttribute = .forceRightToLeft
            dropDown.customCellConfiguration = {(index, item, cell: DropDownCell) -> Void in
                cell.optionLabel.textAlignment = .right
            }
        }
        
        
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            if view.tag == 0 {
                if(index == 1){
                    if(self.workLat == "" || self.workLat == "0"){
                        self.view.makeToast("Please add work address in profile")
                    }
                    else {
                        self.txtHome.text = item
                        self.addressType = "work"
                        self.createCircles(homeLat: self.workLat, homeLng: self.workLng)
                    }
                }
                else {
                    self.createCircles(homeLat: self.homeLat, homeLng: self.homeLng)
                    self.txtHome.text = item
                    self.addressType = "home"
                }
            }
            else if view.tag == 1 {
                self.txtRadius.text = item
                self.btnDeleteRadius1.isHidden = false
            }
            else {
                self.txtSecondRadius.text = item
                self.btnDeleteRadius2.isHidden = false
            }
        }
        
        dropDown.show()

    }
    
    func showDropDown2(list: [String], view: UIView){
        dropDown2.anchorView = view // UIView or UIBarButtonItem
        let appearance = DropDown.appearance()
        appearance.textColor = UIColor(hexString: "#343997")
        if(view.tag == 0){
            appearance.textFont = UIFont(name: "GillSansMT-BdIt", size: 14)!
        }
        else {
            appearance.textFont = UIFont(name: "GillSansMT", size: 14)!
        }
        
        // The list of items to display. Can be changed dynamically
        dropDown2.dataSource = list
        if language != "en" {
//            dropDown2.semanticContentAttribute = .forceRightToLeft
            dropDown2.customCellConfiguration = {(index, item, cell: DropDownCell) -> Void in
                cell.optionLabel.textAlignment = .right
            }
        }
        
        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            if view.tag == 1 {
                self.txtRadius.text = item
                self.btnDeleteRadius1.isHidden = false
            }
            else {
                self.txtSecondRadius.text = item
                self.btnDeleteRadius2.isHidden = false
            }
        }
        
        dropDown2.show()

    }
    
    @IBAction func deleteOccupationPressed(_ sender: Any) {
        self.txtOccupation.text = ""
        self.btnDeleteOccupation.isHidden = true
    }
    
    @IBAction func deleteFunPressed(_ sender: Any) {
        self.txtFun.text = ""
        self.btnDeleteFun.isHidden = true
    }
    @IBAction func deleteRadius1Pressed(_ sender: Any) {
        self.txtRadius.text = ""
        self.btnDeleteRadius1.isHidden = true
    }
    @IBAction func deleteRadius2Pressed(_ sender: Any) {
        self.txtSecondRadius.text = ""
        self.btnDeleteRadius2.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        let address = txtHome.text ?? ""
        let radius = txtRadius.text ?? ""
        let radius2 = txtSecondRadius.text ?? ""
        var lat: String!
        var lng: String!
        var distance: String!
        var type: String!
        
        
        if(addressType == "home"){
            lat = homeLat
            lng = homeLng
        }
        else {
            lat = workLat
            lng = workLng
        }
        
        if(occupation_id == nil && fun_id == nil){
            if(language == "en"){
                self.view.makeToast("Please select Occupation or Fun")
            }
            else {
                self.view.makeToast("אנא בחר בעיסוק או בכיף")
            }
            return
        }
        else if(occupation_id == nil){
            if(radius2.isEmpty){
                if(language == "en"){
                    self.view.makeToast("Please select radius")
                }
                else {
                    self.view.makeToast("אנא בחר רדיוס")
                }
                return
            }
            else {
                distance = radius2
                type = "fun"
                if(language == "en"){
                    btnTalk.setTitle("Talk to \(txtFun.text ?? "") fun", for: .normal)
                }
                else {
                    btnTalk.setTitle("כּיף \(txtFun.text ?? "") לדבר ל", for: .normal)
                }
            }
        }
        else if(fun_id == nil){
            if(radius.isEmpty){
                if(language == "en"){
                    self.view.makeToast("Please select radius")
                }
                else {
                    self.view.makeToast("אנא בחר רדיוס")
                }
                return
            }
            else {
                distance = radius
                type = "occupation"
                if(language == "en"){
                    btnTalk.setTitle("Talk to \(txtOccupation.text ?? "")", for: .normal)
                }
                else {
                    btnTalk.setTitle("\(txtFun.text ?? "") לדבר ל", for: .normal)
                }
            }
        }
        
        if(language == "en"){
            distance = distance.replacingOccurrences(of: " m", with: "")
        }
        else {
            distance = distance.replacingOccurrences(of: " מ '", with: "")
        }
        
        
        getUsers(lat: lat, lng: lng, distance: distance, type: type)
        
        
    }
    
    
    //REST API
    func getUsers(lat: String, lng: String, distance: String, type: String){
                
        var parameters: [String: String]!
        if(type == "fun"){
            parameters = [
                "user_id": user_id!, "lat": lat, "lng": lng, "distance": distance, "fun": fun_id
            ]
        }
        else {
            parameters = [
                "user_id": user_id!, "lat": lat, "lng": lng, "distance": distance, "occupation_id": occupation_id
            ]
        }
        
        self.viewProgress.isHidden = false
        self.viewResults.isHidden = true
        self.viewTalk.isHidden = true
        self.indicator.startAnimating()
        
        self.array.removeAll()
        
        AF.request(SEARCH_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                    let success = json["sucess"].int
                    
                    if success == 1 {
                        let jsonArray = json["data"].arrayValue
                        let no_of_result = json["no_of_result"].stringValue
                        
                        for item in jsonArray {
                            let user = User(id: item["user_id"].stringValue, email: item["user_email"].stringValue, username: item["user_name"].stringValue, password: "", image: item["profile_photo"].stringValue, gender: "", phone: item["phone_number"].stringValue, dob: "", home_address: "", work_address: "", home_lat: item["latitude"].stringValue, home_lng: item["logitude"].stringValue, work_lat: item["worklatitude"].stringValue, work_lng: item["worklogitude"].stringValue, occupation: item["occupation_id"].stringValue, sub_occupation: item["suboccupation_id"].stringValue, fun: item["fun_id"].stringValue, sub_fun: item["subfun_id"].stringValue, distance: item["distance"].stringValue, no_of_views: "")
                            user.workDistance = item["workdistance"].stringValue
                            if(self.checkUser(user: user)){
                                self.array.append(user)
                            }
                        }
                        
                        
//                        let user = User(id: "31", email: "usman@gmail.com", username: "Usman", password: "", image: "", gender: "", phone: "", dob: "", home_address: "", work_address: "", home_lat: self.homeLat, home_lng: self.homeLng, work_lat: "", work_lng: "", occupation: "", sub_occupation: "", fun: "", sub_fun: "", distance: "200", no_of_views: "")
//                        self.array.append(user)

                        
                        if(self.array.count > 0){
//                            self.viewTalk.isHidden = false
                        }
                        
                        self.viewResults.isHidden = false
                       
                        self.loadmarkers(homeLat: lat, homeLng: lng)
                    }
                    else {
                        if(language == "en"){
                            self.view.makeToast("No results found")
                        }
                        else {
                            self.view.makeToast("לא נמצאו מקומות")
                        }
                    }

                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true
                    break
                    
                case .failure(let error):
                    print(error)
                    self.indicator.stopAnimating()
                    self.viewProgress.isHidden = true
                }
        }
    }
    
    
    func checkUser(user: User) -> Bool {
        if(occupation_id == nil){
            let funs = user.fun.replacingOccurrences(of: " ", with: "")
            let subFuns = user.sub_fun.replacingOccurrences(of: " ", with: "")
            let arr = funs.components(separatedBy: ",")
            let subArr = subFuns.components(separatedBy: ",")
            if(arr.count == 0){
                return false
            }
            
            for(index, item) in arr.enumerated() {
                let subId = subArr[index]
                if(item == funParentId && subId == fun_id){
                    return true
                }
            }
            
            return false
        }
        else {
            let occupations = user.occupation.replacingOccurrences(of: " ", with: "")
            let subOccupations = user.sub_occupation.replacingOccurrences(of: " ", with: "")
            let arr = occupations.components(separatedBy: ",")
            let subArr = subOccupations.components(separatedBy: ",")
            if(arr.count == 0){
                return false
            }
            
            for(index, item) in arr.enumerated() {
                let subId = subArr[index]
                if(item == occupationParentId && subId == occupation_id){
                    return true
                }
            }
            
            return false
        }
    }
    
    func loadmarkers(homeLat: String, homeLng: String){
        
        
        clusterManager.clearItems()
        
        let lat = (homeLat as NSString).doubleValue
        let lng = (homeLng as NSString).doubleValue
        
        let camera = GMSCameraPosition.camera(withLatitude: (lat), longitude: (lng), zoom: 15.35)
        self.googleMap?.animate(to: camera)
        
        let circleCenter = CLLocationCoordinate2DMake(lat, lng);
        
        let circle = GMSCircle(position: circleCenter, radius: 500)
        circle.fillColor = UIColor(hexString: "40FFF460")
        circle.strokeColor = UIColor.clear
        circle.strokeWidth = 0
        circle.map = googleMap
        
        // Generate and add random items to the cluster manager.
        generateClusterItems()
        
        // Call cluster() after items have been added to perform the clustering and rendering on map.
        clusterManager.cluster()
        
        // Register self to listen to both GMUClusterManagerDelegate and GMSMapViewDelegate events.
        clusterManager.setDelegate(self, mapDelegate: self)
    }
    
    func addMarkers(homeLat: String, homeLng: String){
        self.googleMap.clear()
        
        
        let lat = (homeLat as NSString).doubleValue
        let lng = (homeLng as NSString).doubleValue
        
        
        let camera = GMSCameraPosition.camera(withLatitude: (lat), longitude: (lng), zoom: 15.35)
        self.googleMap?.animate(to: camera)
        
        let circleCenter = CLLocationCoordinate2DMake(lat, lng);
        
        let circle = GMSCircle(position: circleCenter, radius: 500)
        circle.fillColor = UIColor(hexString: "40FFF460")
        circle.strokeColor = UIColor.clear
        circle.strokeWidth = 0
        circle.map = googleMap
        var no_of_result = 0
        for (index, item) in array.enumerated() {
            let user = item
            
            let d = user.distance.replacingOccurrences(of: "m", with: "")
            let w = user.workDistance?.replacingOccurrences(of: "m", with: "") ?? "0"
            var latitude: Double!
            var longitude: Double!
            let distance = Int(d) ?? 0
            let workDistance = Int(w) ?? 0
            
            if(distance < workDistance){
                latitude = Double(user.home_lat) ?? 0.0
                longitude = Double(user.home_lng) ?? 0.0
            }
            else {
                latitude = Double(user.work_lat) ?? 0.0
                longitude = Double(user.work_lng) ?? 0.0
            }
            
            if(index == 0){
                let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 15.35)
                self.googleMap?.animate(to: camera)
            }
        
            
            let state_marker = GMSMarker()
            // I have taken a pin image which is a custom image
            let markerImage = imageWithImage(image: UIImage(named: "ic_map_marker.png")!, scaledToSize: CGSize(width: 30.0, height: 32.0))
            let markerView = UIImageView(image: markerImage)
            state_marker.iconView = markerView
            
            var lat = Double(item.home_lat)
            var lng = Double(item.home_lng)
            
            
            for (i, ite) in array.enumerated(){
                if(i == index){
                    continue
                }
                else {
                    let random = arc4random_uniform(500) + 200;
                    let num = Double(Int(random)) / 1000000

                    let coordinate = CLLocation(latitude: latitude, longitude: longitude)
                    let coordinate2 = CLLocation(latitude: Double(ite.home_lat)!, longitude: Double(item.home_lng) ?? 00)
                    let coordinate3 = CLLocation(latitude: Double(ite.work_lat) ?? 0.0, longitude: Double(item.work_lng) ?? 0.0)
                    let distance1 = coordinate.distance(from: coordinate2)
                    let distance2 = coordinate.distance(from: coordinate3)
                    if(distance1 <= 100){
                        latitude = latitude + num
                        longitude = longitude + num
                    }
                    if(distance2 <= 100){
                        latitude = latitude + num
                        longitude = longitude + num
                    }
                }
            }
            
            state_marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            state_marker.title = item.username
            state_marker.userData = item
            state_marker.map = googleMap
           
            
            no_of_result += 1
        }
        
        if(language == "en"){
            self.btnResults.setTitle("Found \(no_of_result) results near you", for: .normal)
        }
        else {
            self.btnResults.setTitle("מקומות בקרבתך \(no_of_result) מצאתי", for: .normal)
        }
    }
    
    
}


//MARK:- MAPS
extension AddressViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        var currentZoom = mapView.camera.zoom
        print("Zoom \(currentZoom)")
        
        if(marker.userData == nil){
            return true
        }
        
        let user = marker.userData as! User
        print("You tapped : \(user.id), \(marker.position.latitude),\(marker.position.longitude), \(user.username)")
        
        if(user.id == self.user_id){
            if(language == "en"){
                self.view.makeToast("This is you")
            }
            else {
                self.view.makeToast("זה אתה")
            }
            return true
        }

        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        postController3 = storyboard.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        postController3.user_id = user.id
        postController3.delegate = self
        addChild(postController3)
        postController3.view.frame = self.view.bounds
        self.view.addSubview(postController3.view)
        postController3.didMove(toParent: self)

        isOccupationHidden = true
        AddressViewController.isActive = false

        return true // or false as needed.
    }
}

//MARK:- MARKER CLUSTERING

extension AddressViewController: GMUClusterManagerDelegate, GMUClusterRendererDelegate {
   
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
      var selectedArray = [User]()
        for item in cluster.items {
            if let i = item as? POIItem {
                let user_id = i.user_id
                for user in self.array {
                    if(user_id == user.id){
                        selectedArray.append(user)
                    }
                }
            }
        }
        
        let storyboard = UIStoryboard(name: storyboard_name, bundle: nil)
        postController4 = storyboard.instantiateViewController(withIdentifier: "UsersListViewController") as! UsersListViewController
        postController4.user_id = self.user_id
        postController4.array = selectedArray
        postController4.delegate = self
        addChild(postController4)
        postController4.view.frame = self.view.bounds
        self.view.addSubview(postController4.view)
        postController4.didMove(toParent: self)

        isOccupationHidden = true
        AddressViewController.isActive = false
        
      return true
    }
    
    private func generateClusterItems() {
        var no_of_result = 0
        for index in 0..<array.count {
            
            let user = array[index]
            
            let d = user.distance.replacingOccurrences(of: "m", with: "")
            let w = user.workDistance?.replacingOccurrences(of: "m", with: "") ?? "0"
            var latitude: Double!
            var longitude: Double!
            let distance = Int(d) ?? 0
            let workDistance = Int(w) ?? 0
            
            if(distance < workDistance){
                latitude = Double(user.home_lat) ?? 0.0
                longitude = Double(user.home_lng) ?? 0.0
            }
            else {
                latitude = Double(user.work_lat) ?? 0.0
                longitude = Double(user.work_lng) ?? 0.0
            }
            
            
            let MomentaryLatitude = latitude
            let MomentaryLongitude = longitude
            
//            let lat = MomentaryLatitude
//            let lng = MomentaryLongitude
            let name = array[index].username
            let user_id = array[index].id
            let item = POIItem(position: CLLocationCoordinate2DMake(MomentaryLatitude!, MomentaryLongitude!), name: name, user_id: user_id, index: index)
            clusterManager.add(item)
            no_of_result += 1
        }
        
        if(language == "en"){
            self.btnResults.setTitle("Found \(no_of_result) results near you", for: .normal)
        }
        else {
            self.btnResults.setTitle("מקומות בקרבתך \(no_of_result) מצאתי", for: .normal)
        }
    }
    
//    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
//        var infoWindow = Bundle.main.loadNibNamed("MarkerInfoView", owner: self, options: nil)?.first as! MarkerInfoView
//        infoWindow.titleLabel.text = marker.title
//        infoWindow.snippetLabel.text = marker.snippet
//
//        infoWindow.frame = CGRect(x: 0, y: 0, width: 180, height: 70)
//
//        return infoWindow
//    }
//
//    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
//        let myData = marker.userData as! [String: Any]
//        let index = myData["index"] as! Int
//        print(array[index].id)
//        performSegue(withIdentifier: "toStory", sender: index)
//    }
    
    func renderer(_ renderer: GMUClusterRenderer, willRenderMarker marker: GMSMarker) {
        var index = 0
        if let poiItem = marker.userData as? POIItem {
            marker.title = poiItem.name
            
            var myData = Dictionary<String, Any>()
            myData["index"] = poiItem.index
            marker.userData = self.array[poiItem.index]
            
            if(poiItem.user_id == self.user_id){
                marker.icon = GMSMarker.markerImage(with: UIColor(hexString: "#7CFC00"))
            }
            else {
                marker.icon = GMSMarker.markerImage(with: UIColor(hexString: "#FF0000"))
            }
            index += 1
        }
    }


     /// Returns a random value between -1.0 and 1.0.
     private func randomScale() -> Double {
       return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
     }
}




//MARK:- PROTOCOL OF OCCUPATION
extension AddressViewController: isOccupationSelected, UsersListDelegate {
    
    func closeController() {
        goBack()
    }
    
    func select(name: String, type: String, id: String, parentId: String) {
        goBack()
        if type == "occupation" {
            txtOccupation.text = name
            if(!name.isEmpty){
                self.btnDeleteOccupation.isHidden = false
            }
            self.txtFun.text = ""
            self.txtSecondRadius.text = ""
            self.btnDeleteFun.isHidden = true
            self.btnDeleteRadius2.isHidden = true
            self.occupation_id = id
            self.occupationParentId = parentId
            self.fun_id = nil
            self.funParentId = nil
        }
        else {
            txtFun.text = name
            if(!name.isEmpty){
                self.btnDeleteFun.isHidden = false
            }
            self.txtOccupation.text = ""
            self.txtRadius.text = ""
            self.btnDeleteOccupation.isHidden = true
            self.btnDeleteRadius1.isHidden = true
            self.fun_id = id
            self.funParentId = parentId
            self.occupation_id = nil
            self.occupationParentId = nil
        }
    }
    
}


/// Point of Interest Item which implements the GMUClusterItem protocol.
class POIItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    var name: String!
    var user_id: String!
    var index: Int!
    init(position: CLLocationCoordinate2D, name: String, user_id: String, index: Int) {
        self.position = position
        self.name = name
        self.user_id = user_id
        self.index = index
    }
}

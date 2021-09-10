//
//  AppDelegate.swift
//  Keepco
//
//  Created by Usman Meraj on 4/28/20.
//  Copyright © 2020 Usman Meraj. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import Firebase

var storyboard_name: String!
var language = "en"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let googleApiKey = "AIzaSyAVaq62zys4bwmie0BzVQ1WH2hDxEIvmcs"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSPlacesClient.provideAPIKey("AIzaSyAVaq62zys4bwmie0BzVQ1WH2hDxEIvmcs")
        GMSServices.provideAPIKey(googleApiKey)
        FirebaseApp.configure()
                
        let lang = UserDefaults.standard.string(forKey: Config.LANGUAGE) ?? "en"
        if(lang == "en"){
            storyboard_name = "Main"
            language = "en"
        }
        else {
            storyboard_name = "MainHe"
            language = "he"
        }

        
        let is_logged_in = UserDefaults.standard.bool(forKey: Config.IS_LOGGED_IN) ?? false
            if(is_logged_in) {
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                let story = UIStoryboard(name: storyboard_name, bundle: nil)
                
                let initialViewController = story.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
                
            }
            else {
                let Main = UIStoryboard(name: storyboard_name, bundle: nil).instantiateViewController(withIdentifier: "ViewController");
                self.window?.rootViewController = Main
                self.window?.makeKeyAndVisible()
        }
            
            return true
        }

}


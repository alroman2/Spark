//
//  AppDelegate.swift
//  Spark
//
//  Created by Alex Roman on 10/10/21.
//

import UIKit
import CoreHaptics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //application setup vars
    var supportsHaptics: Bool = false
    var deviceOrientation = UIInterfaceOrientationMask.portrait
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        isHapticEnginePresent()
        UIInterfaceOrientationMask(rawValue: UIInterfaceOrientationMask.portrait.rawValue)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

   
    
     func isHapticEnginePresent(){
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        supportsHaptics = hapticCapability.supportsHaptics
    }
}


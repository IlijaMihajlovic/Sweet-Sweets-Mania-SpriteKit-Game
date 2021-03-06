//
//  AppDelegate.swift
//  Sweet Sweets Mania
//
//  Created by Ilija Mihajlovic on 4/18/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        let gameViewController = GameViewController()
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = gameViewController
    
   
        SSMManager.shared.launch()
        StoreReviewManger.incrementAppOpenedCount()
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }

}


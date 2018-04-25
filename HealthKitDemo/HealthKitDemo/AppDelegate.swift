//
//  AppDelegate.swift
//  HealthKitDemo
//
//  Created by Abhishek Thapliyal on 4/23/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import UIKit
import HealthKit
import Firebase
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let healthStore = HKHealthStore()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //WATCH KIT SESSION
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
                
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        CoreDataStack.shared.saveContext()
    }

    // AUTHORIZATION FOR WATCH
    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        self.healthStore.handleAuthorizationForExtension { (success, error) in
            print(success)
            print(error)
        }
    }

    func application(_ application: UIApplication,
                     handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?,
                     reply: @escaping ([AnyHashable : Any]?) -> Void) {
        print("USER INFO: \(userInfo)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("SESSION USER INFO: \(message)")
        NotificationCenter.default.post(name:  Notification.Name(rawValue: "APP_EXTENSION_REQUEST"),
                                        object: nil,
                                        userInfo: message)
    }
    
}

extension AppDelegate: WCSessionDelegate {
    
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?) {
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}


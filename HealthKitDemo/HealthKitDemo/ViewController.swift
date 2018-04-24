//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by Abhishek Thapliyal on 4/23/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotification(_:)),
                                               name: NSNotification.Name("APP_EXTENSION_REQUEST"),
                                               object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        FirebaseManager.shared.add(item: HealthData(heartRate: 44, timeStamp: "1234567890"))
    }
    
    @objc func handleNotification(_ notification: Notification) {
        let alert = UIAlertController(title: "WATCH",
                                      message: notification.object.debugDescription,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


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
    }
    
    @objc func handleNotification(_ notification: Notification) {
        guard let object = notification.userInfo else { return }
        let healthData = HealthData(heartRate: object["rate"] as! String,
                              timeStamp: object["timestamp"] as! String)
        
        CoreDataManager.shared.addData(data: healthData)
        
        print("COUNT : \(CoreDataManager.shared.rowCount())")
//        FirebaseManager.shared.add(item: data)
        
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


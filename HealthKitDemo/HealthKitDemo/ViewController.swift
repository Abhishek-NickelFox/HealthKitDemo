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

    let heartRateQueue = HeartRateQueue<HealthData>()
    
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
        FirebaseManager.shared.add(item: HealthData(heartRate: "44", timeStamp: "1234567890"))
    }
    
    @objc func handleNotification(_ notification: Notification) {
        guard let object = notification.userInfo else { return }
        let data = HealthData(heartRate: object["rate"] as! String,
                              timeStamp: object["timestamp"] as! String)
        heartRateQueue.enqueue(item: data)
        heartRateQueue.traverse()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


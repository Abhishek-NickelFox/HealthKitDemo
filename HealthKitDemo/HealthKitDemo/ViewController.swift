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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        FirebaseManager.shared.add(item: HealthData(heartRate: 44, timeStamp: "1234567890"))
    }
    
}


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
        self.authorize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func authorize() {
        HealthManager.shared.authorization { (_, _) in
            self.getData()
        }
    }
    
    func getData() {
        do {
            let userAgeSexAndBloodType = try HealthManager.shared.getAgeSexAndBloodType()
            print(userAgeSexAndBloodType.age)
            print(userAgeSexAndBloodType.biologicalSex)
            print(userAgeSexAndBloodType.bloodType)
            print(userAgeSexAndBloodType)
        } catch let error {
            print(error)
        }
    }

}


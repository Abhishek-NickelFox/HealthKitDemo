//
//  ModelFile.swift
//  HealthKitDemo
//
//  Created by Abhishek on 24/04/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation

struct HealthData {
    
    var heartRate: String
    var timeStamp: String
    
    var dictionary: [String: Any] {
        return ["HeartRate": self.heartRate,
                "TimeStamp": self.timeStamp]
    }
}

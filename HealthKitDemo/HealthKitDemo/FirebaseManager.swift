//
//  FirebaseManager.swift
//  HealthKitDemo
//
//  Created by Abhishek on 24/04/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class FirebaseManager {
    
    static let shared = FirebaseManager()
    private let tableRef = Database.database().reference(withPath: "HealthKitDemo")
    
    private init() {
        
    }
    
    func add(item: HealthData) {
        self.tableRef.setValue(item.dictionary)
    }
    
}

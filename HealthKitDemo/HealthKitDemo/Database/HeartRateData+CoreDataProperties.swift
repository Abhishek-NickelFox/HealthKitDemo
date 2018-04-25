//
//  HeartRateData+CoreDataProperties.swift
//  HealthKitDemo
//
//  Created by Abhishek on 25/04/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//
//

import Foundation
import CoreData


extension HeartRateData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeartRateData> {
        return NSFetchRequest<HeartRateData>(entityName: "HeartRateData")
    }

    @NSManaged public var id: String?
    @NSManaged public var rate: String?
    @NSManaged public var timestamp: String?

}

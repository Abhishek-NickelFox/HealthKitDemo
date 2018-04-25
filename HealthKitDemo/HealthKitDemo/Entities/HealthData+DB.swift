//
//  CoreDataManager.swift
//  HealthKitDemo
//
//  Created by Abhishek on 25/04/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import CoreData
import Foundation

class CoreDataManager {
    
    let context = CoreDataStack.shared.context
    
    func rowCount() -> Int {
        var count = 0
        let entityDesc = NSEntityDescription.entity(forEntityName: "HeartRateData", in: context)
        guard let entity = entityDesc else { return 0 }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
    
        do {
            count = try context.count(for: fetchRequest)
        } catch let error as NSError {
            print("Unable to get COUNT \(error), \(error.userInfo)")
        }
        
        return count
    }
    
    func addData() {
        
        let entityDesc = NSEntityDescription.entity(forEntityName: "HeartRateData", in: context)
        guard let entity = entityDesc else { return }
        
        let heartRateData = HeartRateData(entity: entity, insertInto: context)
        
        let uuid = UUID().uuidString
        heartRateData.id = uuid
        heartRateData.rate = self.heartRate
        heartRateData.timestamp = self.timeStamp
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Unable not save in DB \(error), \(error.userInfo)")
        }
    }
    
    public func deleteEmployee(id: String) {
       
        let entityDesc = NSEntityDescription.entity(forEntityName: "HeartRateData", in: context)
        guard let entity = entityDesc else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        let predicate = NSPredicate(format:"id == %@", id)
        fetchRequest.predicate = predicate
        
        do {
            let results = try context.fetch(fetchRequest)
            guard let obj = (results as? [HeartRateData])?.first else { return }
            context.delete(obj)
            try context.save()
        } catch let error as NSError {
            print("Unable to Delete Data \(error), \(error.userInfo)")
        }
    }
    
    func removeAll() {
        let context = CoreDataManager.shared.context
        let entity = NSEntityDescription.entity(forEntityName: "HeartRateData", in: context)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        do {
            let results = try context.fetch(fetchRequest) as! [HeartRateData]
            results.forEach { context.delete($0) }
            try context.save()
        } catch let error as NSError {
            print("Unable to Delete Data \(error), \(error.userInfo)")
        }
    }
    
}

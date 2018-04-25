//
//  Queue.swift
//  HKer
//
//  Created by Abhishek on 28/03/18.
//  Copyright © 2018 Marvel. All rights reserved.
//

import Foundation

class HeartRateQueue<T> {
    
    private var array: [T] = []
    
    func dequeue() -> T? {
        let popItem = self.array.removeFirst()
        return popItem
    }
    
    func enqueue(item: T) {
        array.append(item)
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    var count: Int {
        return self.array.count
    }
    
    func removeAll() {
        self.array.removeAll()
    }
    
    func traverse() {
        self.array.forEach { print($0) }
    }
    
}

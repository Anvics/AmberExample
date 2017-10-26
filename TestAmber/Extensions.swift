//
//  Extensions.swift
//  TrainBrain
//
//  Created by Nikita Arkhipov on 10.09.17.
//  Copyright © 2017 Nikita Arkhipov. All rights reserved.
//

import Foundation

extension Double{
    func string(precision: Int) -> String{
        return NSString(format: "%.\(precision)f" as NSString, self) as String
    }
}

extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}

extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}

extension Array{
    var random: Element{
        let i = Int(arc4random_uniform(UInt32(count)))
        return self[i]
    }
}

enum SomeOrNothing<T>{
    case some(T)
    case nothing
}

extension TimeInterval{
    static var day: TimeInterval{
        return 60 * 60 * 24
    }
    
    static var week: TimeInterval{
        return day * 7
    }
}

extension Bool{
    static var random: Bool{ return arc4random_uniform(2) == 0 }
}

extension Int{
    static func random(from: Int = 0, to: Int = 9) -> Int{
        if from >= to { return from }
        return Int(arc4random_uniform(UInt32(to - from) + 1)) + from
    }
    
    var dividers: [Int]{
        var divs = [Int]()
        for i in 1...self{
            if self % i == 0 { divs.append(i) }
        }
        return divs
    }
}

func GCD_Background(_ block: @escaping () -> ()){
    DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.background).async(execute: {
        block()
    })
}

func GCD_Main(_ block: @escaping () -> ()){
    DispatchQueue.main.async(execute: {
        block()
    })
}

//
//  Int.swift
//  ExSwift
//
//  Created by pNre on 03/06/14.
//  Copyright (c) 2014 pNre. All rights reserved.
//

import Foundation

extension Int {
    
    /**
    *  Calls a function self times
    *  @param call Function to call
    */
    func times <T> (call: () -> T) {
        self.times({
            (index: Int) -> T in
            return call()
        })
    }

    /**
    *  Calls a function self times (with no return value)
    *  @param call Function to call
    */
    func times (call: () -> ()) {
        self.times({
            (index: Int) -> () in
            call()
        })
    }

    /**
    *  Calls a function self times
    *  @param call Function to call
    */
    func times <T> (call: (Int) -> T) {
        (0..self).each { index in call(index); return }
    }

    /**
    *  Checks if a number is even
    *  @return True if self is even
    */
    func isEven () -> Bool {
        return (self % 2) == 0
    }
    
    /**
    *  Checks if a number is odd
    *  @return True if self is odd
    */
    func isOdd () -> Bool {
        return !self.isEven()
    }

    /**
     *  Iterates call, passing in integer values from self up to and including limit.
     */
    func upTo (limit: Int, call: (Int) -> ()) {
        if limit < self {
            return
        }

        (self...limit).each(call)
    }
    
    /**
     * Iterates call, passing in integer values from self down to and including limit.
     */
    func downTo (limit: Int, call: (Int) -> ()) {
        if limit > self {
            return
        }

        Array(limit...self).reverse().each(call)
    }

    /**
     * Computes the value of self clamped to a range defined by `range`
     */
    func clamp (range: Range<Int>) -> Int {
        if self > range.endIndex - 1 {
            return range.endIndex - 1
        } else if self < range.startIndex {
            return range.startIndex
        }
        
        return self
    }
    
    func clamp (min: Int, max: Int) -> Int {
        return clamp(min...max)
    }

    /**
     *  Checks if self is in range
     */
    func isIn (range: Range<Int>, strict: Bool = false) -> Bool {
        if strict {
            return range.startIndex < self && self < range.endIndex - 1
        }

        return range.startIndex <= self && self <= range.endIndex - 1
    }

    /**
     * Returns an array of integers where each element is a digit of `self`
     */
    func digits () -> Array<Int> {
        var result = Int[]()
        
        for char in String(self) {
            let string = String(char)
            if let toInt = string.toInt() {
                result.append(toInt)
            }
        }
    
        return result
    }
    
    /**
     * Absolute value
     */
    func abs () -> Int {
        return Swift.abs(self)
    }
    
    /**
    *  Greatest common divisor of `self` and `n`
    */
    func gcd (n: Int) -> Int {
        return n == 0 ? self : n.gcd(self % n)
    }
    
    /**
    *  Least common multiple of `self` and `n`
    */
    func lcm (n: Int) -> Int {
        return (self * n).abs() / gcd(n)
    }
    
    /**
    *  Returns a random integer between `min` and `max` (inclusive).
    *  @return Random integer
    */
    static func random(min: Int = 0, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
}


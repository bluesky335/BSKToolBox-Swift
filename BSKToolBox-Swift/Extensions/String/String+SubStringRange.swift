//
//  String+SubStringRange.swift
//  LinkGame
//
//  Created by 刘万林 on 2018/10/18.
//  Copyright © 2018 ChaungMiKeJi. All rights reserved.
//

import Foundation

extension String {
    subscript(range: ClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex...endIndex])
    }

    subscript(range: Range<Int>) -> String {
        guard range.lowerBound < range.upperBound else {
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy: range.upperBound - 1)
        return String(self[startIndex...endIndex])
    }

    subscript(range: PartialRangeThrough<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: 0)
        let endIndex   = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex...endIndex])
    }

    subscript(range: PartialRangeUpTo<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: 0)
        let endIndex   = self.index(self.startIndex, offsetBy: range.upperBound - 1)
        return String(self[startIndex...endIndex])
    }

    subscript(range: PartialRangeFrom<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy: self.count - 1)
        return String(self[startIndex...endIndex])
    }

    subscript(i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

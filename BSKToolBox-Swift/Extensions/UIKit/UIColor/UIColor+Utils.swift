//
//  UIColor+Utils.swift
//  LinkGame
//
//  Created by 刘万林 on 2018/5/9.
//  Copyright © 2018年 ChaungMiKeJi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    public convenience init(_ HexString:String) {
        var R:CGFloat = 0.0
        var G:CGFloat = 0.0
        var B:CGFloat = 0.0
        var A:CGFloat = 1.1
        var HexString = HexString
        if HexString.starts(with: "#") {
            HexString.removeFirst()
        }
        if HexString.isMatch(regular: "^[a-fA-F0-9]{8}$") {

            let aIndex = HexString.index(HexString.startIndex, offsetBy: 2)
            let rIndex = HexString.index(aIndex, offsetBy: 2)
            let gIndex = HexString.index(rIndex, offsetBy: 2)

            let Astr = String(HexString[..<aIndex])
            let Rstr = String(HexString[aIndex..<rIndex])
            let Gstr = String(HexString[rIndex..<gIndex])
            let Bstr = String(HexString[gIndex...])
            let colorFull = CGFloat(Int("FF",radix:16)!)

            A = CGFloat(Int(Astr,radix:16)!)/colorFull
            R = CGFloat(Int(Rstr,radix:16)!)/colorFull
            G = CGFloat(Int(Gstr,radix:16)!)/colorFull
            B = CGFloat(Int(Bstr,radix:16)!)/colorFull
        } else if HexString.isMatch(regular: "^[a-fA-F0-9]{6}$"){

            let rIndex = HexString.index(HexString.startIndex, offsetBy: 2)
            let gIndex = HexString.index(rIndex, offsetBy: 2)

            let Rstr = String(HexString[..<rIndex])
            let Gstr = String(HexString[rIndex..<gIndex])
            let Bstr = String(HexString[gIndex...])
            let colorFull = CGFloat(Int("FF",radix:16)!)

            R = CGFloat(Int(Rstr,radix:16)!)/colorFull
            G = CGFloat(Int(Gstr,radix:16)!)/colorFull
            B = CGFloat(Int(Bstr,radix:16)!)/colorFull

        }else if HexString.isMatch(regular: "^[a-fA-F0-9]{3}$"){

            let rIndex = HexString.index(HexString.startIndex, offsetBy: 1)
            let gIndex = HexString.index(rIndex, offsetBy: 1)

            let Rstr = String(HexString[..<rIndex])
            let Gstr = String(HexString[rIndex..<gIndex])
            let Bstr = String(HexString[gIndex...])
            let colorFull = CGFloat(Int("F",radix:16)!)

            R = CGFloat(Int(Rstr,radix:16)!)/colorFull
            G = CGFloat(Int(Gstr,radix:16)!)/colorFull
            B = CGFloat(Int(Bstr,radix:16)!)/colorFull
        }
        self.init(red: R, green: G, blue: B, alpha: A)
    }
}

//
//  String+Attribute.swift
//  BSKToolBox-Swift
//
//  Created by cmsy on 2018/5/28.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

extension String{
   public func addAttribute(_ attrs:[NSAttributedStringKey:Any],range:NSRange) -> NSMutableAttributedString {
        let mAttributeStr = NSMutableAttributedString(string: self)
        mAttributeStr.addAttributes(attrs, range: range)
        return mAttributeStr
    }
}


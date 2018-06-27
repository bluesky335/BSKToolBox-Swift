//
//  String+PinYin.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/6/15.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

public extension String{
    var firstPinYin:String {
        guard self.count>0 else {
            return self
        }
        let mutableString = NSMutableString(string: self)
        //        把汉字转为拼音
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        //        去掉拼音的音标
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        return mutableString.substring(to: 1)
    }
}

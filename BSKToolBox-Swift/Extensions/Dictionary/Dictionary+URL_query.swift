//
//  File.swift
//  BSKToolBox-Swift
//
//  Created by cmsy on 2018/5/28.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

extension Dictionary where Key:StringProtocol {
    public var urlQueryString:String {
        var str = "?"
        for (key,value) in self{
            str.append("\(key)=\(value)")
        }
        return str
    }
}

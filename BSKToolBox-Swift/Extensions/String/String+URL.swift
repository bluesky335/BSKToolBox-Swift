//
//  String+URL.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/26.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

public extension String
{
    var toURL:URL?{
        return URL(string: self)
    }

    var toHttpsURL:URL?{
        return URL(string: self.replacingOccurrences(of: "http://", with: "https://"))
    }

}

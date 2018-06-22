//
//  URL.swift
//  BSKToolBox-Swift
//
//  Created by cmsy on 2018/5/23.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

extension URL{
    
   public var queryParameters:[String:String]?{
        guard let query = self.query?.removingPercentEncoding else {return nil}
        let parametersArray = query.split(separator: "&").map{String($0)}.map{$0.split(separator: "=").map{String($0)}}
        var parameters = [String:String]()
        for str in parametersArray {
            if str.count>1 {
                parameters[str[0]] = str[1]
            }else if str.count>0{
                parameters[str[0]] = ""
            }
        }
        return parameters
    }
}

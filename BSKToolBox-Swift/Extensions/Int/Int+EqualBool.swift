//
//  Int+==.swift
//  BSKToolBox-Swift
//
//  Created by cmsy on 2018/5/30.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

public extension Int{
    static public func == (left:Int,right:Bool) -> Bool{
        let bool = left != 0
        return bool == right
    }
    
    static public func == (left:Bool,right:Int) -> Bool{
        let bool = right != 0
        return bool == left
    }
    
    static public func != (left:Int,right:Bool) -> Bool{
        let bool = left != 0
        return bool != right
    }
    
    static public func != (left:Bool,right:Int) -> Bool{
        let bool = right != 0
        return bool != left
    }
    
    public var boolValue:Bool{
        return self != 0
    }
    
}

public extension Bool{
    public var intValue:Int{
        return self ? 1 : 0
    }
}

//
//  BSKUtils.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/25.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import UIKit

public class BSKUtils {

}


public extension BSKUtils{

    public static func runOnMainThreadSync( closure: ()->Void)->Void{
        if Thread.isMainThread {
            closure()
        }else{
            DispatchQueue.main.sync(execute: closure)
        }
    }
    public static func runOnMainThreadAsync( closure: @escaping ()->Void)->Void{
        if Thread.isMainThread {
            closure()
        }else{
            DispatchQueue.main.async(execute: closure)
        }
    }
}

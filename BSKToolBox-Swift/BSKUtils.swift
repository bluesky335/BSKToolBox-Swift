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


public func debugLog(_ items:Any...,file:String = #file,line:Int = #line){

    #if DEBUG
    var strs = [String]()
    for item in items {
        strs.append("\(item)")
    }
    let url = URL(fileURLWithPath: file)
    let fileName = url.lastPathComponent
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
    print("┏━【\(formatter.string(from: date))】行:\(line) 文件:\(fileName)\n┗━ \(strs.joined(separator: " "))\n")
    #endif
}

extension BSKUtils{

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
    
   public static var topViewController:UIViewController?{
    guard let rootVc = UIApplication.shared.windows[0].rootViewController else{return nil}

    var resultVc = rootVc

    var controllers = [rootVc]
        while controllers.count != 0 {
            resultVc = controllers.removeFirst()
            if let nvc = resultVc as? UINavigationController{
                if let topvc = nvc.topViewController {
                    controllers.append(topvc)
                }
                continue
            }else if let tVc = resultVc as? UITabBarController {
                if let selectedVc = tVc.selectedViewController{
                    controllers.append(selectedVc)
                }
                continue
            }else if let pvc = resultVc.presentedViewController {
                controllers.append(pvc)
            }
        }
        return resultVc
    }

}

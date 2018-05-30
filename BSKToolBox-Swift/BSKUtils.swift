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
        var vc = UIApplication.shared.windows[0].rootViewController
        while vc != nil {
            if vc?.isKind(of: UINavigationController.self) ?? false {
                let nvc = vc as! UINavigationController
                vc = nvc.topViewController
                continue
            }else if vc?.isKind(of: UITabBarController.self) ?? false {
                let tvc = vc as! UITabBarController
                vc = tvc.selectedViewController
                continue
            }else{
               let pvc = vc?.presentedViewController
                if pvc == nil{
                    return vc
                }else{
                    vc = pvc
                }
            }
        }
        return vc
    }

}

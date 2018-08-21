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

   public static func getImageType(data:Data)->String{
        let int = data.withUnsafeBytes({ (p:UnsafePointer<UInt8>) -> UInt8 in
            return p.pointee
        })
        switch int {
        case 0xff:
            return "image/jpeg"
        case 0x89:
            return "image/png"
        case 0x47:
            return "image/gif"
        case 0x49: fallthrough
        case 0x4D:
            return "image/tiff"
        case 0x52:
            if  data.count >= 12,
                let range = Range(NSRange(location: 0, length: 12)),
                let str = String(data: data.subdata(in: range) , encoding: .utf8),
                str.hasPrefix("RIFF"),
                str.hasSuffix("WEBP")
            {
                return "image/webp";
            }
            return "application/octet-stream"

        default:
            return "application/octet-stream"
        }
    }

    public static func getImageSuffix(data:Data)->String?{
        let int = data.withUnsafeBytes({ (p:UnsafePointer<UInt8>) -> UInt8 in
            return p.pointee
        })
        switch int {
        case 0xff:
            return ".jpg"
        case 0x89:
            return ".png"
        case 0x47:
            return ".gif"
        case 0x49: fallthrough
        case 0x4D:
            return ".tiff"
        case 0x52:
            if  data.count >= 12,
                let range = Range(NSRange(location: 0, length: 12)),
                let str = String(data: data.subdata(in: range) , encoding: .utf8),
                str.hasPrefix("RIFF"),
                str.hasSuffix("WEBP")
            {
                return ".webp";
            }
            return nil

        default:
            return nil
        }
    }

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

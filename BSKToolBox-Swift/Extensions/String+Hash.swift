//
//  String+Hash.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/26.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

public extension String{
   public var sha1:String{
        let nsstr = self as NSString
        return nsstr.bsk_sha1()
    }

   public var sha224:String{
        let nsstr = self as NSString
        return nsstr.bsk_sha224()
    }

   public var sha256:String{
        let nsstr = self as NSString
        return nsstr.bsk_sha256()
    }

   public var sha384:String{
        let nsstr = self as NSString
        return nsstr.bsk_sha384()
    }

   public var sha512:String{
        let nsstr = self as NSString
        return nsstr.bsk_sha512()
    }

   public var MD5:String{
        let nsstr = self as NSString
        return nsstr.bsk_MD5()
    }
}

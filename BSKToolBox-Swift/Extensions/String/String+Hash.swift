//
//  String+Hash.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/26.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation
import CommonCrypto


public extension Data {
    var hexString:String{
        let bytes = [UInt8](self)
        var str = ""
        for byte in bytes {
            let v = String(format:"%02x",byte)
            str+=v
        }
        return str
    }
}


public extension String{
   
    var sha1: String {
        let data = (self.data(using: .utf8) ?? Data()) as NSData
        var hash = [UInt8].init(repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(data.bytes, CC_LONG(data.length), &hash)
        let res = NSData(bytes: hash, length: Int(CC_SHA1_DIGEST_LENGTH)) as Data
        return res.hexString
    }
    
    var sha224: String {
        let data = (self.data(using: .utf8) ?? Data()) as NSData
        var hash = [UInt8].init(repeating: 0, count: Int(CC_SHA224_DIGEST_LENGTH))
        CC_SHA224(data.bytes, CC_LONG(data.length), &hash)
        let res = NSData(bytes: hash, length: Int(CC_SHA224_DIGEST_LENGTH)) as Data
        return res.hexString
    }
    
    var sha256: String {
        let data = (self.data(using: .utf8) ?? Data()) as NSData
        var hash = [UInt8].init(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(data.bytes, CC_LONG(data.length), &hash)
        let res = NSData(bytes: hash, length: Int(CC_SHA256_DIGEST_LENGTH)) as Data
        return res.hexString
    }
    
    var sha384: String {
        let data = (self.data(using: .utf8) ?? Data()) as NSData
        var hash = [UInt8].init(repeating: 0, count: Int(CC_SHA384_DIGEST_LENGTH))
        CC_SHA384(data.bytes, CC_LONG(data.length), &hash)
        let res = NSData(bytes: hash, length: Int(CC_SHA384_DIGEST_LENGTH))as Data
        return res.hexString
    }
    
    var sha512: String {
        let data = (self.data(using: .utf8) ?? Data()) as NSData
        var hash = [UInt8].init(repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        CC_SHA512(data.bytes, CC_LONG(data.length), &hash)
        let res = NSData(bytes: hash, length: Int(CC_SHA512_DIGEST_LENGTH))as Data
        return res.hexString
    }
    
    var MD5: String {
        let data = (self.data(using: .utf8) ?? Data()) as NSData
        var hash = [UInt8].init(repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(data.bytes, CC_LONG(data.length), &hash)
        let res = NSData(bytes: hash, length: Int(CC_MD5_DIGEST_LENGTH))as Data
        return res.hexString
    }
}

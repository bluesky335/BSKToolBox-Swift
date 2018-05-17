//
//  JSONCodeable.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/5/15.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//


extension Decodable {
    static func decode(from json:Data?)->Self?{
        guard let json = json else {return nil}
        return try?JSONDecoder().decode(Self.self, from: json)
    }
    static func decode(from json:String?)->Self?{
        guard let json = json else {return nil}
        guard let data = json.data(using: .utf8)else{return nil}
        return try?JSONDecoder().decode(Self.self, from: data)
    }
    static func decode(from json:[String:Any]?)->Self?{
        guard let json = json else {return nil}
        guard let data = try?JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else {return nil}
        return try?JSONDecoder().decode(Self.self, from: data)
    }
}

extension Encodable{

    public var jsonData:Data? {
        let encoder = JSONEncoder()
        #if DEBUG
        encoder.outputFormatting = .prettyPrinted
        #endif
        return try?encoder.encode(self)
    }

    public var jsonStr:String? {
        if let data = self.jsonData {
            let str = String(data: data, encoding: .utf8)
            return str
        }
        return nil
    }

    public var jsonDic:[String:Any]? {
        guard let data = self.jsonData else {return nil}
        guard let dic = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)else{return nil}
        return dic as? [String:Any]
    }
}

extension CustomStringConvertible where Self:Codable{

    public var description: String {
        return self.jsonStr ?? "<error>"
    }
}

public typealias Json2Model = Codable&CustomStringConvertible


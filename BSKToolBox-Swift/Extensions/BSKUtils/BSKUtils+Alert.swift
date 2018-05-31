//
//  File.swift
//  BSKToolBox-Swift
//
//  Created by cmsy on 2018/5/31.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation

public struct BSKActionItem{
    let title:String
    let style:UIAlertActionStyle
    let action:((_ action:UIAlertAction)->Void)?
    
    public init(title:String, style:UIAlertActionStyle = .default, action:((_ action:UIAlertAction)->Void)? = nil) {
        self.title = title
        self.style = style
        self.action = action
    }
    
}

public extension BSKUtils{
    
  public static func alert(title:String?,message:String?,style:UIAlertControllerStyle = .alert,actions:[BSKActionItem]) -> Void {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        for item in actions{
            let action = UIAlertAction(title: item.title, style: item.style, handler: item.action)
            alertVc.addAction(action)
        }
    self.topViewController?.present(alertVc, animated: true, completion: nil)
    }
}

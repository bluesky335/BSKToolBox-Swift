//
//  UIView+IBDesign.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/27.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import Foundation


public extension UIView{

    @IBInspectable public var cornerRadius:CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue

            self.layer.masksToBounds = newValue != 0
        }
    }
    @IBInspectable public var borderWidth:CGFloat {
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }


    @IBInspectable public var borderColor:UIColor? {
        get{
            if let color = self.layer.borderColor {
                return UIColor(cgColor:color)
            }else{
                return nil
            }
        }
        set{
            self.layer.borderColor = newValue?.cgColor
        }
    }
}

//
//  BSKEasterEgg.swift
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/6/21.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import UIKit

public class BSKEasterEgg: NSObject {
    public static func doEasterEggRandom(){
        let i = Int(arc4random_uniform(2))
        switch i {
        case 0:
            ScaleEasterEgg()
        case 1:
            RotationEasterEgg()
        default:break
        }
    }

    public static func ScaleEasterEgg(){

        let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimation.toValue = 20

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.8

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [cornerRadiusAnimation,scaleAnimation]

        animationGroup.autoreverses = true
        animationGroup.duration = 0.25
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationGroup.isRemovedOnCompletion = true
        animationGroup.fillMode = kCAFillModeRemoved
        UIApplication.shared.keyWindow?.layer.masksToBounds = true
        UIApplication.shared.keyWindow?.layer.add(animationGroup, forKey: "Easter_Egg")
    }

    public static func RotationEasterEgg(){

        let rotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotationAnimation.keyTimes = [0.0,0.25,0.5,1]
        rotationAnimation.values = [0,Double.pi/2.0,Double.pi,Double.pi]

        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes =   [0.0, 0.25, 0.5, 1]
        scaleAnimation.values =     [1,   0.5, 1,   1]

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotationAnimation,scaleAnimation]

        animationGroup.autoreverses = true
        animationGroup.duration = 2
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationGroup.isRemovedOnCompletion = true
        animationGroup.fillMode = kCAFillModeRemoved

        UIApplication.shared.keyWindow?.layer.add(animationGroup, forKey: "Easter_Egg")
    }
}

//
//  UIColor+Swift.swift
//  SK_TodayNews
//
//  Created by coder on 2019/3/22.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit
extension UIColor{
    
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) {
        self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha);
        
    }
}

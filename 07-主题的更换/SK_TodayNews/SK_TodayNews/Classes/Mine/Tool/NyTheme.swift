//
//  NyTheme.swift
//  SK_TodayNews
//
//  Created by coder on 2019/4/2.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import Foundation
// 换肤主题框架
import SwiftTheme

// 创建plist 文件设置换肤方案 创建default_theme.plist文件 和 night_theme.plist文件
// 通过切换plist文件的颜色设置


enum MyTheme:Int{
    case day = 0;
    case nignt = 1;
    static var before = MyTheme.day;
    static var current = MyTheme.day;
    
    // 静态方法换肤
    static func switchTo(_ theme:MyTheme){
        before = current;
        current = theme;
        switch theme {
        case .day:
            ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle);
        case .nignt:
            ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle);
            
        }
        
    }
    
    // 静态方法
    static func swichNight(_ isNight:Bool){
        switchTo(isNight ? .nignt : .day);
    }
    
    // 判断当前是否是夜间主题
    static func isNight()->Bool
    {
        return current == .nignt;
    }
    
    
    
}


//
//  SettingModel.swift
//  SK_TodayNews
//
//  Created by coder on 2019/4/18.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import Foundation

import HandyJSON

struct SettingModel:HandyJSON {
    var title:String = "";
    var subtitle:String = "";
    var rightTitle:String = "";
    var isHiddenSubTitle:Bool = false;
    var isHiddenSwitch:Bool = false;
    var isHiddenRightArraw:Bool = false;
    
}


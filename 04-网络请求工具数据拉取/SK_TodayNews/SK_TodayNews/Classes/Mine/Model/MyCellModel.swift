//
//  MyCellModel.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/23.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import Foundation
import HandyJSON


struct MyCellModel:HandyJSON {
	var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
}



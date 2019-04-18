//
//  UIViw+Extension.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/24.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit

protocol RegisterCellWithNib {
	
}



extension RegisterCellWithNib
{
	
	static var identifier:String!{
		return "\(self)";
	}
	
	static var nib:UINib!{
		return UINib.init(nibName: "\(self)", bundle: nil);
	}
	

}


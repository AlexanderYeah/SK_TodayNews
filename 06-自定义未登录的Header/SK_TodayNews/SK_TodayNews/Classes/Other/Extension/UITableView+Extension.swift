//
//  UITableView+Extension.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/24.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit

// 给tableview 扩展方法
extension UITableView
{
	
	func sk_registerCell<T:UITableViewCell>( cell:T.Type) where T:RegisterCellWithNib {
		if let nib:UINib = T.nib {
			register(nib, forCellReuseIdentifier: T.identifier);
		}else{
			register(cell, forCellReuseIdentifier: T.identifier);
		}
	}
	
	func sk_dequeueCell<T:UITableViewCell>(indexPath:IndexPath) ->T where T:RegisterCellWithNib {
		
		return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T;
	}
	
	
}



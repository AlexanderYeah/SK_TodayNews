//
//  NoLoginView.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/28.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit
import IBAnimatable
class NoLoginView: UIView {

	@IBOutlet weak var bgView: UIImageView!
	
	// 手机按钮
	@IBOutlet weak var mobileBtn: UIButton!
	
	// 微信登录按钮
	@IBOutlet weak var wechat: UIButton!
	//qq按钮
	@IBOutlet weak var qqBtn: UIButton!
	// 新浪按钮
	@IBOutlet weak var sinaBtn: UIButton!
	// 更多登录按钮
	@IBOutlet weak var moreBtn: UIButton!
	
	@IBOutlet weak var favoriteBtn: UIButton!
	
	@IBOutlet weak var historBtn: UIButton!
	
	@IBOutlet weak var dayAndNightBtn: UIButton!
	
	
	
	// 定义一个类方法创建文件
	class func headerView() -> NoLoginView {
		return Bundle.main.loadNibNamed("\(self)", owner: self, options: nil)?.last as! NoLoginView;
	}
	
}

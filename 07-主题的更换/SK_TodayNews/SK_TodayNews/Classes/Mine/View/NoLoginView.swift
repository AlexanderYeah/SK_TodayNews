//
//  NoLoginView.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/28.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit
import IBAnimatable
// 导入换肤框架
import SwiftTheme

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
	
	
    @IBOutlet weak var bottomView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
        // 设置默认的主题
        ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle);
        
        // 设置按钮的图片
        
        mobileBtn.theme_setImage("images.loginMobileButton", forState: UIControl.State.normal);
        wechat.theme_setImage("images.loginWechatButton", forState: UIControl.State.normal);
        qqBtn.theme_setImage("images.loginQQButton", forState: UIControl.State.normal);
        sinaBtn.theme_setImage("images.loginSinaButton", forState: UIControl.State.normal);
        favoriteBtn.theme_setImage("images.favoriteBtn", forState: UIControl.State.normal);
        historBtn.theme_setImage("images.historyBtn", forState: UIControl.State.normal);
        dayAndNightBtn.theme_setImage("images.dayNightBtn", forState: UIControl.State.normal);
        
        // 设置按钮标题颜色
        favoriteBtn.theme_setTitleColor("colors.textColor", forState: UIControl.State.normal);
        
        historBtn.theme_setTitleColor("colors.textColor", forState: UIControl.State.normal);
        
        dayAndNightBtn.theme_setTitleColor("colors.textColor", forState: UIControl.State.normal);
        
        // 背景色
        bottomView.theme_backgroundColor = "colors.cellBackgroudColor";
        
        
    }

	// 定义一个类方法创建文件
	class func headerView() -> NoLoginView {
		return Bundle.main.loadNibNamed("\(self)", owner: self, options: nil)?.last as! NoLoginView;
	}
    
    
    // 换肤按钮的点击
    @IBAction func dayAndNightSwitch(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected;
        
        MyTheme.swichNight(sender.isSelected);
        
        
        // 按钮点击的时候要把日间和白天设置保存到本地  下一次进入应用的时候进行再次加载
        UserDefaults.standard.set(sender.isSelected, forKey: "DayAndNight");
        
        // 同时通知tabbar 相应的去改变背景颜色 然后去tabbar控制器中进行监听 
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DayAndNightBtnClick"), object: sender.isSelected);
    
        
    }
}




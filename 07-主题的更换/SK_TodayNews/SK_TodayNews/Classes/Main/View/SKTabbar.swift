//
//  SKTabbar.swift
//  SK_TodayNews
//
//  Created by coder on 2019/3/21.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class SKTabbar: UITabBar {
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        // 设置一下换肤的颜色
        self.theme_barTintColor = "colors.cellBackgroudColor"
        
        // 添加一个自定义的按钮
        addSubview(self.pubBtn);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 自定义发布按钮
    private lazy var pubBtn:UIButton = {
   
        let pubBtn = UIButton(type: .custom)
        pubBtn.setBackgroundImage(UIImage.init(named: "feed_publish_44x44_"), for: .normal);
        pubBtn.setBackgroundImage(UIImage.init(named: "feed_publish_press_44x44_"), for: .selected);
        pubBtn.sizeToFit();
        return pubBtn;
    }()
    
    
    // layout subview
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 当前tab 的高度和宽度
        let width = self.frame.width;
        let height = self.frame.height;
        // 布局发布按钮
        pubBtn.center = CGPoint(x: width * 0.5, y:  height * 0.5 - 7);
        // 设置其他按钮的frame
        let btn_W:CGFloat = width * 0.2;
        let btn_H:CGFloat = height * 0.7;
        let btn_Y:CGFloat = 0.7;
        var idx = 0;
        for button in subviews{
            // 布局子按钮 如果不是UITabBarButton 类的 下面的布局代码不执行
            if !button.isKind(of: NSClassFromString("UITabBarButton")!) { continue }
            let buttonX = btn_W * (idx > 1 ? CGFloat(idx + 1) : CGFloat(idx))
            button.frame = CGRect(x: buttonX, y: btn_Y, width: btn_W, height: btn_H)
            idx += 1
        }
    }
    
    
}

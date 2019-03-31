//
//  SKTabBarController.swift
//  SK_TodayNews
//
//  Created by coder on 2019/3/21.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class SKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI();
    }
    
    
    //
    func setupUI() ->()
    {
        // 设置tabbar 的title 颜色
        UITabBar.appearance().tintColor = UIColor.red;

        // 添加子控制器
        addChildVC(vc: HomeVC(), title: "首页", imgName: "home_tabbar_32x32_", selectedImgName: "home_tabbar_press_32x32_");
        
        addChildVC(vc: VideoVC(), title: "西瓜视频", imgName: "video_tabbar_32x32_", selectedImgName: "video_tabbar_press_32x32_");
        
        addChildVC(vc: HuoShanVC(), title: "小视频", imgName: "huoshan_tabbar_32x32_", selectedImgName: "huoshan_tabbar_press_32x32_");
        addChildVC(vc: ProfileVC(), title: "我的", imgName: "mine_tabbar_32x32_", selectedImgName: "mine_tabbar_press_32x32_");
        
        // KVC 设置自定义的tabbar
        setValue(SKTabbar(), forKey: "tabBar");
        
    }
    
    
    // MARK1: tabbar 添加控制器
    func addChildVC(vc:UIViewController,title:String,imgName:String,selectedImgName:String)->(){
        
        vc.tabBarItem.title = title;
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImgName);
        vc.tabBarItem.image = UIImage.init(named: imgName);
        let nav = UINavigationController.init(rootViewController: vc);
        self.addChildViewController(nav);
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

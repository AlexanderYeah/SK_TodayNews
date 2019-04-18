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

        // 监听换肤按钮的点击操作
 
        NotificationCenter.default.addObserver(self, selector:#selector(changeTheme), name: NSNotification.Name(rawValue: "DayAndNightBtnClick"), object: nil);
        // Do any additional setup after loading the view.
        setupUI();
    }
    
    // 改变主题
    @objc func changeTheme(noti:NSNotification) -> () {
        
        let isSelected = noti.object as! Bool;
        
        if isSelected {
            for child in self.children{
                
                
                guard let childStr:String = child.title else{
                    print("childStr为nil")
                    return;
                }
                
                switch childStr {
                    case "首页":
                        setNightTabbarItem(vc: child, imgStr: "home");
                    case "西瓜视频":
                        setNightTabbarItem(vc: child, imgStr: "video");
                    case "小视频":
                        setNightTabbarItem(vc: child, imgStr: "huoshan");
                    case "我的":
                        setNightTabbarItem(vc: child, imgStr: "mine");
                    default:
                        break
                }
                
            }
        }else{
            for child in self.children{
                
                guard let childStr:String = child.title else{
                     print("childStr为nil")
                    return;
                }
                
                switch childStr {
                case "首页":
                    setDayTabbarItem(vc: child, imgStr: "home");
                case "西瓜视频":
                    setDayTabbarItem(vc: child, imgStr: "video");
                case "小视频":
                    setDayTabbarItem(vc: child, imgStr: "huoshan");
                case "我的":
                    setDayTabbarItem(vc: child, imgStr: "mine");
                default:
                    break
                }
                
            }
        }
        
        
    }
    
    
    // 设置夜间的控制器
    func setNightTabbarItem(vc:UIViewController, imgStr:String) -> () {
        
        
        vc.tabBarItem.image = UIImage(named: imgStr + "_tabbar_night_32x32_");
        vc.tabBarItem.selectedImage = UIImage(named: imgStr + "_tabbar_press_night_32x32_");
        
    }
    
    // 谁知白天的控制器样式
    func setDayTabbarItem(vc:UIViewController,imgStr:String) -> () {
        
        vc.tabBarItem.image = UIImage(named: imgStr + "_tabbar_32x32_");
        vc.tabBarItem.selectedImage = UIImage(named: imgStr + "_tabbar_press_32x32_");
        
    }
    

    
    // 设置UI
    func setupUI() ->()
    {
        // 设置tabbar 的title 颜色
        UITabBar.appearance().tintColor = UIColor.red;

        // 添加子控制器
        addChildVC(vc: HomeVC(), title: "首页", imgName: "home");
        addChildVC(vc: VideoVC(), title: "西瓜视频", imgName: "video");
        addChildVC(vc: HuoShanVC(), title: "小视频", imgName: "huoshan");
        addChildVC(vc: ProfileVC(), title: "我的", imgName: "mine");
        
        // KVC 设置自定义的tabbar
        setValue(SKTabbar(), forKey: "tabBar");
        
    }
    
    
    // MARK1: tabbar 添加控制器
    func addChildVC(vc:UIViewController,title:String,imgName:String)->(){
        
        // 判断是否是夜间模式 开启对应的主题方案
        if UserDefaults.standard.bool(forKey:"DayAndNight") {
            self.setNightTabbarItem(vc: vc, imgStr: imgName);
        }else{
            self.setDayTabbarItem(vc: vc, imgStr: imgName);
        }
        
        vc.title = title;
        
        let nav = UINavigationController.init(rootViewController: vc);
        self.addChild(nav);
        
        
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

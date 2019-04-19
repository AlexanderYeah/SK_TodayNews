//
//  SKNavigationVC.swift
//  SK_TodayNews
//
//  Created by coder on 2019/4/18.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class SKNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    // 拦截控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // push的时候进行 隐藏tabbar
        if viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"lefterbackicon_titlebar_24x24_"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction));
        }
        super.pushViewController(viewController, animated: true);        
    }
    
    @objc func backAction(){
        popViewController(animated: true);
    }
    
    
}

//
//  ProfileVC.swift
//  SK_TodayNews
//
//  Created by coder on 2019/3/21.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController {

	// 数据源数组
	var sections = [[MyCellModel]]();


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor.globalColor();
		// 闭包返回值
		NetTool.loadCellData { (sections) in
			// 添加我的关注
			let jsonString = "{\"text\":\"我的关注\",\"grey_text\":\"\"}";
			// 将字符串转化为模型装入数组
			let model = MyCellModel.deserialize(from: jsonString);
			var myConcern = [MyCellModel]();
			myConcern.append(model!);
			self.sections.append(myConcern);
			self.sections = self.sections + sections;
			
			self.tableView.reloadData();
		}
		
    }
    
}

extension ProfileVC{
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10;
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenHeight));
        view.backgroundColor = UIColor.globalColor();
        return view;
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell");
		
        let model:MyCellModel = self.sections[indexPath.section][indexPath.row];
		
        cell.textLabel?.text = model.text;
        return cell;
    }
    
    
}

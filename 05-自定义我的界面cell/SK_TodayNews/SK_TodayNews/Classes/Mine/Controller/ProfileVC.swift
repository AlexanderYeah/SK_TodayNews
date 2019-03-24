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
	// 我的关注数据
	var concerns = [MyConcernModel]();
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor.globalColor();
		
		self.tableView.separatorStyle = .none;
		
		self.tableView.sk_registerCell(cell: MyOtherCell.self);
		
		
		self.tableView.sk_registerCell(cell: MyConcernCell.self);
		
 		
		
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
			
			// 加载我的关注数据
			self.tableView.reloadData();
			
			NetTool.loadConcernData(completeHandler: { (concerns) in
				self.concerns = concerns;
				print(concerns);
				
				let idxSet = IndexSet(integer: 0);
				self.tableView.reloadSections(idxSet, with: .automatic);
			})
		}
		
    }
    
}

extension ProfileVC{
	
	
    // cell 的高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    	if indexPath.section == 0 {
			return (self.concerns.count == 0 || self.concerns.count == 1) ? 40:114;
		}
		return 40;

	}
    
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
		
		if indexPath.section == 0{
		
			
			let cell = tableView.sk_dequeueCell(indexPath: indexPath) as MyConcernCell;
			
			
			cell.collectionView.isHidden = (self.concerns.count == 0 || self.concerns.count == 1) ? true : false;
			
			if self.concerns.count == 1	{
				cell.model = self.concerns[0];
			}
			
			// 将我的关注的数据穿传入到cell中去
			if self.concerns.count > 1 {
				cell.myConcerns = self.concerns;
			}
	
			return cell;
			
		}
		
		
    	let cell = tableView.sk_dequeueCell(indexPath: indexPath) as MyOtherCell;
		
		
        let model:MyCellModel = self.sections[indexPath.section][indexPath.row];
		
		cell.selectionStyle = .none;
		
		cell.titleLbl.text = model.text;
		
		cell.subTitleLbl.text = model.grey_text;
				
        return cell;
    }
    
    
}

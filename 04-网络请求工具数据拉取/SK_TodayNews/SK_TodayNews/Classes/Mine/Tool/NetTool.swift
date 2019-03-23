//
//  NetTool.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/23.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetDataToolProtocal {
    	// 加载我的cell 数据
	
	static func loadCellData( completeHandler:@escaping (_ sections:[[MyCellModel]]) ->());
	// 加载我的关注数据
	static func loadConcernData();
}



extension NetDataToolProtocal
{
	static func loadCellData(completeHandler:@escaping (_ sections:[[MyCellModel]]) ->()){
		let url = BASE_URL + "/user/tab/tabs/?";
		let params = ["device_id":device_id];

		// 默认get方法
	Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default)
		.downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
			print("Progress: \(progress.fractionCompleted)")
		}
		.validate { request, response, data in
			// Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
			return .success
		}
		.responseJSON { response in
			debugPrint(response)
			// 如果val有值的话 json
			if let value = response.result.value  {
				let json = JSON(value);
				// 判断是否是返回的成功的数据
				guard  json["message"] == "success" else {
					print("返回数据有错误");
					return;
				}
				// 取数据 
				if let data = json["data"].dictionary {
					print(data);
					if let sections = data["sections"]?.array{
						var sectionArr = [[MyCellModel]]();
						
						for item in sections {
							// 遍历每一个setion的cell数据
							var rowArr = [MyCellModel]();
							for row in item.arrayObject! {
								let model = MyCellModel.deserialize(from: row as? Dictionary);						rowArr.append(model!);
							}
							sectionArr.append(rowArr);
						}
						
						// 调用闭包 回传数据
						completeHandler(sectionArr);
						
					}
				
				};

			}
			
		}
	}
	
	static  func loadConcernData(){
	
	
	}

}

struct NetTool:NetDataToolProtocal {
	
}




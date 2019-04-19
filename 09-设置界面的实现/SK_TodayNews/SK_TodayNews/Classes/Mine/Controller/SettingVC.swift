//
//  SettingVC.swift
//  SK_TodayNews
//
//  Created by coder on 2019/4/18.
//  Copyright © 2019 AlexanderYeah. All rights reserved.


import UIKit
import Kingfisher

class SettingVC: UITableViewController {

    
    // section
    var sections = [[SettingModel]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createUI();
        
        self.calculateSize();
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let row = sections[section];
        
        return row.count;
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.sk_dequeueCell(indexPath: indexPath) as  SettingCell;
        
        
        if indexPath.section == 0 || indexPath.row == 0 {
            // 监听缓存打下
            NotificationCenter.default.addObserver(self, selector: #selector(loadLocalCache), name:Notification.Name(rawValue: "CaculateCacheSize"), object: nil);
        }
        
        cell.model = sections[indexPath.section][indexPath.row];
        cell.selectionStyle = .none;
        return cell
    }
 

    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame:CGRect(x: 0, y: 0, width: screenwidth, height: 10));
        view.backgroundColor = UIColor.init(r: 240, g: 240, b: 240, alpha: 1);
        return view;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            // 清除缓存的操作
            clearLocalCache();
        }
    }
    
    
    
}
extension SettingVC
{
    // 加载本地数据创建UI
    func createUI(){
        
        // 加载本地plist文件的数据
        let path = Bundle.main.path(forResource: "settingPlist", ofType: "plist");
        let array = NSArray(contentsOfFile: path!) as! [Any];
        
        for item in array {
            let array = item as! [[String:Any]];
            // 每个section的的row数组
            var rows = [SettingModel]();
            for dict in array
            {
                let model = SettingModel.deserialize(from: dict);
                rows.append(model!);
            }
            // 装进section里面
            sections.append(rows);
        }
        
        print(sections);
        self.tableView.sk_registerCell(cell: SettingCell.self);
        self.tableView.sectionFooterHeight = 10;
        self.tableView.separatorStyle = .none;
        
    }
    
    // 计算尺寸
    func calculateSize(){
        let cache = KingfisherManager.shared.cache;
        cache.calculateDiskStorageSize { (res) in
            switch res {
            case .success(let size):
                 let sizeM = Double(size) / 1024 / 1024;
                 let sizeString  = String(format: "%.2fM", sizeM as CVarArg);
                 print(sizeString);
                 let noti = Notification.init(name: Notification.Name(rawValue: "CaculateCacheSize"), object: nil, userInfo: ["cacheSize":sizeString]);
                
                 NotificationCenter.default.post(noti);
                
                
            case .failure(let error):
                print(error);
            }
        }
    }
    
    
    // 显示本地缓存数据到cell上面
    @objc func loadLocalCache(noti:Notification){
        let dic =  noti.userInfo as! [String:Any];
        let idx = IndexPath(row: 0, section: 0);
        let cell =  self.tableView.cellForRow(at: idx) as! SettingCell;
        cell.rightTitleLbl.text = dic["cacheSize"] as! String;
    }
    
    
    // 清除本地缓存数据
    func clearLocalCache(){
        let alert = UIAlertController.init(title: "温馨提示", message: "这是一个清除缓存操作", preferredStyle: UIAlertController.Style.actionSheet);
        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel) { (_) in
            alert .dismiss(animated: true, completion: nil);
        };
        
        let okAction = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (_) in
            let cache =  KingfisherManager.shared.cache;
            cache.clearDiskCache();
            cache.clearMemoryCache();
            cache.cleanExpiredMemoryCache();
            let noti = Notification.init(name: Notification.Name(rawValue: "CaculateCacheSize"), object: nil, userInfo: ["cacheSize":"0.00M"]);
            NotificationCenter.default.post(noti);
        }
        
        alert.addAction(cancelAction);
        alert.addAction(okAction);
       
        
        present(alert, animated: true, completion: nil);
        
        
    }
    
}


//
//  ProfileVC.swift
//  SK_TodayNews
//
//  Created by coder on 2019/3/21.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension ProfileVC{
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10;
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenHeight));
        view.backgroundColor = UIColor.init(r: 225, g: 2, b: 2, alpha: 1);
        return view;
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell");
        cell.textLabel?.text = "1";
        return cell;
    }
    
    
}

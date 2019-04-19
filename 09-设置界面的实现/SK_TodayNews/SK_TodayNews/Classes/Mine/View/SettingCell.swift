//
//  SettingCell.swift
//  SK_TodayNews
//
//  Created by coder on 2019/4/18.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell,RegisterCellWithNib {

    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var subtitleLbl: UILabel!
    
    @IBOutlet weak var rightTitleLbl: UILabel!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    @IBOutlet weak var rightNavArrow: UIImageView!
    
    

    @IBOutlet weak var subtitleLblHeightConstant: NSLayoutConstraint!
    
    // 设置模型的时候调用
    
    var model:SettingModel?{
        
        didSet {
            titleLbl.text = model!.title;
            subtitleLbl.text = model!.subtitle;
            rightTitleLbl.text = model!.rightTitle;
            rightNavArrow.isHidden = model!.isHiddenRightArraw;
            rightSwitch.isHidden = model!.isHiddenSwitch;
            subtitleLbl.isHidden = model!.isHiddenSubTitle;

            if !subtitleLbl.isHidden {
                self.subtitleLblHeightConstant.constant = 20;
            }  
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

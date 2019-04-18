//
//  MyOtherCell.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/23.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell,RegisterCellWithNib {
	
	@IBOutlet weak var titleLbl: UILabel!
	
	
	@IBOutlet weak var subTitleLbl: UILabel!
	
	
	@IBOutlet weak var navImgView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        subTitleLbl.theme_textColor = "colors.cellTitleColor";
        titleLbl.theme_textColor = "colors.cellTitleColor";
        self.theme_backgroundColor = "colors.cellBackgroudColor";
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

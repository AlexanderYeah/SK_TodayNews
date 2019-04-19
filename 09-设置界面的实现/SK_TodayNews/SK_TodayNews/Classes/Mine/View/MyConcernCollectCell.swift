//
//  MyConcernCollectCell.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/24.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit
import Kingfisher
class MyConcernCollectCell: UICollectionViewCell,RegisterCellWithNib {

	

	@IBOutlet weak var nameLbl: UILabel!
	

	@IBOutlet weak var avataImgView: UIImageView!
	
	
	@IBOutlet weak var vimImgView: UIImageView!
	
	// 我的关注
	var model:MyConcernModel?{
	
		didSet{
			self.avataImgView.kf.setImage(with: URL(string: (model?.icon)!));
			self.nameLbl.text = model?.name;
			// 是否是VIP 用户
			if let is_verify = model?.is_verify {
				self.vimImgView.isHidden = !is_verify;
			}
					
		}
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  MyConcernCell.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/24.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit

class MyConcernCell: UITableViewCell,RegisterCellWithNib {


	@IBOutlet weak var subTitleLbl: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var titleLbl: UILabel!
	
	@IBOutlet weak var faceImgView: UIImageView!
	
	// cellModel
	
	var model:MyConcernModel?{
		
		didSet{
			subTitleLbl.text = model?.name;
			
		}
	}
	
	// 我的关注
	var myConcerns = [MyConcernModel](){
		
		didSet{
			collectionView.reloadData();
		}
		
	}
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		self.collectionView.collectionViewLayout = MyConcernFlowLayout();
		self.collectionView.delegate = self as? UICollectionViewDelegate;
		self.collectionView.dataSource = self as? UICollectionViewDataSource;
		self.collectionView.sk_registerCell(cell: MyConcernCollectCell.self);
				

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MyConcernCell:UICollectionViewDataSource,UICollectionViewDelegate
{
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return self.myConcerns.count;
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	
		let cell = collectionView.sk_dequeueCell(indexPath: indexPath) as MyConcernCollectCell;
		
		cell.model = self.myConcerns[indexPath.row];
		
		return cell;
	
	}
	
}



// 自定义flowLayout
class MyConcernFlowLayout: UICollectionViewFlowLayout {
	// 设置flowLayout
	override func prepare() {
		
		// 大小
		itemSize = CGSize(width: 58, height: 74);
		
		minimumLineSpacing = 0;
		
		// 滚动方向
		scrollDirection = .horizontal;
		
		// 上下左右的边距
		sectionInset = UIEdgeInsetsMake(0, 10, 0, 0);
		
	}
}



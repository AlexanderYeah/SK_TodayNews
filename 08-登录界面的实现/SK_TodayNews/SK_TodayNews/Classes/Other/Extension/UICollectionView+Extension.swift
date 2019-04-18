//
//  UICollectionView+Extension.swift
//  SK_TodayNews
//
//  Created by Alexander on 2019/3/24.
//  Copyright © 2019年 AlexanderYeah. All rights reserved.
//

import UIKit

extension UICollectionView{
	
	func sk_registerCell<T:UICollectionViewCell>( cell:T.Type) where T:RegisterCellWithNib {
		if let nib:UINib = T.nib {
			register(nib, forCellWithReuseIdentifier: T.identifier);
			
		}else{
			register(cell, forCellWithReuseIdentifier: T.identifier);
		}
	}
	
	func sk_dequeueCell<T:UICollectionViewCell>(indexPath:IndexPath) ->T where T:RegisterCellWithNib {
		
		
		
		return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T;
 		
	}
}


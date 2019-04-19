//
//  MoreLoginVC.swift
//  SK_TodayNews
//
//  Created by coder on 2019/4/2.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit
import IBAnimatable
class MoreLoginVC: AnimatableModalViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissBtnClick(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.        
    }
    */

}

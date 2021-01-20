//
//  HomeContainerVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeContainerVC: UIViewController {
    @IBOutlet weak var HomeView: UIView!
    @IBOutlet weak var HomeCateView: UIView!
    var pageIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        if pageIndex == 0 {
           
            HomeView.alpha =  1
            HomeCateView.alpha = 0
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MoreTab"), object: nil, userInfo: ["Index":pageIndex])
            
              
        } else{
                  HomeView.alpha =  0
                  HomeCateView.alpha = 1
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Cate"), object: nil, userInfo: ["Cateid":ShareData.shareInfo.EcommerceCate?.categories?[pageIndex].categories_id ?? 0] )
                  
              }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


}

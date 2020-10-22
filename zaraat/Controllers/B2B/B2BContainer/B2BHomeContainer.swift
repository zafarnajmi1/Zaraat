//
//  B2BHomeContainer.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/22/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class B2BHomeContainer: UIViewController {

    @IBOutlet weak var HomeView: UIView!
       @IBOutlet weak var HomeCateView: UIView!
       var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if pageIndex == 0 {
         
               HomeView.alpha =  1
               HomeCateView.alpha = 0
               NotificationCenter.default.post(name: NSNotification.Name(rawValue: "B2BMoreTab"), object: nil, userInfo: ["B2BIndex":pageIndex])
                 
           } else{
                     HomeView.alpha =  0
                     HomeCateView.alpha = 1
               NotificationCenter.default.post(name: NSNotification.Name(rawValue: "B2BCate"), object: nil, userInfo: ["B2BCateid":ShareData.shareInfo.b2bCate?.categories?[pageIndex].categories_id ?? 0])
                     
                 }
       }


}

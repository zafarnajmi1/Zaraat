//
//  MyOrdersTabVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/16/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class MyOrdersTabVC: ButtonBarPagerTabStripViewController {

      @IBOutlet weak var collectionView: ButtonBarView!
    
     override func viewDidLoad() {
         
         
        self.navigationController?.navigationBar.isTranslucent =  false
         settings.style.selectedBarHeight = 4 //line
         settings.style.selectedBarBackgroundColor =  #colorLiteral(red: 0.9905504584, green: 0.7299582362, blue: 0.007647278253, alpha: 1)
         settings.style.buttonBarMinimumLineSpacing = 0
         settings.style.buttonBarItemsShouldFillAvailableWidth = true
         settings.style.buttonBarMinimumInteritemSpacing =  0
         settings.style.buttonBarLeftContentInset = 0
         settings.style.buttonBarRightContentInset = 0
         //settings.style.selectedBarVerticalAlignment = .middle
         
         changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
             guard changeCurrentIndex == true else { return }
             oldCell?.label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             oldCell?.contentView.backgroundColor = #colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)
             oldCell?.label.font = UIFont.init(name: "Poppins-SemiBold", size: 18)
             newCell?.label.textColor = #colorLiteral(red: 0.9905504584, green: 0.7299582362, blue: 0.007647278253, alpha: 1)
             newCell?.contentView.backgroundColor =  #colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)
             newCell?.label.font = UIFont.init(name: "Poppins-SemiBold", size: 18)
             
         }
         super.viewDidLoad()
         addBackButton()
         
     }
    
  
    
     override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
         let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InprogressVC") as? InprogressVC
         let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShipmentVC")  as? ShipmentVC
          let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RevievedVC")  as? RevievedVC
         let child_4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompletedVC")  as? CompletedVC
         
         return [child_1!, child_2!,child_3!,child_4!]
     }
     


   

}

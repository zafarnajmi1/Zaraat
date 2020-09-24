//
//  B2BProductDetailVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class B2BProductDetailVC: UIViewController {

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var btninquiry: UIButton!
    @IBOutlet weak var btnchatNow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        addBackButton()
        self.setNavigationBarWhiteColor()
        btnchatNow.roundButton()
        btninquiry.roundButton()
        detailView.layer.cornerRadius = 8
        detailView.layer.borderWidth = 1
        detailView.layer.borderColor =  #colorLiteral(red: 0.8468492627, green: 0.8509765267, blue: 0.8550060391, alpha: 1)
    }
    

    @IBAction func moreAction(_ sender: UIButton) {
        
    }
    
    @IBAction func chatAction(_ sender: UIButton) {
        
    }
    @IBAction func inqueryAction(_ sender: UIButton) {
        
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "B2BInquireisVC") as? B2BInquireisVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}

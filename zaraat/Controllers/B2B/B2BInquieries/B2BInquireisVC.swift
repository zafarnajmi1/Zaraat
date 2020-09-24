//
//  B2BInquireisVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class B2BInquireisVC: UIViewController {

    @IBOutlet weak var inqimg: UIImageView!
    @IBOutlet weak var btnsend: UIButton!
    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "Send Inquiry"
        addBackButton()
        setNavigationBarWhiteColor()
        btnsend.roundButton()
        
        subview.layer.cornerRadius =  8
        subview.layer.borderColor =  #colorLiteral(red: 0.7684259415, green: 0.7725404501, blue: 0.7765834928, alpha: 1)
        subview.layer.borderWidth =  1
        
        mainView.layer.cornerRadius =  8
        mainView.layer.borderColor =  #colorLiteral(red: 0.7684259415, green: 0.7725404501, blue: 0.7765834928, alpha: 1)
        mainView.layer.borderWidth =  1
    }
    

    

}

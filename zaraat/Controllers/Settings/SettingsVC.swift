//
//  SettingsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var btnchangepassword: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var notificationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        addBackButton()
        btnchangepassword.roundButton()
        
        passwordView.layer.cornerRadius =  8
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        notificationView.layer.cornerRadius =  8
        notificationView.layer.borderWidth = 1
        notificationView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         
    }
    

   
}

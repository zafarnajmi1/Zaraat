//
//  EditProfileVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SkyFloatingLabelTextField
class EditProfileVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var txtaddress: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Profile"
        addBackButton()
        self.img.roundImg()
        setNavigationBarWhiteColor()
        btnsave.roundButton()
    }
    

  

}

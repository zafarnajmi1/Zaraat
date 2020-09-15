//
//  ViewProfileVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SkyFloatingLabelTextField
class ViewProfileVC: UIViewController {

   @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var txtaddress: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Profile"
        addBackButton()
        self.img.roundImg()
        setNavigationBarWhiteColor()
        btnsave.roundButton()
    }
    
    @IBAction func EditAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
               let vc =  storyBoard.instantiateViewController(identifier: "EditProfileVC") as? EditProfileVC
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

//
//  ViewProfileVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SkyFloatingLabelTextField
import  SDWebImage
import  DLRadioButton
class ViewProfileVC: UIViewController {

    @IBOutlet weak var txtphonenumber: SkyFloatingLabelTextField!
    @IBOutlet weak var txtemail: SkyFloatingLabelTextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var txtlastname: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    var userdata :  UserProfile?
    
    @IBOutlet weak var btnmale: DLRadioButton!
    
    @IBOutlet weak var btnFemale: DLRadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Profile"
        addBackButton()
        self.img.roundImg()
        setNavigationBarWhiteColor()
        btnsave.roundButton()
//        self.img.layer.borderWidth = 1
//        self.img.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configData()
        
    }
    func configData() {
        
        self.img.sd_imageLoadOperation(forKey: "Downloading")
        self.img.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.img.sd_setImage(with: URL(string: ShareData.shareInfo.userprofile?.user?.picture ?? ""), placeholderImage: UIImage(contentsOfFile: "1"))
        txtphonenumber.text = ShareData.shareInfo.userprofile?.user?.phone
        txtEmail.text = ShareData.shareInfo.userprofile?.user?.email
        txtName.text =  ShareData.shareInfo.userprofile?.user?.first_name
        txtlastname.text =  ShareData.shareInfo.userprofile?.user?.last_name
        lblemail.text = ShareData.shareInfo.userprofile?.user?.email
        lblusername.text = ShareData.shareInfo.userprofile?.user?.first_name ?? "" + (userdata?.user?.last_name)!
        
        if ShareData.shareInfo.userprofile?.user?.gender?.lowercased() == "male" {
            btnmale.isSelected = true
            btnFemale.isSelected  = false
        } else if ShareData.shareInfo.userprofile?.user?.gender?.lowercased() == "female"{
            btnmale.isSelected = false
            btnFemale.isSelected  = true
        } else {
            btnmale.isSelected = false
            btnFemale.isSelected  = false
        }
        
    }
    @IBAction func EditAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC
        vc?.userdata =  self.userdata
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

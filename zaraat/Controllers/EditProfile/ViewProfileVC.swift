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
class ViewProfileVC: UIViewController {

    @IBOutlet weak var txtemail: SkyFloatingLabelTextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var txtlastname: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    var userdata :  UserProfile?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Profile"
        addBackButton()
        self.img.roundImg()
        setNavigationBarWhiteColor()
        btnsave.roundButton()
        configData()
    }
    
    
    func configData() {
        self.img.sd_imageLoadOperation(forKey: "Downloading")
        self.img.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.img.sd_setImage(with: URL(string: self.userdata?.user?.picture ?? ""), placeholderImage: UIImage(contentsOfFile: "1"))
       
        txtEmail.text = userdata?.user?.email
        txtName.text =  userdata?.user?.first_name
        txtlastname.text =  userdata?.user?.last_name
        lblemail.text = userdata?.user?.email
        lblusername.text = userdata?.user?.first_name ?? "" + (userdata?.user?.last_name)!
    }
    @IBAction func EditAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
               let vc =  storyBoard.instantiateViewController(identifier: "EditProfileVC") as? EditProfileVC
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

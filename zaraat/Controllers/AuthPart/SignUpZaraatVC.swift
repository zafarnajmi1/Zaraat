//
//  SignUpVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
class SignUpVC: ZaraatBaseVC {
   var mydropwdown = DropDown()
    
    
    @IBOutlet weak var btnsignUp: UIButton!
   
 
    
    @IBOutlet weak var txtuserName: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtconfirmpassword: UITextField!
    @IBOutlet weak var txtphonenumber: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewconfigsignup()
    }
    
    
    
    func viewconfigsignup(){
        btnsignUp.roundButton()
        
       
      
    }

    @IBAction func signUpAction(_ sender: UIButton) {
        
        if checkData() {
           // self.registerVendor()
        }
        
        
    
    }
    @IBAction func loginAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    func checkData() -> Bool {
        if  txtuserName.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Full Name", messagetype: 0)
            return false
        } else if  txtemail.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
            return false
        } else if  txtemail.text?.isValidEmail == false {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Valid Email", messagetype: 0)
            return false
        } else if  txtphonenumber.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Phone Number ", messagetype: 0)
            return false
        } else if  txtpassword.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Password", messagetype: 0)
            return false
        } else if  txtconfirmpassword.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Confirm Password", messagetype: 0)
            return false
        } else if  txtconfirmpassword.text != txtpassword.text {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Password does not match", messagetype: 0)
            return false
        }
        return true
    }
    
    
    

    func movetoHome(){
        if UIDevice.current.userInterfaceIdiom == .pad {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                self.navigationController?.pushViewController(vc!, animated: true)

        } else {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
    @IBAction func privacyPolicyAction(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func TermsofUseAction(_ sender: UIButton) {
        
    }
    
}

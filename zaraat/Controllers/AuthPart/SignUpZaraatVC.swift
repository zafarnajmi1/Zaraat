//
//  SignUpVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
import SkyFloatingLabelTextField
class SignUpVC: ZaraatBaseVC {
   var mydropwdown = DropDown()
    
    
    @IBOutlet weak var btnconfirmPass: UIButton!
    @IBOutlet weak var btnpass: UIButton!
    @IBOutlet weak var btnsignUp: UIButton!
   
 
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtLastName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtconfirmpassword: UITextField!
    @IBOutlet weak var txtphonenumber: UITextField!
    
   var passClick = true
    
    var ConpassClick = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewconfigsignup()
    }
    
    
    
    func viewconfigsignup(){
        btnsignUp.roundButton()
        
       
      
    }

    
    @IBAction func passAction(sender: AnyObject) {
        if(passClick == true) {
            txtpassword.isSecureTextEntry = false
            btnpass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
        } else {
            txtpassword.isSecureTextEntry = true
            btnpass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
        }

        passClick = !passClick
    }
    
    @IBAction func ConpassAction(sender: AnyObject) {
        if(ConpassClick == true) {
            txtconfirmpassword.isSecureTextEntry = false
            btnconfirmPass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
        } else {
            txtconfirmpassword.isSecureTextEntry = true
            btnconfirmPass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
        }

        ConpassClick = !ConpassClick
    }
    
    
    
    
    
    
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        if checkData() {
          self.registerClient()
        }
        
        
    
    }
    @IBAction func loginAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    func checkData() -> Bool {
        if  txtFirstName.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The First Name", messagetype: 0)
            return false
        } else if  txtLastName.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Last Name", messagetype: 0)
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
    
    
    func registerClient() {
        let dic: [String:Any] = ["email": self.txtemail.text!, "first_name": txtFirstName.text!, "last_name":self.txtLastName.text!, "phone": txtphonenumber.text!, "password": txtpassword.text!]
        ShareData.showProgress()
        userhandler.Register(parms: dic, Success: {response in
          ShareData.hideProgress()
            ShareData.hideProgress()
            if response.success == 1{
             ShareData.shareInfo.userInfo = response
             ShareData.shareInfo.email = self.txtemail.text!
             ShareData.shareInfo.password = self.txtpassword.text!
             ShareData.shareInfo.autologin =  true
             self.movetoHome()

                //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
            }else {
              ShareData.hideProgress()
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }

        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
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

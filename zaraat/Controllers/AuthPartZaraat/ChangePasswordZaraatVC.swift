//
//  ChangePasswordVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ChangePasswordVC: ZaraatBaseVC {

    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var txtreEnterPassword: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
//    @IBOutlet weak var rePasswordView: UIView!
//    @IBOutlet weak var passwordView: UIView!
    var id = 0
    
    
    var passClick = true
    
    var ConpassClick = true
    
    @IBOutlet weak var btnconfirmPass: UIButton!
      @IBOutlet weak var btnpass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        btnChange.roundButton()
       
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
              txtreEnterPassword.isSecureTextEntry = false
              btnconfirmPass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
          } else {
              txtreEnterPassword.isSecureTextEntry = true
              btnconfirmPass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
          }

          ConpassClick = !ConpassClick
      }
      
    
    
    
    
    
    
    
    
    
    func checkdata() -> Bool {
        
        if txtpassword.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter New Password", messagetype: 0)
            return false
        } else if txtreEnterPassword.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Re Enter New Password", messagetype: 0)
           
            return false
        } else if txtreEnterPassword.text != txtpassword.text {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "PasswordAnd Conform Password Does not Match ", messagetype: 0)
            
             return false
        }
        return  true
    }
    
    
    func  resetPasswordApi() {
        let dic : [String:Any] = ["customer_id":self.id, "password":txtpassword.text!, "password_confirmation":txtreEnterPassword.text!]
        ShareData.showProgress()
        userhandler.ResetPassword(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                self.backToLogin(UIButton())
            } else {
                 ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
                          ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
//    
    @IBAction func ChnageAction(_ sender: UIButton) {
        if checkdata() {
            resetPasswordApi()
        }
    }
//    
    @IBAction func backToLogin(_ sender: UIButton) {
        
        
            if UIDevice.current.userInterfaceIdiom == .pad {
                    
                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
                self.navigationController?.pushViewController(vc!, animated: true)
                
            } else {
                
                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
                self.navigationController?.pushViewController(vc!, animated: true)
             }

        
       
    }
    
}

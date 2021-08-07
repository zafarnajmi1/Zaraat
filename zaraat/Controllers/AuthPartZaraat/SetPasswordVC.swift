//
//  SetPasswordVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/21/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SetPasswordVC: UIViewController {

    @IBOutlet weak var txtoldPassword: UITextField!
    @IBOutlet weak var oldView: UIView!
    @IBOutlet weak var btnChange: UIButton!
        @IBOutlet weak var txtreEnterPassword: UITextField!
        @IBOutlet weak var txtpassword: UITextField!
        @IBOutlet weak var rePasswordView: UIView!
        @IBOutlet weak var passwordView: UIView!
        
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Change Password"
            addBackButton()
           
            btnChange.roundbuttonRadius(borderwidth: 2)
            rePasswordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            passwordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
            oldView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        }
        
        
        
        func checkdata() -> Bool {
            if txtoldPassword.text == "" {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter Old Password", messagetype: 0)
                return false
            }else
            if txtpassword.text == "" {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter New Password", messagetype: 0)
                return false
            } else if txtreEnterPassword.text == "" {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: "Please Re Enter New Password", messagetype: 0)
               
                return false
            } else if txtreEnterPassword.text != txtpassword.text {
                Zalert.ZshareAlert.showAlert(title: "Alert", message: "PasswordAnd Conform Password Does not Match ", messagetype: 0)
                
                 return false
            }
            return  true
        }
        
        
        func  resetPasswordApi() {
            let dic : [String:Any] = ["old_password":txtoldPassword.text!, "password":txtpassword.text!, "password_confirmation":txtreEnterPassword.text!]
            ShareData.showProgress()
            userhandler.changePassword(params: dic, Success: {response in
                ShareData.hideProgress()
                if response.success == 1 {
                    ShareData.shareInfo.password = self.txtpassword.text!
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
                    self.navigationController?.popViewController(animated: true)
                } else {
                     ShareData.hideProgress()
                    Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
                }
            }, Failure: {error in
                ShareData.hideProgress()
                              Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            })
        }
        
        @IBAction func ChnageAction(_ sender: UIButton) {
            if checkdata() {
                resetPasswordApi()
            }
        }
        
//        @IBAction func backToLogin(_ sender: UIButton) {
//            
//            
//                if UIDevice.current.userInterfaceIdiom == .pad {
//                        
//                    let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
//                    let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
//                    self.navigationController?.pushViewController(vc!, animated: true)
//                    
//                } else {
//                    
//                    let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
//                    let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
//                    self.navigationController?.pushViewController(vc!, animated: true)
//                 }
//
//            
//           
//        }
        
    }

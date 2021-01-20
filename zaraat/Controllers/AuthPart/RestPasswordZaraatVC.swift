//
//  RestPasswordVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 7/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class RestPasswordVC: UIViewController {
    @IBOutlet weak var txtnewpass: UITextField!
    
    @IBOutlet weak var btnchnage: UIButton!
    @IBOutlet weak var txtreenterpass: UITextField!
    @IBOutlet weak var txtoldPass: UITextField!
    
    
    var passClick = true
       
       var ConpassClick = true
      var newpassClick = true
    
    @IBOutlet weak var btnpass: UIButton!
    @IBOutlet weak var btnnewpass: UIButton!
    
    @IBOutlet weak var btnconfirmpass: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        setNavigationBarWhiteColor()
        btnchnage.roundButton()
        self.title = "Reset Password"
    }
    
    @IBAction func chnageAction(_ sender: UIButton) {
        
        if checkdata() {
            resetPasswordApi()
        }
    }
    
    
    
    
    

        
        @IBAction func oldpassAction(sender: AnyObject) {
              if(passClick == true) {
                  txtoldPass.isSecureTextEntry = false
                  btnpass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
              } else {
                  txtoldPass.isSecureTextEntry = true
                  btnpass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
              }

              passClick = !passClick
          }
          
          @IBAction func newpassAction(sender: AnyObject) {
              if(newpassClick == true) {
                  txtnewpass.isSecureTextEntry = false
                  btnnewpass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
              } else {
                  txtnewpass.isSecureTextEntry = true
                  btnnewpass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
              }

              newpassClick = !newpassClick
          }
          
        
    @IBAction func ConpassAction(sender: AnyObject) {
                 if(ConpassClick == true) {
                     txtreenterpass.isSecureTextEntry = false
                     btnconfirmpass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
                 } else {
                     txtreenterpass.isSecureTextEntry = true
                     btnconfirmpass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
                 }

                 ConpassClick = !ConpassClick
             }
        
        
        
        
        
        
        
        
        func checkdata() -> Bool {
            
            if txtoldPass.text == "" {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter New Password", messagetype: 0)
                return false
            } else if txtnewpass.text == "" {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Re Enter New Password", messagetype: 0)
               
                return false
            } else if txtreenterpass.text == "" {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Re Enter Confirm Password", messagetype: 0)
               
                return false
            }else if txtreenterpass.text != txtnewpass.text {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "PasswordAnd Conform Password Does not Match ", messagetype: 0)
                
                 return false
            }
            return  true
        }
        
        
        func  resetPasswordApi() {
            let dic : [String:Any] = ["old_password":txtoldPass.text!, "password":txtnewpass.text!, "password_confirmation":txtreenterpass.text!]
            ShareData.showProgress()
            userhandler.changePassword(parms: dic, Success: {response in
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

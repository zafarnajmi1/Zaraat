//
//  LoginVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 2/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class LoginVC: ZaraatBaseVC {
   
    @IBOutlet weak var txtemail: UITextField!
    
   
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var btnlogin: UIButton!
    
    @IBOutlet weak var gmailView: UIView!
    @IBOutlet weak var fbView: UIView!
    
    @IBOutlet weak var guestView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbView.roundView()
        self.gmailView.roundView()
        self.guestView.roundView()
        btnlogin.roundButton()
        
      
    }
    
    
    

    @IBAction func loginAction(_ sender: UIButton) {
        
       // if checkData() {
          movetoHome()
       // }
              
       
    }
    
    
    
    func checkData()-> Bool {
        if txtemail.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
            return false
        } else if txtpassword.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Password", messagetype: 0)
            return false
        }else if txtpassword.text!.count < 3 || txtpassword.text!.count > 15  {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: " Password length must be 3-15 characters", messagetype: 0)
            return false
        }else if txtemail.text!.isValidEmail != true  {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Valid Email", messagetype: 0)
            return false
        }
        return true
        
    }
    
//
//    func LoginVendor() {
//
//           let dic : [String:Any] = ["email" : txtemail.text!,"password":txtpassword.text!]
//        ShareData.showProgress()
//           userhandler.login(parms: dic, Success: {response in
//             ShareData.hideProgress()
//               ShareData.hideProgress()
//               if response.success == 1{
//                ShareData.shareInfo.userInfo = response
//                ShareData.shareInfo.email = self.txtemail.text!
//                ShareData.shareInfo.password = self.txtpassword.text!
//                ShareData.shareInfo.autologin =  true
//                if response.vendors?.status == 0 {
//                    self.moveOnBusinessProfile()
//                }else {
//                     self.movetoHome()
//                }
//
//                   //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
//               }else {
//                 ShareData.hideProgress()
//                   ShareData.hideProgress()
//                   Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
//               }
//
//           }, Failure: {error in
//               ShareData.hideProgress()
//               Zalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
//           })
//       }
    
    
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
//
//    func moveOnBusinessProfile(){
//        if UIDevice.current.userInterfaceIdiom == .pad {
//
//                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
//                let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
//                self.navigationController?.pushViewController(vc!, animated: true)
//
//        } else {
//
//                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
//                let vc =  storyBoard.instantiateViewController(withIdentifier: "VendorPackageVC") as? VendorPackageVC
//                self.navigationController?.pushViewController(vc!, animated: true)
//        }
//    }
//
    
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    
    
    @IBAction func forgotpasswordAction(_ sender: UIButton) {
        
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    
}

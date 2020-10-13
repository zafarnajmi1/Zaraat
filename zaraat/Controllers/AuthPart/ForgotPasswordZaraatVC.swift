//
//  ForgotPasswordVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ForgotPasswordVC: ZaraatBaseVC {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtemail: UITextField!
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.roundButton()
        //addShadow(to: [.top,.bottom,.left,.right], radius: 5.0)//addInerShadowLayer()
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        
        if cehckDate(){
            forgotpasswordApi()
        }
    
    }
    
    
    @IBAction func backtoSignin(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
//        if UIDevice.current.userInterfaceIdiom == .pad {
//
//              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
//              let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
//              self.navigationController?.pushViewController(vc!, animated: true)
//
//       } else {
//
//              let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
//              let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
//              self.navigationController?.pushViewController(vc!, animated: true)
//           }
        
        
    
    }
    
    
    func cehckDate() ->Bool {
        if txtemail.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
            return false
        }
        return true
    }
    
    
    func forgotpasswordApi() {
        let dic : [String:Any] = ["email": txtemail.text!]
        ShareData.showProgress()
        userhandler.forGotPasswordSet(parms: dic, Success: {response in
             ShareData.hideProgress()
            if response.success ==  1 {
                self.id =  (response.user?.customer_id)!
                self.movenext()
                self.id =  (response.user?.customer_id)!
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
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
    
    func movenext(){
        if UIDevice.current.userInterfaceIdiom == .pad {
                          
                      let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                      let vc =  storyBoard.instantiateViewController(withIdentifier: "CodeVerificationVC") as? CodeVerificationVC
                      vc!.customerid = id
                      vc?.email =  self.txtemail.text!
                      self.navigationController?.pushViewController(vc!, animated: true)
                      
               } else {
                      
                      let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                      let vc =  storyBoard.instantiateViewController(withIdentifier: "CodeVerificationVC") as? CodeVerificationVC
            vc!.customerid = id
            vc?.email =  self.txtemail.text!
            
                      self.navigationController?.pushViewController(vc!, animated: true)
                   }
    }
}

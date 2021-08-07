//
//  ViewController.swift
//  zaraat
//
//  Created by ZafarNajmi on 2/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SplashVC: ZaraatBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.commerceCateApi()
        self.b2bCateApi()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.CheckLogin()
        }
    }

    func moveOnLogin(){
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    func CheckLogin() {
        if ShareData.shareInfo.token?.isEmpty == false {
            LoginClient()
        } else {
           moveOnLogin()
        }
    }
    
    func LoginClient() {

             // let dic : [String:Any] = ["email" : ShareData.shareInfo.email!,"password":ShareData.shareInfo.password!,"fcm_token": ShareData.shareInfo.fcmToken!]
           ShareData.showProgress()
              userhandler.loginSession( Success: {response in
                ShareData.hideProgress()
                  ShareData.hideProgress()
                  if response.success == 1{
                     ShareData.shareInfo.token = response.token!
                    //ShareData.shareInfo.userData(User: response)

                    ShareData.shareInfo.userInfo = response
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
       

    
    
    
    func commerceCateApi() {
        userhandler.getEcommerceCate(Success: {response in
            if response.success == 1 {
                ShareData.shareInfo.EcommerceCate =  response
            }
        }, Failure: {error in
            
        })
    }
       
    
    func b2bCateApi() {
        userhandler.getB2BCate(Success: {response in
            if response.success == 1 {
                ShareData.shareInfo.b2bCate =  response
            }
        }, Failure: {error in
            
        })
    }
    
}


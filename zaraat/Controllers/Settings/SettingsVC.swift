//
//  SettingsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var myswitchbutton: UISwitch!
    @IBOutlet weak var btnchangepassword: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var notificationView: UIView!
    var userdata :  UserProfile?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        addBackButton()
        btnchangepassword.roundButton()
        
        passwordView.layer.cornerRadius =  8
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        notificationView.layer.cornerRadius =  8
        notificationView.layer.borderWidth = 1
        notificationView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        if userdata?.user?.fcm_token == "" {
            myswitchbutton.isOn = false
        } else {
            myswitchbutton.isOn = true 
        }
         
    }
    var dic : [String:Any] = [:]
    @IBAction func SwitchAction(_ sender: UISwitch) {
        if sender.isOn == true  {
            dic = ["fcm_token": ShareData.shareInfo.fcmToken!]
            onOffNotification()
        } else {
            dic = ["fcm_token": ""]
             onOffNotification()
        }
    }
    
   
    
    func onOffNotification () {
        ShareData.showProgress()
        
        userhandler.addremoveNotication(parms:dic , Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                
            } else {
                 ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
            
        }, Failure: {error in
             ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
    }
    
    
    @IBAction func changePAsswordaction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "RestPasswordVC") as? RestPasswordVC
        vc?.hidesBottomBarWhenPushed = true 
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
}

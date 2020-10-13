//
//  MyaccountVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 27/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  AnimatableReload
class MenuVC: UIViewController {

    @IBOutlet weak var userimg: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    
    struct menuDate {
        var title :  String?
        var imgae: UIImage?
    }
    var menuarray =  [menuDate]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Myaccount"
        self.userimg.roundImage()
        self.tblView.register(UINib.init(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
         AnimatableReload.reload(tableView: self.tblView, animationDirection: "up")
        configMenu()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//           setNavigationBarWhiteColor()
//       }
     
    func configMenu() {
        self.menuarray.removeAll()
        menuarray.append(menuDate(title: "Edit Profile", imgae: UIImage.init(named: "myaccount")))
         menuarray.append(menuDate(title: "My Orders", imgae: UIImage.init(named: "changelanguage")))
       
        menuarray.append(menuDate(title: "Settings", imgae: UIImage.init(named: "settings")))
        menuarray.append(menuDate(title: "Support", imgae: UIImage.init(named: "changelanguage")))
        menuarray.append(menuDate(title: "Terms & Condition", imgae: UIImage.init(named: "Terms&Condition")))
        menuarray.append(menuDate(title: "Logout", imgae: UIImage.init(named: "logout")))
    }
    

}
extension MenuVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell
        cell!.lbltitle.text =  self.menuarray[indexPath.row].title
        cell!.img.image =  self.menuarray[indexPath.row].imgae
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if  indexPath.row == 0{
        
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "ViewProfileVC") as? ViewProfileVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
        } else if   indexPath.row == 1{
        
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "MyOrdersTabVC") as? MyOrdersTabVC
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }else if indexPath.row == 2{
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "SettingsVC") as? SettingsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if indexPath.row == 3 {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "SupportVC") as? SupportVC
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            alertForLogout()
            
        }
    }
    
    
    func alertForLogout() {
          let alert = UIAlertController(title: "Alert", message: "Are You Sure You Want To LogOut?", preferredStyle: UIAlertController.Style.alert)

          // add the actions (buttons)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
            self.logout()
          }))
          alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

         
          self.present(alert, animated: true, completion: nil)
      }
    
    func logout(){
        
        ShareData.shareInfo.email = nil
        ShareData.shareInfo.password = nil
         ShareData.shareInfo.autologin =  false
         ShareData.shareInfo.userInfo = nil
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC
        vc?.hidesBottomBarWhenPushed =  true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

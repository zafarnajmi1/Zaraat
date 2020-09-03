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
    
    func configMenu() {
        self.menuarray.removeAll()
        menuarray.append(menuDate(title: "Edit Profile", imgae: UIImage.init(named: "myaccount")))
        menuarray.append(menuDate(title: "Notification", imgae: UIImage.init(named: "notification")))
        menuarray.append(menuDate(title: "Settings", imgae: UIImage.init(named: "settings")))
        menuarray.append(menuDate(title: "Change Language", imgae: UIImage.init(named: "changelanguage")))
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
    
    
}

//
//  CategoriesVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.tableFooterView = UIView(frame: .zero)
        self.navigationItem.title = "All Categories"
        self.tblView.register(UINib.init(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
        tblView.layer.cornerRadius = 30 //set corner radius here
        //tblView.layer.backgroundColor = UIColor.cyan.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarWhiteColor()
        
    }

}
extension CategoriesVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as? CategoriesCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "SubcategoriesVC") as? SubcategoriesVC
        vc?.hidesBottomBarWhenPushed =  true 
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

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
        self.navigationItem.title = "Categories"
        self.tblView.register(UINib.init(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
//        tblView.layer.cornerRadius = 10 //set corner radius here
//        tblView.layer.backgroundColor = UIColor.cyan.cgColor
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
         return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as? CategoriesCell
        return cell!
    }
    
    
}

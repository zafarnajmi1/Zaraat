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
    
    var Allcategories = [AllCategories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.tableFooterView = UIView(frame: .zero)
        self.navigationItem.title = "All Categories"
        self.tblView.register(UINib.init(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
        tblView.layer.cornerRadius = 30 //set corner radius here
        //tblView.layer.backgroundColor = UIColor.cyan.cgColor
        getAllCategoriesApi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarWhiteColor()
        
    }

    
    func getAllCategoriesApi() {
        ShareData.showProgress()
        userhandler.getallCate(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.Allcategories =  response.categories ?? []
                self.tblView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
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
        return self.Allcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as? CategoriesCell
        let obj =  self.Allcategories[indexPath.row]
        cell?.loadData(obj: obj)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "SubcategoriesVC") as? SubcategoriesVC
        vc?.subCate = self.Allcategories[indexPath.row].categories_id ?? 0
        vc?.hidesBottomBarWhenPushed =  true 
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

//
//  WishListVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class WishListVC: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    
    var wishdata : WishlistModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wish List"
        addBackButton()
        setNavigationBarWhiteColor()
        
        tblview.register(UINib.init(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        getwishlistData()
    }
    

    
    func getwishlistData() {
        ShareData.showProgress()
        userhandler.getwishlist(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.wishdata =  response
                self.tblview.reloadData()
            } else {
                 ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
    }
    

}

extension WishListVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wishdata?.wishlist?.count ?? 0
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
           let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell")as? ProductListCell
        let obj = self.wishdata?.wishlist?[indexPath.row]
        cell?.loadWishListData(obj: obj!)
            return cell!
       
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            
                let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                let vc =  storyBoard.instantiateViewController(identifier: "ProductDetailVC") as? ProductDetailVC
               
               vc?.id =  self.wishdata?.wishlist?[indexPath.row].product?.products_id ?? 0
                self.navigationController?.pushViewController(vc!, animated: true)
            
            
    }
    
}

//
//  ProductListsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ProductListsVC: UIViewController {

    @IBOutlet weak var ClView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    var id = 0
    var isGride = true
    
     var  Productdata : ProductListData?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackButton()
        setNavigationBarWhiteColor()
        self.title = "Products List"
        tblView.register(UINib.init(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        setnavigationButton()
        getProductListapi()
    }
    

    
    func setnavigationButton(){
        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        if isGride == true {
        btn1.setBackgroundImage(UIImage(named: "Grid"), for: .normal)
        } else {
            btn1.setBackgroundImage(UIImage(named: "Single"), for: .normal)
        }
        btn1.addTarget(self, action: #selector(GridView), for: .touchUpInside)
        let btnmsg = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButtonItems([btnmsg], animated: true)
    }
    @objc func GridView(){
        if isGride == true {
            setnavigationButton()
           
            self.tblView.isHidden = true
            self.ClView.isHidden =  false
            self.ClView.reloadData()
            
        } else {
             setnavigationButton()
            
            self.tblView.isHidden = false
            self.ClView.isHidden =  true
            self.tblView.reloadData()
        }
        
        isGride = !isGride
    }
    
    
    
    func getProductListapi() {
        ShareData.showProgress()
        userhandler.getProductsList(id: id, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.Productdata =  response.data
                self.tblView.reloadData()
                self.ClView.reloadData()
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
extension ProductListsVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Productdata?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell")as? ProductListCell
        let obj =  self.self.Productdata?.products?[indexPath.row]
        cell?.loadData(obj: obj!)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "ProductDetailVC") as? ProductDetailVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


extension ProductListsVC :  UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Productdata?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClViewCell", for: indexPath) as? ClViewCell
        let obj =  self.self.Productdata?.products?[indexPath.row]
        cell?.loadData(obj: obj!)
        return cell!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
               let vc =  storyBoard.instantiateViewController(identifier: "ProductDetailVC") as? ProductDetailVC
               
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

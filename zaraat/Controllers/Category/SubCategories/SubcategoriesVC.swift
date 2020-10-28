//
//  SubcategoriesVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SDWebImage
class SubcategoriesVC: UIViewController {

    @IBOutlet weak var lblCateheading: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var clView: UICollectionView!
    var market = ""
    var subCate = 0
    var subcategories =  [SubCategoriesSubcategories]()
    var childCate = [Subcategories]()
    var SubProductdata : SubCateProductsData?
    override func viewDidLoad() {
        super.viewDidLoad()
        clView.isUserInteractionEnabled = true
        
        clView.dataSource = self
        clView.delegate = self
      addBackButton()
      setNavigationBarWhiteColor()
        self.title = "Sub Categories"
        self.clView.register(UINib.init(nibName: "SubcateGoriesCell", bundle: nil), forCellWithReuseIdentifier: "SubcateGoriesCell")
        self.tblView.register(UINib.init(nibName: "SubCateCellTb", bundle: nil), forCellReuseIdentifier: "SubCateCellTb")
        tblView.register(UINib.init(nibName: "WeeklySellerCell", bundle: nil), forCellReuseIdentifier: "WeeklySellerCell")
        self.subCateApi()
    }
    
     
    func subCateApi() {
        ShareData.showProgress()
        userhandler.getSubCate(subCate: subCate, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.subcategories =  response.subcategories ?? []
                
                self.childCateApi(child:self.subcategories[0].subcategory_id ?? 0)
                self.clView.reloadData()
                
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    func childCateApi(child:Int) {
        //ShareData.showProgress()
        userhandler.getChildCate(ChildCate:child,  Success: {response in
            //ShareData.hideProgress()
            if response.success == 1 {
                self.lblCateheading.text = "Child Categories"
                self.childCate =  response.subcategories ?? []
                if self.childCate.count == 0 {
                    self.getsubCateProducts(subCate:child)
                }
                
                self.tblView.reloadData()
                
            } else {
                //ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
           // ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    func getsubCateProducts(subCate: Int) {
        ShareData.showProgress()
        userhandler.getSubCateProducts(Cate: subCate, Success: {response in
             ShareData.hideProgress()
            if response.success == 1 {
                self.lblCateheading.text = "Products"
                self.SubProductdata =  response.data
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
extension SubcategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return self.childCate.count
        } else {
            return self.SubProductdata?.products?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SubCateCellTb") as? SubCateCellTb
            
         cell?.lbltile.text = self.childCate[indexPath.row].child_subcategory_title_en
        
       // cell?.img.sd_setImage(with: URL(string: self.childCate[indexPath.row].image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
        return cell!
        } else {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "WeeklySellerCell") as? WeeklySellerCell
            cell?.img.sd_setImage(with: URL(string: self.SubProductdata?.products![indexPath.row].featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
            cell?.lbltitle.text = self.SubProductdata?.products![indexPath.row].product_title_en
            cell?.lblprice.text =  self.SubProductdata?.products![indexPath.row].selling_price
            cell?.lbldiscountPrice.text =  self.SubProductdata?.products![indexPath.row].vendor_price
            //cell?.btnsubViewAll.isHidden = true
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
              let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
              let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
                vc!.id =  self.childCate[indexPath.row].child_categories_id ?? 0
                vc!.market = market
                vc?.typeno = 3
              self.navigationController?.pushViewController(vc!, animated: true)
            
        } else {
            let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "ProductDetailVC") as? ProductDetailVC
            vc?.id = self.SubProductdata?.products![indexPath.row].products_id ?? 0
            if market == "b2b" {
            vc?.isb2b = 2
            } else {
                vc?.isb2b = 0
            }
            self.navigationController?.pushViewController(vc!, animated: true)
        }
          
    }
    
}

extension SubcategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.subcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SubcateGoriesCell", for: indexPath) as? SubcateGoriesCell
        cell?.lbltitle.text = self.subcategories[indexPath.row].subcategory_title_en
        //cell?.img.sd_setImage(with: URL(string: self.subcategories[indexPath.row]. ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
        return cell!
       
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        childCateApi(child:self.subcategories[indexPath.row].subcategory_id ?? 0)
    }
    
}

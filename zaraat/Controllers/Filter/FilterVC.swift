//
//  FilterVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var txtMaxPrice: UITextField!
    @IBOutlet weak var maxPriceView: UIView!
    @IBOutlet weak var txtminPrice: UITextField!
    @IBOutlet weak var minPriceView: UIView!
    @IBOutlet weak var colorClView: UICollectionView!
    @IBOutlet weak var sizeClView: UICollectionView!
    @IBOutlet weak var brandsClView: UICollectionView!
    @IBOutlet weak var CateClView: UICollectionView!
    
    var Allcategories = [AllCategories]()
    var brands : FilterBrand?
    var sizecolors : FilterColorsSizes?
    
    var cateid = 0
    var childid = 0
    var colorid = 0
    var sizeid = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSearch.roundButton()
        getAllCategoriesApi()
        getfilterSizecolorApi()
       addBackButton()
        setNavigationBarWhiteColor()
        
        self.title  = "Filter"
        
        self.locationView.layer.cornerRadius =  8
         self.locationView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.locationView.layer.borderWidth = 1
        
        self.minPriceView.layer.cornerRadius =  8
        self.maxPriceView.layer.cornerRadius =  8
        
        self.minPriceView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.maxPriceView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.minPriceView.layer.borderWidth = 1
        self.maxPriceView.layer.borderWidth = 1
    }
    
    
    func getAllCategoriesApi() {
        ShareData.showProgress()
        userhandler.getallCate(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.Allcategories =  response.categories ?? []
                self.getfilterBrandApi(brandid:self.Allcategories[0].categories_id ?? 0)
                self.CateClView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }

    
    
    func getfilterBrandApi(brandid:Int) {
        ShareData.showProgress()
        userhandler.getchildCatgories(id: brandid, Success: { response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.brands =  response
                self.brandsClView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    func getfilterSizecolorApi() {
        ShareData.showProgress()
        userhandler.getattributes(Success: { response in
        ShareData.hideProgress()
            if response.success == 1 {
                
                self.sizecolors =  response
                self.sizeClView.reloadData()
                self.colorClView.reloadData()
                
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    @IBAction func SearchAction(_ sender: UIButton) {
        
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductListsVC") as? ProductListsVC
        vc?.cateid = self.cateid
        vc?.childid = self.childid
        vc?.colorid = colorid
         vc?.sizeid = sizeid
        vc?.maxprice =  ((self.txtMaxPrice.text)! as NSString).integerValue
        vc?.minprice = ((self.txtminPrice.text)! as NSString).integerValue
          vc?.typeno = 4
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
   

}
extension FilterVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == CateClView {
            return self.Allcategories.count
        } else if collectionView == brandsClView {
            return self.brands?.childcategories?.count ?? 0
        } else if collectionView == sizeClView {
            return sizecolors?.sizes?.count ?? 0
        } else {
            return sizecolors?.colors?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            if collectionView == CateClView {
               
                let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "CateCell", for: indexPath) as? CateCell
                cell?.lblCate.text =  self.Allcategories[indexPath.row].category_title_en
                return cell!
            } else if collectionView == brandsClView {
                
                let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell
                cell?.lblbrand.text =  self.brands?.childcategories![indexPath.row].child_subcategory_title_en
                               return cell!
               
            } else if collectionView == sizeClView {
                let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) as? SizeCell
                    let obj  = self.sizecolors?.sizes![indexPath.row]
                cell?.lblsize.text =  obj?.attribute_values
                               return cell!
               
            } else {
                let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell
                let obj =  self.sizecolors?.colors![indexPath.row]
                cell?.loadData(obj: obj!)
                               return cell!
               
            }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == CateClView {
            let cell = collectionView.cellForItem(at: indexPath) as! CateCell
            cell.toggleSelected()
            self.cateid = self.Allcategories[indexPath.row].categories_id!
            self.getfilterBrandApi(brandid: self.Allcategories[indexPath.row].categories_id ?? 0)
             
        } else if collectionView == brandsClView {
            let cell = collectionView.cellForItem(at: indexPath) as! BrandCell
            cell.toggleSelected()
            self.childid =  self.brands?.childcategories![indexPath.row].child_categories_id ?? 0
            
        } else if collectionView == sizeClView {
            let cell = collectionView.cellForItem(at: indexPath) as! SizeCell
            cell.toggleSelected()
            self.sizeid = self.sizecolors?.sizes![indexPath.row].attribute_values_id ?? 0
            
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! ColorCell
            cell.toggleSelected()
            colorid = self.sizecolors?.colors![indexPath.row].attribute_values_id ?? 0
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         if collectionView == CateClView {
                   let cell = collectionView.cellForItem(at: indexPath) as! CateCell
                   cell.toggleSelected()
            self.cateid = 0
                    
               } else if collectionView == brandsClView {
                   let cell = collectionView.cellForItem(at: indexPath) as! BrandCell
                   cell.toggleSelected()
            self.childid = 0
                   
               } else if collectionView == sizeClView {
                   let cell = collectionView.cellForItem(at: indexPath) as! SizeCell
                   cell.toggleSelected()
                    sizeid = 0
                   
               } else {
                   let cell = collectionView.cellForItem(at: indexPath) as! ColorCell
                   cell.toggleSelected()
                  colorid = 0
               }
    }
    
}

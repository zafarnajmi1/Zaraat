//
//  ViewAllProductsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewAllProductsVC: UIViewController {

    @IBOutlet weak var adimg: UIImageView!
    @IBOutlet weak var ClView: UICollectionView!
   @IBOutlet weak var clViewHeight: NSLayoutConstraint!
    var viewAll = 0
    var flashSaleData : ViewAllFlashSaleModel?
    var weeklyViewAll : WeeklyViewAllProducts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClView.dataSource = self
        ClView.delegate = self
        self.ClView.reloadData()
        
      
       self.navigationItem.title = "View All Products"
            addBackButton()
            setNavigationBarWhiteColor()
        
        
        if viewAll == 1 {
        self.FlashSaleApi()
        }else if  viewAll == 2 {
            TopViewAllApi()
        }
        else if  viewAll == 3 {
            self.weeklyViewAllApi()
        } else if viewAll == 4 {
            FeaturedViewAllApi()
        }
    }
    
    override func viewDidLayoutSubviews() {
             super.viewDidLayoutSubviews()

          let newHeight : CGFloat = ClView.collectionViewLayout.collectionViewContentSize.height

               clViewHeight.constant = newHeight
                self.ClView.reloadData()
                   self.loadViewIfNeeded()
                self.view.setNeedsLayout()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let newHeight : CGFloat = ClView.collectionViewLayout.collectionViewContentSize.height

                      clViewHeight.constant = newHeight
                       self.ClView.reloadData()
                       self.loadViewIfNeeded()
                       self.view.setNeedsLayout()
    }

    
    func FlashSaleApi() {
        ShareData.showProgress()
        userhandler.getViewAllFlashSaleProducts(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.flashSaleData =  response
               
                self.adimg.sd_setImage(with: URL(string: self.flashSaleData?.data?.ad?.category_image ?? "Text"))
               DispatchQueue.main.async {
                    self.view.layoutIfNeeded()
                    self.ClView.reloadData()
                }
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
             ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
    }
    
    
    func weeklyViewAllApi() {
        ShareData.showProgress()
        userhandler.getWeeklyViewAllProducts(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.weeklyViewAll =  response
                self.adimg.sd_setImage(with: URL(string: self.weeklyViewAll?.data?.ad?.category_image ?? "Text"))
                self.ClView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
             ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
    }
    
    
    func FeaturedViewAllApi() {
        ShareData.showProgress()
        userhandler.getFeaturedAllProducts(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.weeklyViewAll =  response
                 self.adimg.sd_setImage(with: URL(string: self.weeklyViewAll?.data?.ad?.category_image ?? "Text"))
                self.ClView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
             ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
    }
    
    
    func TopViewAllApi() {
        ShareData.showProgress()
        userhandler.gettopAllProducts(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.weeklyViewAll =  response
                
                if self.weeklyViewAll?.data?.ad?.category_image == "" {
                    self.adimg.isHidden =  true
                } else {
                    self.adimg.isHidden =  false
                    self.adimg.sd_setImage(with: URL(string: self.weeklyViewAll?.data?.ad?.category_image ?? "Text"))
                }
                
                self.ClView.reloadData()
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



extension ViewAllProductsVC :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       if viewAll == 1 {
        
        return self.flashSaleData?.data?.sales?.count ?? 0
        }  else {
            return self.weeklyViewAll?.data?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         if viewAll == 1 {
               let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ViewAllClViewCell", for: indexPath) as? ViewAllClViewCell
               
               cell?.lbltitle.text =  self.flashSaleData?.data?.sales?[indexPath.row].product?.product_title_en
            cell?.lblPrice.text = "PKR :" + (self.flashSaleData?.data?.sales?[indexPath.row].product?.selling_price)!
            
            cell?.lblstock.text =  " (InStock) :" + (self.flashSaleData?.data?.sales?[indexPath.row].product?.product_stock)!
               cell?.img.sd_setImage(with: URL(string: self.flashSaleData?.data?.sales?[indexPath.row].product?.featured_image ?? "Text"))
               
               return cell!
                   
               }  else {
                   let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ViewAllClViewCell", for: indexPath) as? ViewAllClViewCell

                          cell?.lbltitle.text =  self.weeklyViewAll?.data?.products?[indexPath.row].product_title_en
            cell?.lblPrice.text =  "PKR :" + (self.weeklyViewAll?.data?.products?[indexPath.row].selling_price)!
            cell?.lblstock.text =  " (InStock) :" + (self.weeklyViewAll?.data?.products?[indexPath.row].product_stock)!
            
            cell?.img.sd_setImage(with: URL(string: self.weeklyViewAll?.data?.products?[indexPath.row].featured_image ?? "Text"))
                   return cell!
               }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewAll == 1 {
            
                let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                 let vc =  StoryBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as?  ProductDetailVC
                vc?.id =   self.flashSaleData?.data?.sales?[indexPath.row].product_id ?? 0
                 self.navigationController?.pushViewController(vc!, animated: true)
            
        } else {
            
                let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                 let vc =  StoryBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as?  ProductDetailVC
                vc?.id =   self.weeklyViewAll?.data?.products?[indexPath.row].products_id ?? 0
                 self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}

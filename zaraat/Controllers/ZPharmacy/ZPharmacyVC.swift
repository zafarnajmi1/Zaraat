//
//  ZPharmacyVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/29/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZPharmacyVC: UIViewController {

    @IBOutlet weak var bannerimg: UIImageView!
    @IBOutlet weak var adimg: UIImageView!
    @IBOutlet weak var searchView: UIView!
       @IBOutlet weak var topBrandOneImg: UIImageView!
       @IBOutlet weak var topBrandTwoImage: UIImageView!
       
       @IBOutlet weak var topBrandThreeImg: UIImageView!
       
    @IBOutlet weak var clViewCate: UICollectionView!
    
    @IBOutlet weak var secOneClView: UICollectionView!
    
    @IBOutlet weak var secOneClViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var secTwoClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secTwoClView: UICollectionView!
     var Pharmacydata : ZMartData?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           
           let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))

                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
                imageView.contentMode = .scaleAspectFit
                let image = UIImage(named: "Zaraat Pharma Plus")
                imageView.image = image
                logoContainer.addSubview(imageView)
                navigationItem.titleView = logoContainer
           
           
           self.topBrandOneImg.layer.cornerRadius = 8
           self.topBrandTwoImage.layer.cornerRadius = 8
           self.topBrandThreeImg.layer.cornerRadius = 8
            
           //searchView.roundView()
           addBackButton()
           setNavigationBarWhiteColor()
          GetpharmacyProducts()
       }
       

      override func viewDidLayoutSubviews() {
               super.viewDidLayoutSubviews()

            let newHeight : CGFloat = secOneClView.collectionViewLayout.collectionViewContentSize.height

                 secOneClViewHeight.constant = newHeight
                  self.secOneClView.reloadData()
                     self.loadViewIfNeeded()
                  self.view.setNeedsLayout()
       
       
       let newHeightTwo : CGFloat = secTwoClView.collectionViewLayout.collectionViewContentSize.height

       secTwoClViewHeight.constant = newHeightTwo
        self.secTwoClView.reloadData()
           self.loadViewIfNeeded()
        self.view.setNeedsLayout()
          
      }
       
    

        func GetpharmacyProducts() {
            ShareData.showProgress()
            userhandler.getZpharmacy(Success: {response in
                ShareData.hideProgress()
                if response.success == 1 {
                    self.Pharmacydata = response.data
                    
                    self.bannerimg.sd_setImage(with: URL(string: self.Pharmacydata?.ad_1?.category_image ?? "Text"))
                    self.adimg.sd_setImage(with: URL(string: self.Pharmacydata?.ad_2?.category_image ?? "Text"))
                    if self.Pharmacydata?.daily?.count ?? 0 != 0 {
                        self.topBrandOneImg.sd_setImage(with: URL(string:self.Pharmacydata?.daily![0].featured_image ?? "Text"))
                        self.topBrandTwoImage.sd_setImage(with: URL(string: self.Pharmacydata?.daily![1].featured_image ?? "Text"))
                        self.topBrandThreeImg.sd_setImage(with: URL(string: self.Pharmacydata?.daily![2].featured_image ?? "Text"))
                    }
    //                self.topBrandOneImg.sd_setImage(with: URL(string: self.Martdata?.daily?[0].featured_image ?? "Text"))
    //                self.topBrandTwoImage.sd_setImage(with: URL(string: self.Martdata?.daily?[1].featured_image ?? "Text"))
    //                self.topBrandThreeImg.sd_setImage(with: URL(string: self.Martdata?.daily?[2].featured_image ?? "Text"))
                    self.clViewCate.reloadData()
                    self.secOneClView.reloadData()
                    self.secTwoClView.reloadData()
                } else {
                     ShareData.hideProgress()
                    ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
                }
            }, Failure: {error in
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
            })
        }
          
    
    
    @IBAction func adImageAction(_ sender: UIButton) {
        if (self.Pharmacydata?.daily?.indices.contains(0))! {
            let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
            vc!.id =  self.Pharmacydata?.daily![0].subcategory_id ?? 0
             vc?.typeno = 2
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    @IBAction func adtwoAction(_ sender: UIButton) {
         if (self.Pharmacydata?.daily?.indices.contains(1))! {
            let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
            vc!.id =  self.Pharmacydata?.daily![1].subcategory_id ?? 0
             vc?.typeno = 2
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    @IBAction func AdthreeAction(_ sender: UIButton) {
         if (self.Pharmacydata?.daily?.indices.contains(2))! {
            let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
            vc!.id =  self.Pharmacydata?.daily![2].subcategory_id ?? 0
            vc?.typeno = 2
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    

   }
extension ZPharmacyVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == clViewCate {
               return self.Pharmacydata?.subcategories?.count ?? 0
        } else if collectionView == secOneClView {
                return self.Pharmacydata?.section_1?.count ?? 0
        } else {
                 return self.Pharmacydata?.section_2?.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == clViewCate {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZPharmacyClViewShopeCategoriesCell", for: indexPath) as? ZPharmacyClViewShopeCategoriesCell
            cell?.lbltitle.text = self.Pharmacydata?.subcategories![indexPath.row].subcategory_title_en
                  return cell!
        } else if collectionView == secOneClView {

            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZPharmacyClViewPartOneCell", for: indexPath) as? ZPharmacyClViewPartOneCell
                       cell?.lbltitl.text = self.Pharmacydata?.section_1![indexPath.row].product_title_en
                       cell?.lblprice.text =  self.Pharmacydata?.section_1![indexPath.row].selling_price ?? "" + " PKR"
                       cell?.lblstock.text = self.Pharmacydata?.section_1![indexPath.row].product_stock ?? "" + " Pieces(InStock)"
                       cell?.img.sd_setImage(with: URL(string: self.Pharmacydata?.section_1![indexPath.row].featured_image ?? "Text"))
                             return cell!
            
            
            
        } else {

            
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZPharmacyClViewPartTwoCell", for: indexPath) as? ZPharmacyClViewPartTwoCell
                                 cell?.lbltitl.text = self.Pharmacydata?.section_1![indexPath.row].product_title_en
                                 cell?.lblprice.text =  self.Pharmacydata?.section_1![indexPath.row].selling_price ?? "" + " PKR"
                                 cell?.lblstock.text = self.Pharmacydata?.section_1![indexPath.row].product_stock ?? "" + " Pieces(InStock)"
                                 cell?.img.sd_setImage(with: URL(string: self.Pharmacydata?.section_1![indexPath.row].featured_image ?? "Text"))
                                       return cell!
            
            
        }
    }


    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                if collectionView == clViewCate {

                    let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                    let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
                    vc!.id =  self.Pharmacydata?.subcategories![indexPath.row].subcategory_id ?? 0
                      vc?.typeno = 2
                    self.navigationController?.pushViewController(vc!, animated: true)

                } else if collectionView == secOneClView {
                    
                          let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                           let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
                          vc?.id =  self.Pharmacydata?.section_1![indexPath.row].products_id ?? 0
                           self.navigationController?.pushViewController(vc!, animated: true)
            
                } else {
                    
                             let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                              let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
                             vc?.id =   self.Pharmacydata?.section_2![indexPath.row].products_id ?? 0
                              self.navigationController?.pushViewController(vc!, animated: true)
                    }
    }
    
    
      
   }



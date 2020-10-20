//
//  ZDigitalVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/29/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZDigitalVC: UIViewController {

    
    
    @IBOutlet weak var secTwoClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secTwoClView: UICollectionView!
    @IBOutlet weak var seconeClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secOneClView: UICollectionView!
    @IBOutlet weak var StoreClView: UICollectionView!
    
   
    @IBOutlet weak var adimg: UIImageView!
    
    @IBOutlet weak var bannerimg: UIImageView!
    
   @IBOutlet weak var searchView: UIView!
           @IBOutlet weak var topBrandOneImg: UIImageView!
           @IBOutlet weak var topBrandTwoImage: UIImageView!
           
           @IBOutlet weak var topBrandThreeImg: UIImageView!
            var ZDigitalydata : ZMartData?
              
             
           
           override func viewDidLoad() {
               super.viewDidLoad()
            
               
               let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))

                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
                    imageView.contentMode = .scaleAspectFit
                    let image = UIImage(named: "Zaraat Mall")
                    imageView.image = image
                    logoContainer.addSubview(imageView)
                    navigationItem.titleView = logoContainer
               
               
               self.topBrandOneImg.layer.cornerRadius = 8
               self.topBrandTwoImage.layer.cornerRadius = 8
               self.topBrandThreeImg.layer.cornerRadius = 8
            
                
            
               
               searchView.roundView()
               addBackButton()
               setNavigationBarWhiteColor()
                GetDigitalProducts()
           }
           
          
    
    override func viewDidLayoutSubviews() {
             super.viewDidLayoutSubviews()

          let newHeight : CGFloat = secOneClView.collectionViewLayout.collectionViewContentSize.height

               seconeClViewHeight.constant = newHeight
                self.secOneClView.reloadData()
                   self.loadViewIfNeeded()
                self.view.setNeedsLayout()
     
     
     let newHeightTwo : CGFloat = secTwoClView.collectionViewLayout.collectionViewContentSize.height

     secTwoClViewHeight.constant = newHeightTwo
      self.secTwoClView.reloadData()
         self.loadViewIfNeeded()
      self.view.setNeedsLayout()
        
    }
      
    
    
    
    
    func GetDigitalProducts() {
            ShareData.showProgress()
            userhandler.getZDigital(Success: {response in
                ShareData.hideProgress()
                if response.success == 1 {
                    self.ZDigitalydata = response.data
                    
                    self.bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
                    self.adimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_2?.category_image ?? "Text"))
                    if self.ZDigitalydata?.daily?.count ?? 0 != 0 {
                        self.topBrandOneImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![0].featured_image ?? "Text"))
                        self.topBrandTwoImage.sd_setImage(with: URL(string: self.ZDigitalydata?.daily![1].featured_image ?? "Text"))
                        self.topBrandThreeImg.sd_setImage(with: URL(string: self.ZDigitalydata?.daily![2].featured_image ?? "Text"))
                    }
    
                    self.StoreClView.reloadData()
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
          
    
              

}

extension ZDigitalVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == StoreClView {
             return self.ZDigitalydata?.subcategories?.count ?? 0
        } else if collectionView ==  secOneClView {
             return self.ZDigitalydata?.section_1?.count ?? 0
        } else {
             return self.ZDigitalydata?.section_2?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == StoreClView {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZDigitalClViewStoreForYouCell", for: indexPath) as? ZDigitalClViewStoreForYouCell
            cell?.lbltitle.text = self.ZDigitalydata?.subcategories![indexPath.row].subcategory_title_en
                  return cell!
        } else if collectionView ==  secOneClView {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZDigitalClViewPartOneCell", for: indexPath) as? ZDigitalClViewPartOneCell
                                  cell?.lbltitl.text = self.ZDigitalydata?.section_1![indexPath.row].product_title_en
                                  cell?.lblprice.text =  self.ZDigitalydata?.section_1![indexPath.row].selling_price ?? "" + " PKR"
                                  cell?.lblstock.text = self.ZDigitalydata?.section_1![indexPath.row].product_stock ?? "" + " Pieces(InStock)"
                                  cell?.img.sd_setImage(with: URL(string: self.ZDigitalydata?.section_1![indexPath.row].featured_image ?? "Text"))
                                        return cell!
        } else {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZDigitalClViewPartTwoCell", for: indexPath) as? ZDigitalClViewPartTwoCell
                                  cell?.lbltitl.text = self.ZDigitalydata?.section_2![indexPath.row].product_title_en
                                  cell?.lblprice.text =  self.ZDigitalydata?.section_2![indexPath.row].selling_price ?? "" + " PKR"
                                  cell?.lblstock.text = self.ZDigitalydata?.section_2![indexPath.row].product_stock ?? "" + " Pieces(InStock)"
                                  cell?.img.sd_setImage(with: URL(string: self.ZDigitalydata?.section_2![indexPath.row].featured_image ?? "Text"))
                                        return cell!
        }
    }
     

 

}

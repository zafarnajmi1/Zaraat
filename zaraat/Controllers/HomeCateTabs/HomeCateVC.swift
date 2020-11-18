//
//  HomeCateVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import SDWebImage

class HomeCateVC: UIViewController {
 var pageIndex: Int = 0
              
    @IBOutlet weak var sectwoclView: UICollectionView!
    @IBOutlet weak var sectwoClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var adimg: UIImageView!
    @IBOutlet weak var seconeClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var seconeClview: UICollectionView!
    @IBOutlet weak var storeForyouClView: UICollectionView!
    @IBOutlet weak var bannerimg: UIImageView!
    var HomeCatedata : HomeCateData?
              
        override func viewDidLoad() {
          super.viewDidLoad()
            adimg.layer.cornerRadius = 8
          
          let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))

               let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
               imageView.contentMode = .scaleAspectFit
               let image = UIImage(named: "Zaraat Mall")
               imageView.image = image
               logoContainer.addSubview(imageView)
               navigationItem.titleView = logoContainer
            
          NotificationCenter.default.addObserver(self, selector: #selector(self.CateData(_:)), name: NSNotification.Name(rawValue: "Cate"), object: nil)
            
          addBackButton()
          setNavigationBarWhiteColor()
            
            self.storeForyouClView.register(UINib.init(nibName: "SubcateGoriesCell", bundle: nil), forCellWithReuseIdentifier: "SubcateGoriesCell")
          
        }
              
             
              
 override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
        storeForyouClView.reloadData()
    
     let newHeightsecone : CGFloat = seconeClview.contentSize.height//collectionViewLayout.collectionViewContentSize.height
          seconeClViewHeight.constant = newHeightsecone + 200
    self.seconeClview.reloadData()
          self.view.setNeedsLayout()
     
     let newHeightsectwo : CGFloat = sectwoclView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
                 sectwoClViewHeight.constant = newHeightsectwo + 200
           self.sectwoclView.reloadData()
                 self.view.setNeedsLayout()
     
 }
    
    
    
    @objc func CateData(_ notification: NSNotification) {
           print(notification.userInfo ?? "")
           if let dict = notification.userInfo as NSDictionary? {
            if let id = dict["Cateid"]{
                getHomeCateProductsApi(id:id as! Int)
               }
           }
    }
    
    
    
    func getHomeCateProductsApi(id:Int) {
        ShareData.showProgress()
        userhandler.getCateProducts(Cate: id, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.HomeCatedata =  response.data
                
                if self.HomeCatedata?.ad_1?.category_image == "" {
                    self.adimg.isHidden = true
                } else {
                    
                    self.adimg.isHidden = false
                    self.adimg.sd_setImage(with: URL(string: self.self.HomeCatedata?.ad_1?.category_image ?? "Text"))
               }
                
                self.bannerimg.sd_setImage(with: URL(string:self.HomeCatedata?.ad_2?.category_image ?? "Text"))
                
                self.sectwoclView.reloadData()
                self.seconeClview.reloadData()
                self.storeForyouClView.reloadData()
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
  extension HomeCateVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    
      func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
      }
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  storeForyouClView {
            return self.HomeCatedata?.sub_categories?.count ?? 0
        } else if collectionView ==  seconeClview {
            return self.HomeCatedata?.section_1?.count ?? 0
        } else {
            return self.HomeCatedata?.section_2?.count ?? 0
        }

      }

      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             
          if collectionView ==  storeForyouClView {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubcateGoriesCell", for: indexPath) as? SubcateGoriesCell
               cell?.lbltitle.text =  self.HomeCatedata?.sub_categories?[indexPath.row].subcategory_title_en
            //cell?.img.sd_setImage(with: URL(string: self.HomeCatedata?.sub_categories?[indexPath.row]. ?? "Text"))
                        return cell!
            
                 } else if collectionView ==  seconeClview {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCateClViewPartTwoCell", for: indexPath) as? HomeCateClViewPartTwoCell
            
                    cell?.lbltitle.text =  self.HomeCatedata?.section_1?[indexPath.row].product_title_en
            cell?.lblPrice.text =  "PKR :" + (self.HomeCatedata?.section_1?[indexPath.row].selling_price)!
                    cell?.lblstock.text =  "(InStock) :" + (self.HomeCatedata?.section_1?[indexPath.row].product_stock)!
                    cell?.img.sd_setImage(with: URL(string: self.HomeCatedata?.section_1![indexPath.row].featured_image ?? "Text"))
        
                    return cell!
                 } else {
                     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCateClViewPartThreeCell", for: indexPath) as? HomeCateClViewPartThreeCell
            
                    cell?.lbltitle.text =  self.HomeCatedata?.section_2?[indexPath.row].product_title_en
                    cell?.lblPrice.text =  "PKR :" + (self.HomeCatedata?.section_2?[indexPath.row].selling_price)!
                    cell?.lblstock.text =  "(InStock) :" + (self.HomeCatedata?.section_2?[indexPath.row].product_stock)!
                    cell?.img.sd_setImage(with: URL(string: self.HomeCatedata?.section_2![indexPath.row].featured_image ?? "Text"))
                        
            return cell!
                 }

      }
     

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == storeForyouClView {

                let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
                vc!.id =  self.HomeCatedata?.sub_categories![indexPath.row].subcategory_id ?? 0
                  vc?.typeno = 2
                self.navigationController?.pushViewController(vc!, animated: true)

            } else if collectionView == seconeClview {
                
                      let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                       let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
                      vc?.id =  self.HomeCatedata?.section_1![indexPath.row].products_id ?? 0
                       self.navigationController?.pushViewController(vc!, animated: true)
        
            } else {
                
                         let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                          let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
                         vc?.id =   self.HomeCatedata?.section_2![indexPath.row].products_id ?? 0
                          self.navigationController?.pushViewController(vc!, animated: true)
                }
    }
    
  }



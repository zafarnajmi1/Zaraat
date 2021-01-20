//
//  HomeButtonsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeButtonsVC: UIViewController {

    var id = 0
    @IBOutlet weak var Bannerimg: UIImageView!
    @IBOutlet weak var secTwoClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secTwoClView: UICollectionView!
    @IBOutlet weak var adimg: UIImageView!
    @IBOutlet weak var secOneClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secOneClView: UICollectionView!
    @IBOutlet weak var StoreClView: UICollectionView!
    
     @IBOutlet weak var threeView: UIView!

     @IBOutlet weak var oneView: UIView!

     @IBOutlet weak var twoView: UIView!
     
     
    @IBOutlet weak var searchView: UIView!
            @IBOutlet weak var topBrandOneImg: UIImageView!
            @IBOutlet weak var topBrandTwoImage: UIImageView!
            
            @IBOutlet weak var topBrandThreeImg: UIImageView!
            
              
                var ZDigitalydata : ZMartData?
            
            override func viewDidLoad() {
                super.viewDidLoad()
             
                
//                let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
//
//                     let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
//                     imageView.contentMode = .scaleAspectFit
//                     let image = UIImage(named: "Zaraat Mall")
//                     imageView.image = image
//                     logoContainer.addSubview(imageView)
//                     navigationItem.titleView = logoContainer
                self.title = "Zaraat"
                
                self.topBrandOneImg.layer.cornerRadius = 8
                self.topBrandTwoImage.layer.cornerRadius = 8
                self.topBrandThreeImg.layer.cornerRadius = 8
             
                 self.oneView.layer.cornerRadius = 8
                 self.twoView.layer.cornerRadius = 8
                 self.threeView.layer.cornerRadius = 8
             
                
                //searchView.roundView()
                addBackButton()
                setNavigationBarWhiteColor()
                
                if id == 1 {
                    self.GetFashionProducts()
                    
                } else if id  == 2 {
                    GetElectronicsProducts()
                } else if id == 3 {
                     GethomeLifeStyleProducts()
                } else if id == 4 {
                    GetEducationProducts()
                } else if id == 5 {
                    GetWatchesProducts()
                } else {
                    GethomeAppliances()
                }
               
            }
            
           func GetFashionProducts() {
                      ShareData.showProgress()
                      userhandler.getFashion(Success: {response in
                          ShareData.hideProgress()
                          if response.success == 1 {
                              self.ZDigitalydata = response.data
                            if self.ZDigitalydata?.ad_2?.category_image == "" {
                                self.adimg.isHidden = true
                            } else {
                                self.adimg.isHidden = false
                             self.adimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_2?.category_image ?? "Text"))
                            }
                            
                            
                              self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
                             
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
    
    
    
    

    func GetElectronicsProducts() {
               ShareData.showProgress()
               userhandler.getElectronics(Success: {response in
                   ShareData.hideProgress()
                   if response.success == 1 {
                       self.ZDigitalydata = response.data
                       
                       self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
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
                    
            
    
    
               func GethomeLifeStyleProducts() {
                       ShareData.showProgress()
                       userhandler.getHomeLifeStyle(Success: {response in
                           ShareData.hideProgress()
                           if response.success == 1 {
                               self.ZDigitalydata = response.data
                               
                               self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
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
           
    
    
    
    
    func GetEducationProducts() {
                          ShareData.showProgress()
                          userhandler.geteducation(Success: {response in
                              ShareData.hideProgress()
                              if response.success == 1 {
                                  self.ZDigitalydata = response.data
                                  
                                  self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
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

    
    
    
    
    func GetWatchesProducts() {
            ShareData.showProgress()
            userhandler.getWatchs(Success: {response in
                ShareData.hideProgress()
                if response.success == 1 {
                    self.ZDigitalydata = response.data
                    
                    self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
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

    
    
    func GethomeAppliances() {
            ShareData.showProgress()
            userhandler.getHomeAppliances(Success: {response in
                ShareData.hideProgress()
                if response.success == 1 {
                    self.ZDigitalydata = response.data
                    
                    self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
                    
                    
                    if self.ZDigitalydata?.ad_2?.category_image == "" {
                        self.adimg.isHidden = true
                    } else {
                        self.adimg.isHidden = false
                         self.adimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_2?.category_image ?? "Text"))
                    }
                   
                   self.topBrandOneImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![0].featured_image ?? "Text"))
                   self.topBrandThreeImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![2].featured_image ?? "Text"))
                    self.topBrandTwoImage.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![1].featured_image ?? "Text"))
                    
//                    if (self.ZDigitalydata?.daily?.indices.contains(0))! {
//                        self.topBrandOneImg.isHidden = false
//                        self.topBrandOneImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![0].featured_image ?? "Text"))
//                    } else {
//                        self.topBrandOneImg.isHidden = true
//                    }
//
//
//
//                    if (self.ZDigitalydata?.daily?.indices.contains(1))! {
//                        self.topBrandTwoImage.isHidden = false
//                        self.topBrandTwoImage.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![1].featured_image ?? "Text"))
//                    } else {
//                       self.topBrandTwoImage.isHidden = true
//                    }
//
//
//
//                    if (self.ZDigitalydata?.daily?.indices.contains(2))! {
//                       self.topBrandThreeImg.isHidden = false
//                        self.topBrandThreeImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![2].featured_image ?? "Text"))
//                    } else {
//                        self.topBrandThreeImg.isHidden = true
//                    }
//
                    
    
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
    
    
    
    
    @IBAction func adoneAction(_ sender: UIButton) {
        if (self.ZDigitalydata?.daily?.indices.contains(0))! {
                let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductListsVC") as? ProductListsVC
                vc!.id =  self.ZDigitalydata?.daily![0].subcategory_id ?? 0
                vc?.typeno = 2
                self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    
    @IBAction func adtwoAction(_ sender: UIButton) {
         if (self.ZDigitalydata?.daily?.indices.contains(1))! {
                    let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                    let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductListsVC") as? ProductListsVC
                    vc!.id =  self.ZDigitalydata?.daily![1].subcategory_id ?? 0
                    vc?.typeno = 2
                    self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    @IBAction func adThreeAction(_ sender: UIButton) {
         if (self.ZDigitalydata?.daily?.indices.contains(2))! {
            let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
              let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductListsVC") as? ProductListsVC
              vc!.id =  self.ZDigitalydata?.daily![2].subcategory_id ?? 0
                vc?.typeno = 2
              self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}


extension HomeButtonsVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
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
           let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HomeButtonsClViewStoreForYouCell", for: indexPath) as? HomeButtonsClViewStoreForYouCell
             cell?.lbltitle.text = self.ZDigitalydata?.subcategories![indexPath.row].subcategory_title_en
            return cell!
        } else if collectionView ==  secOneClView {
             let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HomeButtonClViewPartOneCell", for: indexPath) as? HomeButtonClViewPartOneCell
                                              cell?.lbltitl.text = self.ZDigitalydata?.section_1![indexPath.row].product_title_en
            cell?.lblprice.text =  "PKR :" + (self.ZDigitalydata?.section_1![indexPath.row].selling_price)! 
            cell?.lblstock.text = "(InStock) :" + (self.ZDigitalydata?.section_1![indexPath.row].product_stock)! 
                                              cell?.img.sd_setImage(with: URL(string: self.ZDigitalydata?.section_1![indexPath.row].featured_image ?? "Text"))
                                                    return cell!
        } else {
             let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HomeButtonClViewPartTwoCell", for: indexPath) as? HomeButtonClViewPartTwoCell
                                              cell?.lbltitl.text = self.ZDigitalydata?.section_2![indexPath.row].product_title_en
            cell?.lblprice.text =  "PKR :" + (self.ZDigitalydata?.section_2![indexPath.row].selling_price)!
            cell?.lblstock.text = "(InStock) :" + (self.ZDigitalydata?.section_2![indexPath.row].product_stock)!
                                              cell?.img.sd_setImage(with: URL(string: self.ZDigitalydata?.section_2![indexPath.row].featured_image ?? "Text"))
                                                    return cell!
        }
    }
    

   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

               if collectionView == StoreClView {

                   let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                   let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductListsVC") as? ProductListsVC
                   vc!.id =  self.ZDigitalydata?.subcategories![indexPath.row].subcategory_id ?? 0
                     vc?.typeno = 2
                   self.navigationController?.pushViewController(vc!, animated: true)

               } else if collectionView == secOneClView {
                   
                         let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                          let vc =  StoryBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as?  ProductDetailVC
                         vc?.id =  self.ZDigitalydata?.section_1![indexPath.row].products_id ?? 0
                          self.navigationController?.pushViewController(vc!, animated: true)
           
               } else {
                   
                            let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                             let vc =  StoryBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as?  ProductDetailVC
                            vc?.id =   self.ZDigitalydata?.section_2![indexPath.row].products_id ?? 0
                             self.navigationController?.pushViewController(vc!, animated: true)
                   }
   }
 
}

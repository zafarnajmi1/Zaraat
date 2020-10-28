//
//  B2BHomeButtonsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class B2BHomeButtonsVC: UIViewController {

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
                 
                     self.oneView.layer.cornerRadius = 8
                     self.twoView.layer.cornerRadius = 8
                     self.threeView.layer.cornerRadius = 8
                 
                    
                    searchView.roundView()
                    addBackButton()
                    setNavigationBarWhiteColor()
                    
                    if id == 1 {
                        self.GetLiveStockProducts()
                        
                    } else if id  == 2 {
                        GetSeedsProducts()
                    } else if id == 3 {
                         GetPesticidesProducts()
                    } else if id == 4 {
                        GetirregationProducts()
                    } else if id == 5 {
                        GetColdStorageProducts()
                    } else if id == 6 {
                        GettuunelFarming()
                    } else if id == 7 {
                        GetFertilizers()
                    } else if id == 8 {
                        GetMachinry()
                    } else if id == 9 {
                        GetCrops()
                    } else {
                        GetPrintings()
                    }
                   
                }
                
               func GetLiveStockProducts() {
                          ShareData.showProgress()
                          userhandler.getLiveStock(Success: {response in
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
        
        
        
        

        func GetSeedsProducts() {
                   ShareData.showProgress()
                   userhandler.getSeeds(Success: {response in
                       ShareData.hideProgress()
                       if response.success == 1 {
                           self.ZDigitalydata = response.data
                           
                           self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
                           self.adimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_2?.category_image ?? "Text"))
                           if self.ZDigitalydata?.daily?.count ?? 0 != 0 {
                            
                            if let imgone = self.ZDigitalydata?.daily?[0].featured_image {
                                self.topBrandOneImg.sd_setImage(with: URL(string:imgone))
                            }
                            
                            
                            if  (self.ZDigitalydata?.daily?.indices.contains(1))! {
                                self.topBrandTwoImage.sd_setImage(with: URL(string: self.ZDigitalydata?.daily?[1].featured_image ?? "Text"))
                            }
                               
                            
                            if  (self.ZDigitalydata?.daily?.indices.contains(2))!  {
                                self.topBrandThreeImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily?[2].featured_image ?? "Text"))
                            }
                               
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
                        
                
        
        
                   func GetPesticidesProducts() {
                           ShareData.showProgress()
                           userhandler.getPesticides(Success: {response in
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
               
        
        
        
        
        func GetirregationProducts() {
                              ShareData.showProgress()
                              userhandler.getIrregation(Success: {response in
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

        
        
        
        
        func GetColdStorageProducts() {
                ShareData.showProgress()
                userhandler.getColdStorage(Success: {response in
                    ShareData.hideProgress()
                    if response.success == 1 {
                        self.ZDigitalydata = response.data
                        
                        self.Bannerimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_1?.category_image ?? "Text"))
                        self.adimg.sd_setImage(with: URL(string: self.ZDigitalydata?.ad_2?.category_image ?? "Text"))
                        if self.ZDigitalydata?.daily?.count ?? 0 != 0 {
                            self.topBrandOneImg.sd_setImage(with: URL(string:self.ZDigitalydata?.daily![0].featured_image ?? "Text"))
                            
                            if (self.ZDigitalydata?.daily?.indices.contains(1))! {
                            self.topBrandTwoImage.sd_setImage(with: URL(string: self.ZDigitalydata?.daily![1].featured_image ?? "Text"))
                            }
                             if (self.ZDigitalydata?.daily?.indices.contains(2))! {
                            self.topBrandThreeImg.sd_setImage(with: URL(string: self.ZDigitalydata?.daily![2].featured_image ?? "Text"))
                            }
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

        
        
        func GettuunelFarming() {
                ShareData.showProgress()
                userhandler.getTunnelFarming(Success: {response in
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
        
        
    
    func GetFertilizers() {
                   ShareData.showProgress()
                   userhandler.getFertilizers(Success: {response in
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
           
    
    
    
    func GetMachinry() {
            ShareData.showProgress()
            userhandler.getMachinery(Success: {response in
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
    
    
    
    
    func GetCrops() {
              ShareData.showProgress()
              userhandler.getCrops(Success: {response in
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
    
    
    
    
    func GetPrintings() {
              ShareData.showProgress()
              userhandler.getPrinting(Success: {response in
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
    
        
    
    @IBAction func adoneAction(_ sender: Any) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
        vc!.id =  self.ZDigitalydata?.daily![0].subcategory_id ?? 0
          vc?.typeno = 2
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    @IBAction func adtwoAction(_ sender: Any) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
        vc!.id =  self.ZDigitalydata?.daily![1].subcategory_id ?? 0
          vc?.typeno = 2
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    @IBAction func adthreeAction(_ sender: Any) {
        
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
        vc!.id =  self.ZDigitalydata?.daily![2].subcategory_id ?? 0
          vc?.typeno = 2
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
        
    }


    extension B2BHomeButtonsVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
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
                cell?.lblprice.text = " PKR : " + (self.ZDigitalydata?.section_1![indexPath.row].selling_price)!
        cell?.lblstock.text = "(InStock) : " +   (self.ZDigitalydata?.section_1![indexPath.row].product_stock)!
          cell?.img.sd_setImage(with: URL(string: self.ZDigitalydata?.section_1![indexPath.row].featured_image ?? "Text"))
                return cell!
            } else {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HomeButtonClViewPartTwoCell", for: indexPath) as? HomeButtonClViewPartTwoCell
          cell?.lbltitl.text = self.ZDigitalydata?.section_2![indexPath.row].product_title_en
                cell?.lblprice.text = " PKR : " +  (self.ZDigitalydata?.section_2![indexPath.row].selling_price)! 
                cell?.lblstock.text =  "(InStock) : " +  (self.ZDigitalydata?.section_2![indexPath.row].product_stock)!
          cell?.img.sd_setImage(with: URL(string: self.ZDigitalydata?.section_2![indexPath.row].featured_image ?? "Text"))
                return cell!
            }
        }
        

       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                   if collectionView == StoreClView {

                       let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                       let vc =  storyBoard.instantiateViewController(identifier: "ProductListsVC") as? ProductListsVC
                       vc!.id =  self.ZDigitalydata?.subcategories![indexPath.row].subcategory_id ?? 0
                         vc?.typeno = 2
                       self.navigationController?.pushViewController(vc!, animated: true)

                   } else if collectionView == secOneClView {
                       
                             let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                              let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
                             vc?.isb2b = 2
                             vc?.id =  self.ZDigitalydata?.section_1![indexPath.row].products_id ?? 0
                              self.navigationController?.pushViewController(vc!, animated: true)
               
                   } else {
                       
                                let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                                 let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
                                vc?.id =   self.ZDigitalydata?.section_2![indexPath.row].products_id ?? 0
                    vc?.isb2b = 2
                                 self.navigationController?.pushViewController(vc!, animated: true)
                       }
       }
     
    }

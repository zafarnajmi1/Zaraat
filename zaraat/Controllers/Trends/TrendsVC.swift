//
//  TrendsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SDWebImage
class TrendsVC: UIViewController {
      @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var trendClView: UICollectionView!
    
    
    @IBOutlet weak var toponeimg: UIImageView!
    @IBOutlet weak var toptwoimg: UIImageView!
    
    @IBOutlet weak var topthree: UIImageView!
    
    @IBOutlet weak var topfoureimg: UIImageView!
    
    @IBOutlet weak var topfiveimg: UIImageView!
    @IBOutlet weak var seconeHeight: NSLayoutConstraint!
    
    @IBOutlet weak var adimg: UIImageView!
    @IBOutlet weak var secOneClView: UICollectionView!
    
    
    @IBOutlet weak var secTwoHeight: NSLayoutConstraint!
    @IBOutlet weak var secTwoClView: UICollectionView!
    var trendData : TrendingProductsData?
  
    override func viewDidLoad() {
      super.viewDidLoad()
     searchView.roundView()
      
      self.navigationItem.title = "Trends"
      
      setNavigationBarWhiteColor()
     trendDataApi()
        
        self.toponeimg.layer.cornerRadius =  8
        self.toptwoimg.layer.cornerRadius =  8
        self.topthree.layer.cornerRadius =  8
        self.topfoureimg.layer.cornerRadius =  8
        self.topfiveimg.layer.cornerRadius =  8
        self.adimg.layer.cornerRadius =  8
  }
                  
    func trendDataApi() {
        ShareData.showProgress()
        userhandler.getTrendingProducts(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.trendData = response.data
                
                self.toponeimg.sd_setImage(with: URL(string: self.trendData?.top_trending?[0].featured_image ?? "Text"))
                 self.toptwoimg.sd_setImage(with: URL(string: self.trendData?.top_trending?[1].featured_image ?? "Text"))
                 self.topthree.sd_setImage(with: URL(string: self.trendData?.top_trending?[2].featured_image ?? "Text"))
                 self.topfoureimg.sd_setImage(with: URL(string: self.trendData?.top_trending?[3].featured_image ?? "Text"))
                 self.topfiveimg.sd_setImage(with: URL(string: self.trendData?.top_trending?[4].featured_image ?? "Text"))
                
                self.adimg.sd_setImage(with: URL(string: self.trendData?.ad?.category_image ?? "Text"))
                
                self.trendClView.reloadData()
                self.secTwoClView.reloadData()
                self.secOneClView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
    
        let newHeightsecone : CGFloat = secOneClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
             seconeHeight.constant = newHeightsecone
       self.secOneClView.reloadData()
             self.view.setNeedsLayout()
        
        let newHeightsectwo : CGFloat = secTwoClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
                    seconeHeight.constant = newHeightsectwo
              self.secTwoClView.reloadData()
                    self.view.setNeedsLayout()
        
    }
    
                 
}
         
extension TrendsVC :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView ==  trendClView {
        return  self.trendData?.stores?.count ?? 0
        } else if collectionView == secOneClView {
              return  self.trendData?.section_1?.count ?? 0
        } else {
              return  self.trendData?.section_2?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == trendClView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeButtonsClViewStoreForYouCell", for: indexPath) as? HomeButtonsClViewStoreForYouCell
        cell?.lbltitle.text =  self.trendData?.stores![indexPath.row].category_title_en
        return cell!
        } else if collectionView == secOneClView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendsClViewPartOneCell", for: indexPath) as? TrendsClViewPartOneCell
            cell?.lbltitle.text =  self.trendData?.section_1![indexPath.row].product_title_en
            cell?.lblPrice.text =  self.trendData?.section_1![indexPath.row].selling_price
            cell?.lblstock.text =  self.trendData?.section_1![indexPath.row].product_stock ?? "" + " Pieces(InStock)"
            cell?.img.sd_setImage(with: URL(string: self.trendData?.section_1![indexPath.row].featured_image ?? "Text"))
               return cell!
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendsClViewPartThreeCell", for: indexPath) as? TrendsClViewPartThreeCell
            cell?.lbltitle.text =  self.trendData?.section_2![indexPath.row].product_title_en
            cell?.lblPrice.text =  self.trendData?.section_2![indexPath.row].selling_price
            cell?.lblstock.text =  self.trendData?.section_2![indexPath.row].product_stock ?? "" + " Pieces(InStock)"
            cell?.img.sd_setImage(with: URL(string: self.trendData?.section_2![indexPath.row].featured_image ?? "Text"))
               return cell!
        }
    }
    
    
}





//    extension TrendsVC :  UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//       return 3
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       if indexPath.section == 0 {
//           let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartOneCell") as? TrendsPartOneCell
//           return (cell?.ClView.contentSize.height)!
//       } else if indexPath.section == 2 {
//           let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartThreeCell") as? TrendsPartThreeCell
//           return (cell?.ClView.contentSize.height)! + 1500
//       }else  {
//            return UITableView.automaticDimension
//       }
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//       if indexPath.section == 0 {
//       let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartOneCell") as? TrendsPartOneCell
//        cell?.sectionOne =  self.trendData?.section_1 ?? []
//       return cell!
//       } else if indexPath.section == 1 {
//           let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsAdsCell") as? TrendsAdsCell
//                  return cell!
//
//       } else  {
//
//           let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartThreeCell") as? TrendsPartThreeCell
//           return cell!
//       }
//    }
//
//
//    }

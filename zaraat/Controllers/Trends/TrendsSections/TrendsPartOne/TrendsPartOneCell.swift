//
//  TrendsPartOneCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import SDWebImage
class TrendsPartOneCell: UITableViewCell {

        @IBOutlet weak var ClView: UICollectionView!
      var sectionOne = [TrendingProductsSection_1]()
    
           override func awakeFromNib() {
               super.awakeFromNib()
               self.ClView.delegate =  self
               self.ClView.dataSource =  self
               self.ClView.reloadData()
               selectionStyle = .none
               //self.ClView.register(UINib.init(nibName: "ZPharmacyClViewShopeCategoriesCell", bundle: nil), forCellWithReuseIdentifier: "ZPharmacyClViewShopeCategoriesCell")
           }

           override func setSelected(_ selected: Bool, animated: Bool) {
               super.setSelected(selected, animated: animated)

               // Configure the view for the selected state
           }
           
       }
       extension TrendsPartOneCell :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
           
           func numberOfSections(in collectionView: UICollectionView) -> Int {
               return 1
           }
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.sectionOne.count
           }
           
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendsClViewPartOneCell", for: indexPath) as? TrendsClViewPartOneCell
            cell?.lbltitle.text =  self.sectionOne[indexPath.row].product_title_en
            cell?.lblPrice.text =  self.sectionOne[indexPath.row].selling_price
            cell?.lblstock.text =  self.sectionOne[indexPath.row].product_stock ?? "" + " Pieces(InStock)"
            cell?.img.sd_setImage(with: URL(string: self.sectionOne[indexPath.row].featured_image ?? "Text"))
               return cell!
           }
           
           
       }

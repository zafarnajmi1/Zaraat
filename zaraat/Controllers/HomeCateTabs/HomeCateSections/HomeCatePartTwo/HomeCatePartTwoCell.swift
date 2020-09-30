//
//  HomeCatePartTwoCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeCatePartTwoCell: UITableViewCell {

    @IBOutlet weak var ClView: UICollectionView!
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
          extension HomeCatePartTwoCell :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
              
              func numberOfSections(in collectionView: UICollectionView) -> Int {
                  return 1
              }
              func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                  return 10
              }
              
              func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCateClViewPartTwoCell", for: indexPath) as? HomeCateClViewPartTwoCell
                  return cell!
              }
              
              
          }

//
//  ZDigitalPartTwoCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/29/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZDigitalPartTwoCell: UITableViewCell {

    @IBOutlet weak var ClView: UICollectionView!
                   override func awakeFromNib() {
                       super.awakeFromNib()
                       self.ClView.delegate =  self
                       self.ClView.dataSource =  self
                       self.ClView.reloadData()
                       selectionStyle = .none
                       //self.ClView.register(UINib.init(nibName: "ZPharmacyClViewShopeCategoriesCell", bundle: nil), forCellWithReuseIdentifier: "ZPharmacyClViewShopeCategoriesCell")
                   }

       //              func setCollectionViewDataSourceDelegate
       //                   <D: UICollectionViewDataSource & UICollectionViewDelegate>
       //                   (dataSourceDelegate: D, forRow row: Int) {
       //
       //                   ClView.delegate = dataSourceDelegate
       //                   ClView.dataSource = dataSourceDelegate
       //                   ClView.tag = row
       //                   ClView.reloadData()
       //               }
                     
                   
               }

           extension ZDigitalPartTwoCell :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
               
               func numberOfSections(in collectionView: UICollectionView) -> Int {
                   return 1
               }
               func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                   return 10
               }
               
               func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZDigitalClViewPartTwoCell", for: indexPath) as? ZDigitalClViewPartTwoCell
                   return cell!
               }
               
               
           }

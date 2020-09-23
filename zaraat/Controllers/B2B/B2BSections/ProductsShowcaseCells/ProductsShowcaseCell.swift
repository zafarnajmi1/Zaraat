//
//  ProductsShowcaseCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ProductsShowcaseCell: UITableViewCell {

    @IBOutlet weak var clView: UICollectionView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            clView.delegate =  self
            clView.dataSource =  self
            self.selectionStyle = .none
            
            self.clView.reloadData()
            self.layoutIfNeeded()
            //self.clView.register(UINib.init(nibName: "topRatedClView", bundle: nil), forCellWithReuseIdentifier: "topRatedClView")
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }

    extension ProductsShowcaseCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClViewProductsShowcase", for: indexPath) as? ClViewProductsShowcase
            return cell!
        }
        
        
    }

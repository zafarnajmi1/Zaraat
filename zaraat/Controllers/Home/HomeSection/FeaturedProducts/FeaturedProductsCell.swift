//
//  FeaturedProductsCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/31/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FeaturedProductsCell: UITableViewCell {

    @IBOutlet weak var btnViewAll: UIButton!
    
    @IBOutlet weak var clView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnViewAll.roundButton()
        self.selectionStyle = .none
        self.clView.reloadData()
        self.clView.delegate  = self
        self.clView.dataSource  = self
        self.layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
extension FeaturedProductsCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsClView", for: indexPath) as? FeaturedProductsClView
        return cell!
    }
    
    
}

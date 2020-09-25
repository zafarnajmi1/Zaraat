//
//  ZMallStoreForYouCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/25/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZMallStoreForYouCell: UITableViewCell {
    @IBOutlet weak var ClView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle =  .none
        ClView.delegate = self
        ClView.dataSource = self
              
        ClView.reloadData()
    }

    
//    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
//        clView.delegate = dataSourceDelegate
//        clView.dataSource = dataSourceDelegate
//        clView.tag = row
//        clView.reloadData()
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ZMallStoreForYouCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZMallClViewStoreForyouCell", for: indexPath) as? ZMallClViewStoreForyouCell
        return cell!
    }
    
    
}

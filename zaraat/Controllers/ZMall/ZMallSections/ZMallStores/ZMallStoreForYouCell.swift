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
         self.layoutIfNeeded()
    }

//    @IBOutlet weak var flow: UICollectionViewFlowLayout! {
//           didSet {
//               flow.minimumLineSpacing = 8.0
//            flow.estimatedItemSize = CGSize(width: 155.0, height: 66.0)
//            flow.scrollDirection = .vertical
//           }
//       }
//       
//       func setupCell() {
//           contentView.layoutIfNeeded()
//       }
////    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
////        clView.delegate = dataSourceDelegate
////        clView.dataSource = dataSourceDelegate
////        clView.tag = row
////        clView.reloadData()
////    }
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        ClView.frame = CGRect(x: 8.0, y: 8.0, width: targetSize.width, height: CGFloat(MAXFLOAT))
//        ClView.layoutIfNeeded()
//        return ClView.collectionViewLayout.collectionViewContentSize
//    }

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

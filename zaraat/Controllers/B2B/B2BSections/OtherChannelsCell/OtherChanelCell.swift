//
//  OtherChanelCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol otherchanelProtocol {
    func otherDelgate(cell:OtherChanelCell)
}
class OtherChanelCell: UITableViewCell {

   //@IBOutlet weak var subViewimg: ShadowView!
        //@IBOutlet weak var btnViewAll: UIButton!
        @IBOutlet weak var clView: UICollectionView!
    var delegate:otherchanelProtocol?
        override func awakeFromNib() {
            super.awakeFromNib()
            //btnViewAll.roundButton()
            self.clView.delegate = self
            self.clView.dataSource =  self
            self.selectionStyle =  .none
            //self.subViewimg.setroundCornerView(corner: 5)
            //self.clView.register(UINib.init(nibName: "FlashCellClView", bundle: nil), forCellWithReuseIdentifier: "FlashCellClView")
        }
    //    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
    //        collectionView.delegate = dataSourceDelegate
    //        collectionView.dataSource = dataSourceDelegate
    //        collectionView.tag = row
    //        collectionView.reloadData()
    //    }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            
        }
    
    
   
        
    }

    extension OtherChanelCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 1
    //    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize.init(width: collectionView.frame.width / 3, height: collectionView.frame.height + 100)
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClviewOtherChenlsCell", for: indexPath) as? ClviewOtherChenlsCell
            return cell!
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.delegate?.otherDelgate(cell: self)
        }
        
    }

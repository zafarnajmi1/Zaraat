//
//  ZMallPartOneCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/25/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZMallPartOneCell: UITableViewCell {

    @IBOutlet weak var ClView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        ClView.delegate = self
               ClView.dataSource = self
                     
               //ClView.reloadData()
    }
    
//    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
//        ClView.delegate = dataSourceDelegate
//        ClView.dataSource = dataSourceDelegate
//        ClView.tag = row
//        ClView.reloadData()
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ZMallPartOneCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZMallClViewPartOneCell", for: indexPath) as? ZMallClViewPartOneCell
        return cell!
    }
    
    
}

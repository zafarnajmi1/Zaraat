//
//  topRatedCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class topRatedCell: UITableViewCell {

    
    
    @IBOutlet weak var clView: UICollectionView! 
    @IBOutlet weak var btnAlViewe: UIButton!
    var topproducts = [Top_products]()
    override func awakeFromNib() {
        super.awakeFromNib()
        clView.delegate =  self
        clView.dataSource =  self
        self.selectionStyle = .none
        btnAlViewe.roundButton()
//        self.clView.reloadData()
//        self.layoutIfNeeded()
        //self.clView.register(UINib.init(nibName: "topRatedClView", bundle: nil), forCellWithReuseIdentifier: "topRatedClView") 
    }

    
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        clView.delegate = dataSourceDelegate
        clView.dataSource = dataSourceDelegate
        clView.tag = row
        clView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension topRatedCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topproducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedClView", for: indexPath) as? topRatedClView
        let obj =  topproducts[indexPath.row]
        cell?.LoadData(obj: obj)
       
        return cell!
    }
    
    
}

//
//  ZMartPartTwoCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZMartPartTwoCell: UITableViewCell {

     @IBOutlet weak var ClView: UICollectionView!
        override func awakeFromNib() {
            super.awakeFromNib()
            selectionStyle = .none
            ClView.delegate = self
            ClView.dataSource = self
            layoutIfNeeded()
                         
                   //ClView.reloadData()
        }
    
        
        


    }
    extension ZMartPartTwoCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ZMartClViewPartTwoCell", for: indexPath) as? ZMartClViewPartTwoCell
            return cell!
        }
        
        
    }

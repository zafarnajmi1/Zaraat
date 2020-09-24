//
//  OneCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
protocol OneCellProtocol {
    func onecelldelegate(cell:OneCell)
}
class OneCell: UITableViewCell {
    
    var delegate :OneCellProtocol?
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

  extension OneCell :  UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
      }
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 10
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "clViewOneCell", for: indexPath) as? clViewOneCell
       
        

          return cell!
      }
      
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
        self.delegate?.onecelldelegate(cell: self)
      }
  }

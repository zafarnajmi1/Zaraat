//
//  HotDealCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HotDealCell: UITableViewCell {
    
@IBOutlet weak var HotDealClView: UICollectionView!
   @IBOutlet weak var mainView: UIView!
       
    
        
       
        override func awakeFromNib() {
            super.awakeFromNib()
            self.selectionStyle = .none
            
            mainView.layer.borderWidth = 0.5
            mainView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            mainView.clipsToBounds = true
             mainView.layer.cornerRadius = 20
            //mainView.roundCorners([.topRight, .bottomRight, .topLeft, .bottomLeft], radius: 20)
            self.HotDealClView.dataSource = self
            self.HotDealClView.delegate = self
            self.HotDealClView.register(UINib.init(nibName: "HotDealCLView", bundle: nil), forCellWithReuseIdentifier: "HotDealCLView")
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            
        }
        
        
    }
    extension HotDealCell : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                   let height = collectionView.frame.height
                   let width = UIScreen.main.bounds.width
                   let size = CGSize(width: width / 4 , height: height  )
                   return size
               }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let  cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HotDealCLView", for: indexPath) as? HotDealCLView
            return cell!
        }
        
        
        
        
        
    }

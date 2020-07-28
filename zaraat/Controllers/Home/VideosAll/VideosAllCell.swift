//
//  VideosAllCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class VideosAllCell: UITableViewCell {
    //@IBOutlet weak var segment: UISegmentedControl!
    
    //@IBOutlet weak var clHeight: NSLayoutConstraint!
    
    @IBOutlet weak var allCLView: UICollectionView!
    //var delegate:updateTablView?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.allCLView.dataSource = self
        self.allCLView.delegate = self
        self.allCLView.register(UINib.init(nibName: "AllCLView", bundle: nil), forCellWithReuseIdentifier: "AllCLView")
        self.allCLView.register(UINib.init(nibName: "VideosCLView", bundle: nil), forCellWithReuseIdentifier: "VideosCLView")
        
        allCLView.reloadData()
          layoutIfNeeded()
        
    }
    
    func setUpCell() {
        contentView.layoutIfNeeded()
    }
    
    
//    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
//        allCLView.delegate = dataSourceDelegate
//        allCLView.dataSource = dataSourceDelegate
//        allCLView.tag = row
//        allCLView.reloadData()
//    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         }
   
}
extension VideosAllCell : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          print("fram item height", collectionView.frame.height)
        let height = collectionView.frame.height + 50
        let width = UIScreen.main.bounds.width - 70
        let size = CGSize(width: width / 2, height: height / 2    )
        return size
        
       
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 14
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row >= 5 {
    
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "AllCLView", for: indexPath) as? AllCLView
             cell?.setupCell()
        return cell!
        } else {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "VideosCLView", for: indexPath) as? VideosCLView
                        cell?.setupCell()
                   return cell!
        }
    }
    
    
}

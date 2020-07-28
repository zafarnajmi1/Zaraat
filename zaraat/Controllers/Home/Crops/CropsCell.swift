//
//  CropsCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CropsCell: UITableViewCell {
   
    
    
    @IBOutlet weak var btnSeeAll: UIButton!
    
    @IBOutlet weak var cropClView: UICollectionView!
    
    @IBOutlet weak var pagerview: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle  =  .none
        
        self.btnSeeAll.roundButton()
//        let layout = UICollectionViewFlowLayout()
//               layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
//               //layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
//               layout.minimumInteritemSpacing = 10
//               layout.minimumLineSpacing = 10
//               cropClView!.collectionViewLayout = layout
        
            self.cropClView.dataSource = self
            self.cropClView.delegate = self
            self.cropClView.register(UINib.init(nibName: "CropsCLView", bundle: nil), forCellWithReuseIdentifier: "CropsCLView")
        setSlider()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setSlider(){
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 40)
//        layout.itemSize = CGSize(width:self.cropClView.frame.width, height: self.cropClView.frame.height)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal
//        self.cropClView!.collectionViewLayout = layout
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func scrollAutomatically(_ timer: Timer) {
        
        if let coll  = self.cropClView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < 3 - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }

    
    
}

extension CropsCell : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = collectionView.frame.height
    let width = UIScreen.main.bounds.width
    let size = CGSize(width: width - 40 , height: height)
    return size
}
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     self.pagerview.numberOfPages = 4
       return 4
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "CropsCLView", for: indexPath) as? CropsCLView
    return cell!
   }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pagerview.currentPage = indexPath.row
    }
}

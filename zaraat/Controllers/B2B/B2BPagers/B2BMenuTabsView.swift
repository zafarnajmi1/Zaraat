//
//  MenuTabsView.swift
//  MyPagerCollView
//
//  Created by Leela Prasad on 09/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

protocol B2BMenuBarDelegate {
    func menuBarDidSelectItemAt(menu: B2BMenuTabsView,index: Int)
}


class B2BMenuTabsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
   lazy var collView: UICollectionView = {
    
        let layOut = UICollectionViewFlowLayout()
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layOut)
        cv.showsHorizontalScrollIndicator = false
        layOut.scrollDirection = .horizontal
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    
    var isSizeToFitCellsNeeded: Bool = false {
        didSet{
            self.collView.reloadData()
        }
    }

    var dataArray: [String] = [] {
        didSet{
            self.collView.reloadData()
        }
    }
    
    
    var menuDidSelected: ((_ collectionView: UICollectionView, _ indexPath: IndexPath)->())?

    var menuDelegate: B2BMenuBarDelegate?
    var cellId = "B2BBasicCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customIntializer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        customIntializer()
    }
    
    
    private func customIntializer () {
        
        collView.register(B2BBasicCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collView)
        addConstraintsWithFormatString(formate: "V:|[v0]|", views: collView)
        addConstraintsWithFormatString(formate: "H:|[v0]|", views: collView)
        backgroundColor = .clear
        
    }
    
    
    //MARK: CollectionView Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? B2BBasicCell {
            cell.titleLabel.text = dataArray[indexPath.item]
            //cell.titleLabel.textColor =  #colorLiteral(red: 0.9921568627, green: 0.7299582362, blue: 0.007647278253, alpha: 1)
            cell.titleLabel.font = UIFont.init(name: "Poppins-Regular", size: 15)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if isSizeToFitCellsNeeded {
            
            let sizeee = CGSize.init(width: self.frame.width, height: self.frame.height)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            
            let str = dataArray[indexPath.item]
            
            let estimatedRect = NSString.init(string: str).boundingRect(with: sizeee, options: options, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)], context: nil)
        
            return CGSize.init(width: estimatedRect.size.width, height: self.frame.height)

        }
        
        return CGSize.init(width: (self.frame.width - 20)/CGFloat(dataArray.count), height: self.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       // menuDidSelected?(collectionView,indexPath)
        
        let index = Int(indexPath.item)
        menuDelegate?.menuBarDidSelectItemAt(menu: self, index: index)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

}

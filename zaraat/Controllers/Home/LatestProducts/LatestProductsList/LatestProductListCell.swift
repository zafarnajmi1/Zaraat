//
//  LatestProductListCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class LatestProductListCell: UITableViewCell {
@IBOutlet weak var LatestProductListClView: UICollectionView!
   
    
    @IBOutlet weak var mainView: UIView!
    
    //@IBOutlet weak var sideImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
//        sideImage.image = UIImage.init(named: "Pesticides Main Image")
//        sideImage.roundCornersImage([.topLeft, .bottomLeft], radius: 20)
        mainView.layer.borderWidth = 0.5
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.clipsToBounds = true
         mainView.layer.cornerRadius = 20
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.mainView.frame
        rectShape.position = self.mainView.center
        rectShape.path = UIBezierPath(roundedRect: self.mainView.bounds, byRoundingCorners: [ .bottomRight , .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath

         //self.mainView.layer.backgroundColor = UIColor.green.cgColor
        //Here I'm masking the textView's layer with rectShape layer
         self.mainView.layer.mask = rectShape
        
        //mainView.roundCorners([.topRight, .bottomRight], radius: 20)
        self.LatestProductListClView.dataSource = self
        self.LatestProductListClView.delegate = self
        self.LatestProductListClView.register(UINib.init(nibName: "latestProductListCLView", bundle: nil), forCellWithReuseIdentifier: "latestProductListCLView")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
}
extension LatestProductListCell : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
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
        let  cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "latestProductListCLView", for: indexPath) as? latestProductListCLView
        return cell!
    }
    

    
}

//
//  ShopeByCategoriesClViewCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ShopeByCategoriesClViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: ShadowView!
       @IBOutlet weak var lblbrand: UILabel!
       override func awakeFromNib() {
           super.awakeFromNib()
           mainView.layer.cornerRadius =  10
           
           contentView.layoutIfNeeded()
       }
}

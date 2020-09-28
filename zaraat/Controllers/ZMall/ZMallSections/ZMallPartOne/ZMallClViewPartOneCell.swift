//
//  ZMallClViewPartOneCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/25/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZMallClViewPartOneCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: ShadowView!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 8
        self.mainView.layer.cornerRadius = 8
    }
    
   
}

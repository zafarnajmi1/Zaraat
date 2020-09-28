//
//  ZMallClViewStoreForyouCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/25/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZMallClViewStoreForyouCell: UICollectionViewCell {
    @IBOutlet weak var mainView: ShadowView!
    @IBOutlet weak var lblbrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius =  10
        
        contentView.layoutIfNeeded()
    }
}

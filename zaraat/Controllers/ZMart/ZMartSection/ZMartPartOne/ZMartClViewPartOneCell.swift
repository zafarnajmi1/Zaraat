//
//  ZMartClViewPartOneCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ZMartClViewPartOneCell: UICollectionViewCell {
    
    @IBOutlet weak var sellerimg: UIImageView!
           @IBOutlet weak var pkgimg: UIImageView!
    @IBOutlet weak var mainView: ShadowView!
       @IBOutlet weak var img: UIImageView!
       
    @IBOutlet weak var lblstock: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbltitl: UILabel!
    override func awakeFromNib() {
           super.awakeFromNib()
           img.layer.cornerRadius = 8
           self.mainView.layer.cornerRadius = 8
       }
       
}

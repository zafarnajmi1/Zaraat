//
//  FeaueredBidingCLView.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FeaueredBidingCLView: UICollectionViewCell {

    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var mintView: UIView!
    @IBOutlet weak var hourView: UIView!
    @IBOutlet weak var img: UIImageView!
       @IBOutlet weak var lbltitle: UILabel!
       override func awakeFromNib() {
           super.awakeFromNib()
           img.setroundCorner(corner: 8)
        secondView.setroundCornerView(corner:8)
        mintView.setroundCornerView(corner:8)
        hourView.setroundCornerView(corner:8)
       }

       
}

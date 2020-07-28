//
//  HotBidingCLView.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HotBidingCLView: UICollectionViewCell {

    @IBOutlet weak var sView: UIView!
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var hView: UIView!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        sView.setroundCornerViewTimer(corner: 5)
        hView.setroundCornerViewTimer(corner: 5)
        mView.setroundCornerViewTimer(corner: 5)
    }

}

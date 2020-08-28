//
//  topRatedClView.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class topRatedClView: UICollectionViewCell {

    @IBOutlet weak var lblPkr: UILabel!
    @IBOutlet weak var subViewImage: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        subViewImage.setroundCornerView(corner: 8)
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR 4200")
               attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
               lblPkr.attributedText =  attributeString
    }

}

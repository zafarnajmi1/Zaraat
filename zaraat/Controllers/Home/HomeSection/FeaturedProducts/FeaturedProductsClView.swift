//
//  FeaturedProductsClView.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/31/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FeaturedProductsClView: UICollectionViewCell {

    @IBOutlet weak var lblPkr: UILabel!
    @IBOutlet weak var lbldiscountPKr: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var subView: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        subView.setroundCornerView(corner: 8)
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR 4200")
                      attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
                      lbldiscountPKr.attributedText =  attributeString
    }

}

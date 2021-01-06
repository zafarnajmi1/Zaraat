//
//  FeaturedProductsClView.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/31/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import Cosmos
class FeaturedProductsClView: UICollectionViewCell {

    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lblPkr: UILabel!
    @IBOutlet weak var lbldiscountPKr: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var subView: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        subView.setroundCornerView(corner: 8)
        img.layer.cornerRadius = 8
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR 4200")
                      attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
                      lbldiscountPKr.attributedText =  attributeString
    }
    
    func loadData(obj:Featured_products){
        self.lbltitle.text =  obj.product_title_en
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR  : \(obj.vendor_price ?? "")")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        lbldiscountPKr.attributedText =  attributeString
        self.img.sd_setImage(with: URL(string: obj.featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
        self.lblPkr.text = "PKR :" + obj.selling_price!
    }

}

//
//  topRatedClView.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import Cosmos
import  SDWebImage
class topRatedClView: UICollectionViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblPkr: UILabel!
    @IBOutlet weak var subViewImage: ShadowView!
    override func awakeFromNib() {
        super.awakeFromNib()
        subViewImage.setroundCornerView(corner: 8)
        
    }
    
    func LoadData(obj:Top_products) {
        print("ia m top")
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR :  \(obj.vendor_price ?? "")")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        lblPkr.attributedText =  attributeString
        
        self.lblPrice.text =  obj.selling_price
        self.lbltitle.text =  obj.product_title_en
        self.img.sd_setImage(with: URL(string: obj.featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
    }

}

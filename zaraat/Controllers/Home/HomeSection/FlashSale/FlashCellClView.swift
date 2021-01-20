//
//  FlashCellClView.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class FlashCellClView: UICollectionViewCell {

    @IBOutlet weak var lblpkr: UILabel!
    @IBOutlet weak var subViewimg: ShadowView!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbltitle: UILabel!
    var sales : Sales?
   
    
    @IBOutlet weak var lblprice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subViewimg.setroundCornerView(corner: 8)
        self.img.layer.cornerRadius = 8
        
        
        
    }
    
    func LoadData(obj:Sales) {
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR :" + obj.actual_price!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        lblpkr.attributedText =  attributeString
       
       self.lblprice.text =  "PKR :" + obj.sale_price!
        self.lbltitle.text = obj.product?.product_title_en
        self.img.sd_setImage(with: URL(string: obj.product?.featured_image ?? ""))
    }

}

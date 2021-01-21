//
//  ProductListCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import Cosmos
class ProductListCell: UITableViewCell {
    @IBOutlet weak var fvrtImg: UIImageView!
     
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lblprice: UILabel!
     @IBOutlet weak var lbldiscountPrice: UILabel!
     @IBOutlet weak var lbltitle: UILabel!
     @IBOutlet weak var mainView: UIView!
     @IBOutlet weak var fvrtView: UIView!
     @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        mainView.layer.cornerRadius = 8
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor =  #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
        
        img.layer.cornerRadius = 8
        
//        fvrtView.layer.borderWidth = 1
//        fvrtView.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
//        fvrtView.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(obj:Products) {
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR :" + obj.vendor_price! )
                      attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
                      
        lbldiscountPrice.attributedText = attributeString
        
        
        self.lblprice.text =  obj.selling_price
        self.lbltitle.text =  obj.product_title_en
        
        self.img.sd_setImage(with: URL(string: obj.featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
        self.rating.rating = obj.avg_rating ?? 0
    }
    
    func loadWishListData(obj:Wishlist) {
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: obj.product?.vendor_price ?? "")
                      attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
                      
        lbldiscountPrice.attributedText = attributeString
        
        
        self.lblprice.text =  "PKR :" + (obj.product?.selling_price)!
        self.lbltitle.text =  obj.product?.product_title_en
        
        self.img.sd_setImage(with: URL(string: obj.product?.featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
    }
    
    
    
}

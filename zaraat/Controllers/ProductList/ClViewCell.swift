//
//  ClViewCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import Cosmos
class ClViewCell: UICollectionViewCell {

    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbldiscountPrice: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var heartImg: UIImageView!
    @IBOutlet weak var likeview: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
               mainView.layer.borderWidth = 1
               mainView.layer.borderColor =  #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
               
               img.layer.cornerRadius = 8
               
//               likeview.layer.borderWidth = 1
//               likeview.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
//               likeview.layer.cornerRadius = 5
               
    }
    
    func loadData(obj:Products) {
           
           let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR :" + obj.vendor_price!)
                         attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
                         
           lbldiscountPrice.attributedText = attributeString
           
           
        self.lblprice.text =  "PKR :" + obj.selling_price!
           self.lbltitle.text =  obj.product_title_en
           
           self.img.sd_setImage(with: URL(string: obj.featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
       }
    
}

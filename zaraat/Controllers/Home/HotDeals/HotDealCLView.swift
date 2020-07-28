//
//  HotDealCLView.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HotDealCLView: UICollectionViewCell {
 let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR 4200")
    @IBOutlet weak var OldValue: UILabel!
    
    @IBOutlet weak var btnAddtoCart: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnAddtoCart.roundButton()
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        OldValue.attributedText = attributeString
    }

}

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
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subViewimg.setroundCornerView(corner: 8)
        
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "PKR 4200")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        lblpkr.attributedText =  attributeString
        
    }

}

//
//  latestProductListCLView.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class latestProductListCLView: UICollectionViewCell {

    @IBOutlet weak var yearView: UIView!
    @IBOutlet weak var btnadcart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        yearView.layer.cornerRadius = 5
        yearView.layer.borderWidth = 1
        yearView.layer.borderColor = #colorLiteral(red: 0.9332197309, green: 0.9333186746, blue: 0.9373039603, alpha: 1)
        
        btnadcart.roundButton()
    }

}

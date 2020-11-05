//
//  BrandCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class BrandCell: UICollectionViewCell {
    
    @IBOutlet weak var brandSelectedView: UIView!
    
    @IBOutlet weak var lblbrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        brandSelectedView.layer.cornerRadius = 8
        brandSelectedView.layer.borderWidth = 1
               brandSelectedView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    func toggleSelected ()
    {
     if (isSelected){
       brandSelectedView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else {
         brandSelectedView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

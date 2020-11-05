//
//  SizeCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SizeCell: UICollectionViewCell {
    @IBOutlet weak var selectedView: UIView!
    
    @IBOutlet weak var lblsize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedView.layer.cornerRadius = 8
        selectedView.layer.borderWidth = 1
        selectedView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    func toggleSelected ()
    {
     if (isSelected){
       selectedView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else {
         selectedView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

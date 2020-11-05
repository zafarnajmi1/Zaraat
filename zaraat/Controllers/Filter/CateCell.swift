//
//  CateCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CateCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCate: UILabel!
    @IBOutlet weak var cateSelectedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cateSelectedView.layer.cornerRadius = 8
        cateSelectedView.layer.borderWidth = 1
        cateSelectedView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func toggleSelected ()
    {
     if (isSelected){
         cateSelectedView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         }else {
          cateSelectedView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         }
    }
}

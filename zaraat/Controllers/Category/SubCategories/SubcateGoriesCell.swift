//
//  SubcateGoriesCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SubcateGoriesCell: UICollectionViewCell {
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.borderWidth =  0.5
                       img.layer.borderColor =  #colorLiteral(red: 0.5802220702, green: 0.5843672752, blue: 0.5842876434, alpha: 1)
                       img.layer.cornerRadius = 5
    }

}

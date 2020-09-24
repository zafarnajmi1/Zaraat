//
//  ClViewTwoCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ClViewTwoCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
       override func awakeFromNib() {
           super.awakeFromNib()
           self.img.layer.cornerRadius = 8
           
       }
}

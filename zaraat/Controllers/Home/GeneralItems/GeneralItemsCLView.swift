//
//  GeneralItemsCLView.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class GeneralItemsCLView: UICollectionViewCell {

     @IBOutlet weak var img: UIImageView!
       @IBOutlet weak var lbltitle: UILabel!
       override func awakeFromNib() {
           super.awakeFromNib()
           img.setroundCorner(corner: 8)
       }


}

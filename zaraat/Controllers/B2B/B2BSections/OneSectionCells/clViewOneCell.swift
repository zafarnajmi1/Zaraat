//
//  clViewOneCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class clViewOneCell: UICollectionViewCell {
       @IBOutlet weak var sellerimg: UIImageView!
              @IBOutlet weak var pkgimg: UIImageView!
              @IBOutlet weak var lblstock: UILabel!
              @IBOutlet weak var lblprice: UILabel!
              @IBOutlet weak var lbltitl: UILabel!
              @IBOutlet weak var img: UIImageView!
              @IBOutlet weak var mainView: UIView!


                override func awakeFromNib() {
                    super.awakeFromNib()
                    mainView.layer.cornerRadius = 8
                     img.layer.cornerRadius = 8
              //            mainView.layer.borderColor =  #colorLiteral(red: 0.8706767559, green: 0.8626209497, blue: 0.8707129359, alpha: 1)
              //            mainView.layer.borderWidth = 1
                }

    }
       

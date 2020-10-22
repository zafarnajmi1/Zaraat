//
//  HomeButtonsClViewStoreForYouCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeButtonsClViewStoreForYouCell: UICollectionViewCell {
    
    @IBOutlet weak var lbltitle: UILabel!
           @IBOutlet weak var mainView: UIView!
           override func awakeFromNib() {
               super.awakeFromNib()
               mainView.layer.cornerRadius = 8
               mainView.layer.borderColor =  #colorLiteral(red: 0.8705882353, green: 0.862745098, blue: 0.8705882353, alpha: 1)
               mainView.layer.borderWidth = 1
           }

       }

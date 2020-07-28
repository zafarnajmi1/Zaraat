//
//  VideosCLView.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class VideosCLView: UICollectionViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var heartView: UIView!
     @IBOutlet weak var yearView: UIView!
     @IBOutlet weak var btnadcart: UIButton!
     
    override func awakeFromNib() {
         super.awakeFromNib()
         yearView.layer.cornerRadius = 5
         yearView.layer.borderWidth = 1
         yearView.layer.borderColor = #colorLiteral(red: 0.9332197309, green: 0.9333186746, blue: 0.9373039603, alpha: 1)
         
         heartView.layer.cornerRadius =  8
         btnadcart.roundButton()
        
        videoView.layer.cornerRadius =  8
        videoView.layer.borderWidth = 0.5
        videoView.layer.borderColor = #colorLiteral(red: 0.1410522163, green: 0.3398962617, blue: 0.1778770983, alpha: 1)
     }
    func setupCell() {
        contentView.setNeedsLayout()
    }
}

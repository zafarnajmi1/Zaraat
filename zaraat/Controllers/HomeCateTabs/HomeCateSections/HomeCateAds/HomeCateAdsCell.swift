//
//  HomeCateAdsCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeCateAdsCell: UITableViewCell {

     @IBOutlet weak var img: UIImageView!
              override func awakeFromNib() {
                  super.awakeFromNib()
                  selectionStyle = .none
                  self.img.layer.cornerRadius = 8
              }
              
              override func setSelected(_ selected: Bool, animated: Bool) {
                  super.setSelected(selected, animated: animated)

                  // Configure the view for the selected state
              }



          }

//
//  ReceiverImageCell.swift
//  CarInsurance
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ReceiverImageCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        contentView.transform = CGAffineTransform (scaleX: 1,y: -1);
    }
    
    
    

}

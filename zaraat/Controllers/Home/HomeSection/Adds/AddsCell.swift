//
//  AddsCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/31/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class AddsCell: UITableViewCell {

    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        img1.setroundCorner(corner: 8)
        img2.setroundCorner(corner: 8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}

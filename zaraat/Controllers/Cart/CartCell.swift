//
//  CartCell.swift
//  zaraat
//
//  Created by Zafar Najmi on 06/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

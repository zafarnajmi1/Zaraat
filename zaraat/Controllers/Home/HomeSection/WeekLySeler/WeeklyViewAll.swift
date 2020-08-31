//
//  WeeklyViewAll.swift
//  zaraat
//
//  Created by ZafarNajmi on 8/31/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class WeeklyViewAll: UITableViewCell {

    @IBOutlet weak var btnViewAll: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        btnViewAll.roundButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

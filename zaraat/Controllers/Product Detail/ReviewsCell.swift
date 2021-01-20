//
//  ReviewsCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 1/7/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class ReviewsCell: UITableViewCell {

    @IBOutlet weak var lblReviews: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

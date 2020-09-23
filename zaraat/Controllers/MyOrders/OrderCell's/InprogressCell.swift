//
//  InprogressCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/16/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class InprogressCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblorderNo: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        mainView.layer.cornerRadius = 8
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor =  #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
        
        
        
        img.layer.borderWidth = 1
        img.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
        img.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

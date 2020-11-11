//
//  MyinquiresCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class MyinquiresCell: UITableViewCell {
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblto: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        mainView.layer.cornerRadius = 8
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor =  #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

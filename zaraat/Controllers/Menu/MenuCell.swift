//
//  MenuCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/1/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  AnimatableReload
class MenuCell: UITableViewCell {
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor =  #colorLiteral(red: 0.7645047307, green: 0.7686187625, blue: 0.772662282, alpha: 1)
       
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

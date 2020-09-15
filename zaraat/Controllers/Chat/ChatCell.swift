//
//  ChatCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var userimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        userimg.roundImg()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

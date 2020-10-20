//
//  SubcateGoriesCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SubcateGoriesCell: UICollectionViewCell {
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.roundView()
    }

}

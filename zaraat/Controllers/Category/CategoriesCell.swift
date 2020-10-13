//
//  CategoriesCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/3/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var contView: UIView!
    
    @IBOutlet weak var lbltitle: UILabel!
    //@IBOutlet weak var catImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.854808569, green: 0.8549557328, blue: 0.8547992706, alpha: 1)
        contView.layer.cornerRadius =  8 
//        catImg.layer.borderWidth =  0.5
//        catImg.layer.borderColor =  #colorLiteral(red: 0.5802220702, green: 0.5843672752, blue: 0.5842876434, alpha: 1)
//        catImg.layer.cornerRadius = 5
    }

    func loadData(obj:AllCategories) {
        self.lbltitle.text =  obj.category_title_en
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

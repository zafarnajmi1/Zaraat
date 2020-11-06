//
//  ColorCell.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    @IBOutlet weak var tick: UIImageView!
    @IBOutlet weak var ColorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ColorView.layer.cornerRadius = 8
        tick.isHidden = true
    }
    func toggleSelected ()
    {
     if (isSelected){
         tick.isHidden = false
        tick.image =  UIImage.init(named: "checked copy")
        }else {
         tick.isHidden = true
         tick.image =  UIImage.init(named: "")
        }
    }
    
    func loadData(obj:Colors) {
        
        let color2 = UIColor(hex: obj.attribute_values!)
        ColorView.backgroundColor =  color2
    }
}
extension UIColor {

  convenience init(hex: String, alpha: CGFloat = 1.0) {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) { cString.removeFirst() }

    if ((cString.count) != 6) {
      self.init(hex: "ff0000") // return red color for wrong hex input
      return
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}

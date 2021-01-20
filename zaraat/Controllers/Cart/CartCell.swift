//
//  CartCell.swift
//  zaraat
//
//  Created by Zafar Najmi on 06/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  GMStepper
import  SDWebImage
protocol ItemDelete {
    func deleteProduct(cell:CartCell)
    
}

protocol Additems {
    func additem(cell:CartCell)
}
class CartCell: UITableViewCell {

    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var stper: GMStepper!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblVariations: UILabel!
    var delegate:ItemDelete?
    var addiremDelegate : Additems?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.img.layer.cornerRadius = 8
       stper.addTarget(self, action: #selector(StepperCount), for: UIControl.Event.valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func loadData(obj:Cart) {
        self.lblVariations.text = obj.variations
        self.lblprice.text = obj.product?.selling_price
        self.lbltitle.text =  obj.product?.product_title_en
        self.stper.value = Double(obj.quantity ?? 0)
        self.img.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.img.sd_setImage(with: URL(string: obj.product?.featured_image ?? ""), placeholderImage: UIImage.init(named: "Machinery Product Image 4"))
    }
    
    @IBAction func DeletAction(_ sender: UIButton) {
        self.delegate?.deleteProduct(cell: self)
    }
    
    
    

    @objc func StepperCount(){
    self.addiremDelegate?.additem(cell: self)
    }
//    @IBAction func StepperCount(_ sender: GMStepper) {
//        
//        
//        print("i am stepper", Int(self.stper.value) )
//    }
}

//
//  ProductDetailVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 26/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  Cosmos
class ProductDetailVC: UIViewController {

    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbldetail: UILabel!
    @IBOutlet weak var btnaddtocart: UIButton!
    
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var hertView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        self.title = "Product Detail"
        btnaddtocart.roundButton()
        
        hertView.layer.borderWidth = 1
              hertView.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
              hertView.layer.cornerRadius = 5
        setNavigationBarWhiteColor()
    }
    
    
    

}
extension ProductDetailVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your message here" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)
            
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Write your message here"
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)//UIColor.lightGray
            
        }
    }
    
    
    
    
    
    
}

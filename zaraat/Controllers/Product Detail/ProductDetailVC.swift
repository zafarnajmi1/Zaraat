//
//  ProductDetailVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 26/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {

    @IBOutlet weak var btnSendView: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var msgView: UIView!
    @IBOutlet weak var btnprofile: UIButton!
    @IBOutlet weak var coinView: UIView!
    @IBOutlet weak var btncart: UIButton!
    @IBOutlet weak var qtyView: UIView!
    @IBOutlet weak var hertView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        setUpView()
    }
    
    func setUpView(){
        txtView.delegate = self
               txtView.textColor = UIColor.lightGray
               txtView.text = "Write your message here"
              txtView.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
              
        btncart.roundbuttonRadius1(borderwidth: 1)
        btnprofile.roundButton()
        btnSendView.roundButton()
        qtyView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.8587297797, green: 0.8588775992, blue: 0.8587204218, alpha: 1), borderwidth: 1)
        coinView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1), borderwidth: 1)
        msgView.viewSetUp(radius: 8, color: #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1), borderwidth: 1)
        hertView.layer.cornerRadius = 8
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

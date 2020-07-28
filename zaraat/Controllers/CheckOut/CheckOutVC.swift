//
//  CheckOutVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 08/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CheckOutVC: UIViewController {

    @IBOutlet weak var txtaddress: UITextView!
    @IBOutlet weak var citView: UIView!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var ListpaymentView: UIView!
    @IBOutlet weak var paymentMethdView: UIView!
    @IBOutlet weak var CounteryView: UIView!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var txtView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var bilingView: UIView!
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.register(UINib.init(nibName: "CheckOutCell", bundle: nil), forCellReuseIdentifier: "CheckOutCell")
        addBackButton()
        self.title = "CheckOut"
        setUpCehckout()
    }
    
    
    func setUpCehckout() {
        txtaddress.delegate = self
         txtaddress.textColor = UIColor.lightGray
         txtaddress.text = "Address"
        txtaddress.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        headerView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
        bilingView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
        emailView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1))
        ListpaymentView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
        paymentMethdView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
        CounteryView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1))
        stateView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1))
        
        companyView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1))
        txtView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
       
        phoneView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1))
        
        lastNameView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1))
        firstNameView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1))
        bilingView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
        orderView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1), round: 8)
        citView.roundcornerAndBorder1(border: 1, color: #colorLiteral(red: 0.8116757274, green: 0.8118159175, blue: 0.8116669059, alpha: 1))
        
        
    }

    func sertReviewConfig() {
                   var tableViewHeight:CGFloat = 0;
                         for i in 0..<self.tblView.numberOfRows(inSection: 0){
                             tableViewHeight = tableViewHeight + tableView(self.tblView, heightForRowAt: IndexPath(row: i, section: 0))
                         }
                         tblHeight.constant = tableViewHeight
                         self.tblView.setNeedsDisplay()
               }

}
extension CheckOutVC :  UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CheckOutCell") as? CheckOutCell
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
}
extension CheckOutVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Address" {
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
            textView.text = "Address"
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)//UIColor.lightGray
            
        }
    }
    
    
    
    
    
    
}

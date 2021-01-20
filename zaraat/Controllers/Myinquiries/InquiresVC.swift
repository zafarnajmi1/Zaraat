//
//  InquiresVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 1/12/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class InquiresVC: UIViewController {

    @IBOutlet weak var btnVendorInquires: UIButton!
    @IBOutlet weak var btnmyinquires: UIButton!
    @IBOutlet weak var vendorInquiresView: UIView!
    @IBOutlet weak var myinquiresView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        
        myinquiresView.alpha = 1
        vendorInquiresView.alpha = 0
        btnmyinquires.roundButton()
        btnVendorInquires.roundButton()
        btnVendorInquires.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        btnVendorInquires.layer.borderWidth = 1
        btnVendorInquires.backgroundColor = #colorLiteral(red: 0.9448785186, green: 0.9490216374, blue: 0.9530343413, alpha: 1)
        btnmyinquires.backgroundColor = #colorLiteral(red: 0.9905504584, green: 0.7299582362, blue: 0.007647278253, alpha: 1)
    }
    

    @IBAction func myinquiresAction(_ sender: UIButton) {
        myinquiresView.alpha = 1
        vendorInquiresView.alpha = 0
        
        btnVendorInquires.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        btnVendorInquires.layer.borderWidth = 1
        btnVendorInquires.backgroundColor = #colorLiteral(red: 0.9448785186, green: 0.9490216374, blue: 0.9530343413, alpha: 1)
        btnmyinquires.backgroundColor = #colorLiteral(red: 0.9905504584, green: 0.7299582362, blue: 0.007647278253, alpha: 1)
        btnmyinquires.setTitle("My Inquires", for: .normal)
        btnVendorInquires.setTitle("Vendor Inquires", for: .normal)
        
        btnVendorInquires.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btnmyinquires.setTitleColor(#colorLiteral(red: 0.9448785186, green: 0.9490216374, blue: 0.9530343413, alpha: 1), for: .normal)
    }
    
    @IBAction func vendorInquires(_ sender: UIButton) {
        myinquiresView.alpha = 0
        vendorInquiresView.alpha = 1
        
        btnmyinquires.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        btnmyinquires.layer.borderWidth = 1
        btnmyinquires.backgroundColor = #colorLiteral(red: 0.9448785186, green: 0.9490216374, blue: 0.9530343413, alpha: 1)
        btnmyinquires.setTitle("My Inquires", for: .normal)
        btnVendorInquires.setTitle("Vendor Inquires", for: .normal)
        btnVendorInquires.backgroundColor = #colorLiteral(red: 0.9905504584, green: 0.7299582362, blue: 0.007647278253, alpha: 1)
        btnVendorInquires.setTitleColor(#colorLiteral(red: 0.9448785186, green: 0.9490216374, blue: 0.9530343413, alpha: 1), for: .normal)
         btnmyinquires.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    }
    
}

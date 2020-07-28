//
//  RestPasswordVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 7/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class RestPasswordVC: UIViewController {
    @IBOutlet weak var txtnewpass: UITextField!
    
    @IBOutlet weak var btnchnage: UIButton!
    @IBOutlet weak var txtreenterpass: UITextField!
    @IBOutlet weak var txtoldPass: UITextField!
    @IBOutlet weak var reenterPasswordView: UIView!
    @IBOutlet weak var newpasswordView: UIView!
    @IBOutlet weak var oldPasswordView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnchnage.roundButton()
        self.reenterPasswordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        self.newpasswordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
        self.oldPasswordView.addInnerShadow(topColor: #colorLiteral(red: 0.8939016461, green: 0.8940303922, blue: 0.8938735127, alpha: 1))
    }
    
    @IBAction func chnageAction(_ sender: UIButton) {
        
        
    }
    
    
}

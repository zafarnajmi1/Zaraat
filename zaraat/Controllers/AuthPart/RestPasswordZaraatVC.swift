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
    override func viewDidLoad() {
        super.viewDidLoad()
        btnchnage.roundButton()
        
    }
    
    @IBAction func chnageAction(_ sender: UIButton) {
        
        
    }
    
    
}

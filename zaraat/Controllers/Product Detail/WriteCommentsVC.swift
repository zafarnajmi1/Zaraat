//
//  WriteCommentsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 1/7/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class WriteCommentsVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnsubmit: UIButton!
    @IBOutlet weak var txtcomments: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnsubmit.roundButton()
        txtcomments.layer.cornerRadius = 8
        txtcomments.layer.borderColor =  #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        txtcomments.layer.borderWidth =  1
        
        
        mainView.layer.cornerRadius = 5
        mainView.layer.borderColor =  #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        mainView.layer.borderWidth =  1
    }
    

    @IBAction func DismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

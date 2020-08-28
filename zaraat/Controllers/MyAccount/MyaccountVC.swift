//
//  MyaccountVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 27/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class MyaccountVC: UIViewController {

    @IBOutlet weak var yearsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        yearsView.roundcornerAndBorder(border: 1, color: #colorLiteral(red: 0.803833425, green: 0.8039723635, blue: 0.8038246036, alpha: 1), round: 5)
    }
    

    

}

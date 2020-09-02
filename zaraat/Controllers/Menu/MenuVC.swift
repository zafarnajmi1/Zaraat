//
//  MyaccountVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 27/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var userimg: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userimg.roundImage()
        self.tblView.register(UINib.init(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
    

    

}

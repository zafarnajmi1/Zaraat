//
//  CartVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 06/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var mainViewProceed: UIView!
    @IBOutlet weak var btnProceedToChekcout: UIButton!
    @IBOutlet weak var btnCodeProceed: UIButton!
    @IBOutlet weak var txtCodeView: UIView!
    @IBOutlet weak var mainCodeView: UIView!
    @IBOutlet weak var sbTotalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   addBackButton()
        self.title = "Cart"
        tblView.register(UINib.init(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
        mainCodeView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.8587297797, green: 0.8588775992, blue: 0.8587204218, alpha: 1), borderwidth: 1)
        
        mainViewProceed.viewSetUp(radius: 5, color: #colorLiteral(red: 0.8587297797, green: 0.8588775992, blue: 0.8587204218, alpha: 1), borderwidth: 1)
        txtCodeView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.8587297797, green: 0.8588775992, blue: 0.8587204218, alpha: 1), borderwidth: 1)
        btnCodeProceed.roundButton()
        btnProceedToChekcout.roundButton()
        sbTotalView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.8587297797, green: 0.8588775992, blue: 0.8587204218, alpha: 1), borderwidth: 1)
    }
    

    
    @IBAction func proceedAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "CheckOutVC") as? CheckOutVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "CheckOutVC") as? CheckOutVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    @IBAction func proceedActionWithCode(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "CheckOutVC") as? CheckOutVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "CheckOutVC") as? CheckOutVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}
extension CartVC :  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell
        return cell!
    }
    
    
}

//
//  SellerProfileVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/21/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SellerProfileVC: UIViewController {

    @IBOutlet weak var yearview: UIView!
    @IBOutlet weak var lblGoldDescription: UILabel!
    @IBOutlet weak var lblGoldSupplier: UILabel!
    @IBOutlet weak var lbldiscriptionpaid: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lbloneyear: UILabel!
    @IBOutlet weak var lbloneyeardescription: UILabel!
     var supplierData : ProductDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
         suplieirDataconfig()
        self.yearview.layer.cornerRadius = 8
         self.yearview.layer.borderWidth = 1
         self.yearview.layer.borderColor =  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    func suplieirDataconfig(){
       self.lbltitle.text = supplierData?.vendor?.company_name
        self.lbldiscriptionpaid.text = supplierData?.vendor?.description
        self.lblGoldSupplier.text = (supplierData?.vendor_package?.package_name)! + "  Supplier"
        self.lbloneyear.text = "\(supplierData?.vendor_products ?? 0) " + " Supplier Products"
        self.lblGoldDescription.text = supplierData?.vendor?.description
        self.lbloneyeardescription.text = supplierData?.vendor?.description
    }
    

    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

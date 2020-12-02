//
//  HBLBillingFormVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class HBLBillingFormVC: UIViewController {
    
    
    //Billing Address
    
    
    @IBOutlet weak var txtbillingFirstName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtBillingLastName: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var txtBillingPhone: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtBillingEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtBillingCountry: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtBillingProvince: SkyFloatingLabelTextField!
    
@IBOutlet weak var txtBillingCityName: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var txtBillingAddress: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtBillingPostalCode: SkyFloatingLabelTextField!
    
    
    
    
       //Shipping Address
        
        
        @IBOutlet weak var txtShippingFirstName: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtShippingLastName: SkyFloatingLabelTextField!
        
        
        @IBOutlet weak var txtShippingPhone: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtShippingEmail: SkyFloatingLabelTextField!
        @IBOutlet weak var txtShippingCountry: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtShippingProvince: SkyFloatingLabelTextField!
        
    @IBOutlet weak var txtShippingCityName: SkyFloatingLabelTextField!
        
        
        @IBOutlet weak var txtShippingAddress: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtShippingPostalCode: SkyFloatingLabelTextField!
    
    
    
    @IBOutlet weak var btncontinoue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        setNavigationBarWhiteColor()
        btncontinoue.roundButton()
        self.title  = "HBL Payment Detail"
    }
    

    
    func checkData() -> Bool {
        
        if txtbillingFirstName.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing First Name", messagetype: 0)
            return false
        } else if txtBillingLastName.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Last Name", messagetype: 0)
            return false
        } else if txtBillingPhone.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Phone Number", messagetype: 0)
            return false
        } else if txtBillingEmail.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Email", messagetype: 0)
            return false
        } else if txtBillingCountry.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Country Name", messagetype: 0)
            return false
        } else if txtBillingProvince.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Province Name", messagetype: 0)
            return false
        } else if txtBillingCityName.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing City Name", messagetype: 0)
            return false
        } else if txtBillingAddress.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Address", messagetype: 0)
            return false
        } else if txtBillingPostalCode.text == "" {
            
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Postal Code", messagetype: 0)
            return false
        } else if txtShippingFirstName.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping First Name", messagetype: 0)
                   return false
               } else if txtShippingLastName.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Last Name", messagetype: 0)
                   return false
               } else if txtShippingPhone.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Phone Number", messagetype: 0)
                   return false
               } else if txtShippingEmail.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Billing Email", messagetype: 0)
                   return false
               } else if txtShippingCountry.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Country Name", messagetype: 0)
                   return false
               } else if txtShippingProvince.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Province Name", messagetype: 0)
                   return false
               } else if txtShippingCityName.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping City Name", messagetype: 0)
                   return false
               } else if txtShippingAddress.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Address", messagetype: 0)
                   return false
               } else if txtShippingPostalCode.text == "" {
                   
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Shipping Postal Code", messagetype: 0)
                   return false
               }
        
        
        
        return true
    }

}

//
//  SaveAddressesVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 1/5/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit
import  DropDown
import SkyFloatingLabelTextField
class SaveAddressesVC: UIViewController {

    var BillingdropDown = DropDown()
    var ShippingopDown = DropDown()
    var tcsData : TCSModel?
    var pieces = 0
    var price = 0
    var ProductsName = ""
    var addressdata : BillingShipping!
    var placeorderdata : PlaceOrderModel!
     var cartData : GetCartModel?
    var paymentMethod = ""
    //Billing Address
    @IBOutlet weak var btnShipping: UIButton!
    
    @IBOutlet weak var btnBilling: UIButton!
    var ischeck = true
        @IBOutlet weak var txtbillingFirstName: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtBillingLastName: SkyFloatingLabelTextField!
        
        
        @IBOutlet weak var txtBillingPhone: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtBillingAddressType: SkyFloatingLabelTextField!
        @IBOutlet weak var txtBillingCountry: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtBillingProvince: SkyFloatingLabelTextField!
        
    @IBOutlet weak var txtBillingCityName: SkyFloatingLabelTextField!
        
        
        @IBOutlet weak var txtBillingAddress: SkyFloatingLabelTextField!
        
        @IBOutlet weak var txtBillingPostalCode: SkyFloatingLabelTextField!
        
        
    @IBOutlet weak var btnCheck: UIButton!
    
        
           //Shipping Address
            
            
            @IBOutlet weak var txtShippingFirstName: SkyFloatingLabelTextField!
            
            @IBOutlet weak var txtShippingLastName: SkyFloatingLabelTextField!
            
            
            @IBOutlet weak var txtShippingPhone: SkyFloatingLabelTextField!
            
            @IBOutlet weak var txtShippingAddressType: SkyFloatingLabelTextField!
            @IBOutlet weak var txtShippingCountry: SkyFloatingLabelTextField!
            
            @IBOutlet weak var txtShippingProvince: SkyFloatingLabelTextField!
            
        @IBOutlet weak var txtShippingCityName: SkyFloatingLabelTextField!
            
            
            @IBOutlet weak var txtShippingAddress: SkyFloatingLabelTextField!
            
            @IBOutlet weak var txtShippingPostalCode: SkyFloatingLabelTextField!
        
        
        
        @IBOutlet weak var btncontinoue: UIButton!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.navigationController?.isNavigationBarHidden = false
            addBackButton()
            
            btncontinoue.roundButton()
            self.title  = "Address Detail"
            getAddress()
            btnCheck.setImage(UIImage.init(named: "unchcecked"), for: .normal)
        }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard (self.navigationController?.isNavigationBarHidden) != nil else {
            return
        }
        self.navigationController?.isNavigationBarHidden =  false
    }

    
    func getAddress() {
        ShareData.showProgress()
        userhandler.getAddress(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.addressdata = response
                self.txtbillingFirstName.text = response.billing?.billing_person_name
                    
                self.txtBillingLastName.text = response.billing?.billing_person_name
                    
                    
                self.txtBillingPhone.text = response.billing?.billing_phone
                    
                self.txtBillingAddressType.text! = response.billing?.address_type ?? ""
                self.txtBillingCountry.text = response.billing?.billing_city
                    
                self.txtBillingProvince.text = response.billing?.billing_state ?? ""
                    
                self.txtBillingCityName.text = response.billing?.billing_city ?? ""
                    
                self.txtBillingAddress.text =  response.billing?.billing_address ?? ""
                    
                self.txtBillingPostalCode.text =  response.billing?.billing_zipcode ?? ""
                    
        
                       //Shipping Address
                        
                        
                self.txtShippingFirstName.text =  response.shipping?.shipping_person_name ?? ""
                        
                self.txtShippingLastName.text = response.shipping?.shipping_person_name ?? ""
                        
                self.txtShippingPhone.text = response.shipping?.shipping_phone ?? ""
                        
                self.txtShippingAddressType.text = response.shipping?.address_type ?? ""
                self.txtShippingCountry.text = response.shipping?.shipping_country ?? ""
                        
                self.txtShippingProvince.text = response.shipping?.shipping_state ?? ""
                        
                self.txtShippingCityName.text = response.shipping?.shipping_city ?? ""
                        
                self.txtShippingAddress.text = response.shipping?.shipping_address ?? ""
                        
                self.txtShippingPostalCode.text = response.shipping?.shipping_zipcode ?? ""
                
                
                
                
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
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
            } else if txtBillingAddressType.text == "" {
                
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
                   } else if txtShippingAddressType.text == "" {
                       
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

    
    @IBAction func billingAddresstypeAction(_ sender: UIButton) {
        
        BillingdropDown.anchorView = btnBilling
                            BillingdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                            BillingdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                          var statustArray = [String]()
                    statustArray = ["Home","Office"]
                    BillingdropDown.dataSource = statustArray

                            BillingdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                                print(index)
                                self.txtBillingAddressType.text = item
                               
           

                            }

                            BillingdropDown.show()

        
        
    }
    
    
    
    
    
    @IBAction func shippingAddresstypeaction(_ sender: UIButton) {
        
        
        
        
        ShippingopDown.anchorView = btnShipping
                         ShippingopDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                         ShippingopDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                       var statustArray = [String]()
                 statustArray = ["Home","Office"]
                 ShippingopDown.dataSource = statustArray

                         ShippingopDown.selectionAction = { [unowned self] (index: Int, item: String) in
                             print(index)
                             self.txtShippingAddressType.text = item
                            
        

                         }

                         ShippingopDown.show()
        
    }
    
    @IBAction func continoueAction(_ sender: UIButton) {
        if checkData() {
            saveAddress()
           
           
        }
    }
    
    
    
    func saveAddress() {
        ShareData.showProgress()
        let dic : [String:Any] =  ["shipping_address":self.txtShippingAddress.text!, "shipping_person_name":self.txtShippingFirstName.text!, "shipping_phone": self.txtShippingPhone.text!, "shipping_country":txtShippingCountry.text!, "shipping_state":self.txtShippingProvince.text!, "shipping_city":self.txtShippingCityName.text!, "shipping_zipcode":self.txtShippingPostalCode.text!, "shipping_address_type":self.txtShippingAddressType.text!,"billing_address": self.txtBillingAddress.text!, "billing_person_name": self.txtbillingFirstName.text!, "billing_phone": self.txtBillingPhone.text!, "billing_country":self.txtBillingCountry.text!, "billing_state":self.txtBillingProvince.text!, "billing_city":self.txtBillingCityName.text!, "billing_zipcode": self.txtBillingPostalCode.text!, "billing_address_type":self.txtBillingAddressType.text!]
        userhandler.StoreAddress(parms: dic, Success: {response in
             ShareData.hideProgress()
            if response.success == 1 {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 1)
                ShareData.shareInfo.saveBillingShipping(add: response)
                
                self.navigationController?.popViewController(animated: true)
                
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
       
       
      
       
//       override func viewWillDisappear(_ animated: Bool) {
//           super.viewWillDisappear(animated)
//           self.navigationController?.isNavigationBarHidden = true
//       }
       
       func movetoHome(){
           if UIDevice.current.userInterfaceIdiom == .pad {

                   let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                   let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                   self.navigationController?.pushViewController(vc!, animated: true)

           } else {

                   let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                   let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                    
                   self.navigationController?.pushViewController(vc!, animated: true)
           }
       }
       
       
       
       
       
       
       
       
       
       @IBAction func checkBoxAction(_ sender: UIButton) {
             
             if ischeck == true {
                 btnCheck.setImage(UIImage.init(named: "Checked-1"), for: .normal)
               
               self.txtShippingAddressType.text =  txtBillingAddressType.text
               self.txtShippingPhone.text =  txtBillingPhone.text
               self.txtShippingAddress.text =  txtBillingAddress.text
               self.txtShippingCountry.text =  txtBillingCountry.text
               self.txtShippingCityName.text =  txtBillingCityName.text
               self.txtShippingLastName.text =  txtBillingLastName.text
               self.txtShippingFirstName.text =  txtbillingFirstName.text
               self.txtShippingProvince.text =  txtBillingProvince.text
                self.txtShippingPostalCode.text =  txtBillingPostalCode.text
               
               
               
             } else {
                 btnCheck.setImage(UIImage.init(named: "unchcecked"), for: .normal)
               
               self.txtShippingAddressType.text =  ""
                          self.txtShippingPhone.text =  ""
                          self.txtShippingAddress.text =  ""
                          self.txtShippingCountry.text =  ""
                          self.txtShippingCityName.text =  ""
                          self.txtShippingLastName.text =  ""
                          self.txtShippingFirstName.text =  ""
                          self.txtShippingProvince.text =  ""
                           self.txtShippingPostalCode.text =  ""
               
             }
             
             
              ischeck = !ischeck
             
         }
       
       
}

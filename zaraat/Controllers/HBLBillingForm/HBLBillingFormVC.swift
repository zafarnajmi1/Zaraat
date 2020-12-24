//
//  HBLBillingFormVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import  InAppSDK
import  PassKit

let merchantIdentifier = "merchant.cybersource.net.test.dev"
class HBLBillingFormVC: UIViewController,PKPaymentAuthorizationViewControllerDelegate , InAppSDKGatewayDelegate{
    
    @objc let SupportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex]

    
   func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
        print("paymentAuthorizationViewControllerDidFinish called")
    }

    
    //Billing Address
    var ischeck = true
     var cartData : GetCartModel?
    @IBOutlet weak var txtbillingFirstName: SkyFloatingLabelTextField!
    
    @IBOutlet weak var txtBillingLastName: SkyFloatingLabelTextField!
     @IBOutlet weak var btnCheck: UIButton!
    
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

    
    
    @IBAction func CheckAction(_ sender: UIButton) {
        
        if ischeck == true {
                     btnCheck.setImage(UIImage.init(named: "Checked-1"), for: .normal)
                   
                   self.txtShippingEmail.text =  txtBillingEmail.text
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
                   
                   self.txtShippingEmail.text =  ""
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
    
    
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: (@escaping (PKPaymentAuthorizationStatus) -> Void)) {
           print("paymentAuthorizationViewController delegates called")

           if payment.token.paymentData.count > 0 {
               //base64 encode the Apple Pay encrypted payment data for submission to Cybersource
               let paymentData = String(data: payment.token.paymentData.base64EncodedData(), encoding: .utf8)
               if let applePayBlob = paymentData {
                   let message = String(format: "\nApple Pay Token: \n%@", applePayBlob)
                   print("\n%@", message)
                   let alert = UIAlertController(title: "Authorization Success", message: message, preferredStyle: .alert)
                   //self.updateTextViewWithMessage(message: applePayBlob)
                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                   return self.performApplePayCompletion(controller, alert: alert)
               } else {
                   let alert = UIAlertController(title: "ApplePay payment data error!", message: nil, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                   return self.performApplePayCompletion(controller, alert: alert)
               }
           } else {
               let alert = UIAlertController(title: "Authorization Failed!", message: nil, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               return self.performApplePayCompletion(controller, alert: alert)
           }
       }
       
       @objc func performApplePayCompletion(_ controller: PKPaymentAuthorizationViewController, alert: UIAlertController) {
           controller.dismiss(animated: true, completion: {() -> Void in
               self.present(alert, animated: false, completion: nil)
           })
       }
    
    
    
    
    @IBAction func continoueAction(_ sender: UIButton) {
        
//        if PKPaymentAuthorizationViewController.canMakePayments() == false {
//                   let alert = UIAlertController(title: "Apple Pay is not available", message: nil, preferredStyle: .alert)
//                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                   return self.present(alert, animated: true, completion: nil)
//               }
//
//               if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: SupportedPaymentNetworks) == false {
//                   let alert = UIAlertController(title: "No Apple Pay payment methods available", message: nil, preferredStyle: .alert)
//                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                   return self.present(alert, animated: true, completion: nil)
//               }
//
//               let request = PKPaymentRequest()
//               request.currencyCode = "USD"
//               request.countryCode = "US"
//               request.merchantIdentifier = merchantIdentifier
//               request.supportedNetworks = SupportedPaymentNetworks
//               // DO NOT INCLUDE PKMerchantCapability.capabilityEMV
//               request.merchantCapabilities = PKMerchantCapability.capability3DS
//
//               let amt =  25.00
//               request.paymentSummaryItems = [
//                   PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(value: amt))
//               ]
//
//               let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
//               applePayController?.delegate = self
//
//               self.present(applePayController!, animated: true, completion: nil)
//
        
        
        let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(identifier: "InAppSDKDemoViewController") as? InAppSDKDemoViewController  ///CyberSourceVC//InAppSDKDemoViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    
    
    
    
}

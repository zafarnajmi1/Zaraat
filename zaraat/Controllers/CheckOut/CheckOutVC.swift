//
//  CheckOutVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 08/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SkyFloatingLabelTextField
import  GooglePlaces
import  GooglePlacePicker
class CheckOutVC: UIViewController {
    @IBOutlet weak var btnPlaceOrder: UIButton!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var lblpayment: UILabel!
     var cartData : GetCartModel?
    var istype = 0
    var payment = 0
//    @IBOutlet weak var btnshipping: UIButton!
//    @IBOutlet weak var txtBilingemail: SkyFloatingLabelTextField!
//    @IBOutlet weak var txtBillingname: SkyFloatingLabelTextField!
//
//    @IBOutlet weak var txtbillingPhonenumber: SkyFloatingLabelTextField!
//
//
//    @IBOutlet weak var txtBilllingAddress: SkyFloatingLabelTextField!
//
//
//
//    /////
//    @IBOutlet weak var txtShippingemail: SkyFloatingLabelTextField!
//    @IBOutlet weak var txtShippingname: SkyFloatingLabelTextField!
//
//    @IBOutlet weak var txtShippingPhonenumber: SkyFloatingLabelTextField!
//
//
//    @IBOutlet weak var txtShippingAddress: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var btnVisaRadio: UIButton!
    
    @IBOutlet weak var btncashRadio: UIButton!
    
    @IBOutlet weak var btneasyPaisaRadio: UIButton!
    
    @IBOutlet weak var btnjazzCashRadio: UIButton!
    
    @IBOutlet weak var btnHBLRadio: UIButton!
    var addresstype = 0
    var qty = 0
    var productName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        setNavigationBarWhiteColor()
        self.title = "Check Out"
        btnPlaceOrder.roundButton()
        priceView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.937254902, alpha: 1)
       priceView.layer.borderWidth = 1
        priceView.layer.cornerRadius = 8
        
        self.lblpayment.text = "\(payment)" + " PKR"
        

         
         
         
         for item in self.cartData?.cart ?? [] {
             
            qty += item.quantity ?? 0
            productName += "," + productName  + (item.product?.product_title_en)!
            print(productName)
         }
        
        
        
        
        
    }
    
    
    
    @IBAction func HBLAction(_ sender: UIButton) {
        
        btnVisaRadio.isSelected = false
         btnVisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
        btncashRadio.isSelected = false
         btncashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btneasyPaisaRadio.isSelected = false
        btneasyPaisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnjazzCashRadio.isSelected = false
          btnjazzCashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnHBLRadio.isSelected = true
        btnHBLRadio.setImage(UIImage.init(named: "fill"), for: .normal)
    }
    
    
    @IBAction func jazzCashAction(_ sender: UIButton) {
        btnVisaRadio.isSelected = false
                btnVisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
               btncashRadio.isSelected = false
                btncashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
                btneasyPaisaRadio.isSelected = false
               btneasyPaisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
                btnjazzCashRadio.isSelected = true
                 btnjazzCashRadio.setImage(UIImage.init(named: "fill"), for: .normal)
                btnHBLRadio.isSelected = false
               btnHBLRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
    }
    
    
    @IBAction func easyPaissaAction(_ sender: UIButton) {
        
        btnVisaRadio.isSelected = false
         btnVisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
        btncashRadio.isSelected = false
         btncashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btneasyPaisaRadio.isSelected = true
        btneasyPaisaRadio.setImage(UIImage.init(named: "fill"), for: .normal)
         btnjazzCashRadio.isSelected = false
          btnjazzCashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnHBLRadio.isSelected = false
        btnHBLRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
    }
    
    @IBAction func cashonDelivery(_ sender: UIButton) {
        
        btnVisaRadio.isSelected = false
         btnVisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
        btncashRadio.isSelected = true
         btncashRadio.setImage(UIImage.init(named: "fill"), for: .normal)
         btneasyPaisaRadio.isSelected = false
        btneasyPaisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnjazzCashRadio.isSelected = false
          btnjazzCashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnHBLRadio.isSelected = false
        btnHBLRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
        
    }
    
    
    @IBAction func VisaCardAction(_ sender: UIButton) {
        
        btnVisaRadio.isSelected = true
         btnVisaRadio.setImage(UIImage.init(named: "fill"), for: .normal)
        btncashRadio.isSelected = false
         btncashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btneasyPaisaRadio.isSelected = false
        btneasyPaisaRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnjazzCashRadio.isSelected = false
          btnjazzCashRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
         btnHBLRadio.isSelected = false
        btnHBLRadio.setImage(UIImage.init(named: "circlRadio"), for: .normal)
    }
    
        
    

    
    @IBAction func PlaceOrderAction(_ sender: UIButton) {
        
        if btnHBLRadio.isSelected == true {
        if UIDevice.current.userInterfaceIdiom == .pad {
                   
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "HBLBillingFormVC") as? HBLBillingFormVC
            vc?.hidesBottomBarWhenPushed = true
            vc?.amount = payment
               self.navigationController?.pushViewController(vc!, animated: true)
               
               } else {
               
               let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
               let vc =  storyBoard.instantiateViewController(withIdentifier: "HBLBillingFormVC") as? HBLBillingFormVC
            vc?.hidesBottomBarWhenPushed = true
            vc?.amount = payment
               self.navigationController?.pushViewController(vc!, animated: true)
               }
        } else if btncashRadio.isSelected == true {
            
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                            
                        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                        let vc =  storyBoard.instantiateViewController(withIdentifier: "TCSBillingVC") as? TCSBillingVC
                        vc?.hidesBottomBarWhenPushed = true
                vc?.price = payment
                vc?.pieces = qty
                vc?.ProductsName = productName
                vc!.cartData =  self.cartData
                vc!.paymentMethod = "COD"
                        self.navigationController?.pushViewController(vc!, animated: true)
                        
                        } else {
                        
                        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                        let vc =  storyBoard.instantiateViewController(withIdentifier: "TCSBillingVC") as? TCSBillingVC
                vc?.hidesBottomBarWhenPushed = true
                 vc?.price = payment
                vc?.pieces = qty
                vc?.ProductsName = productName
                vc!.cartData =  self.cartData
                vc!.paymentMethod = "COD"
                        self.navigationController?.pushViewController(vc!, animated: true)
                        }
            
            
            
            
            
        } else {
            alertMessage(message: "Please Select The Payment Method!", completionHandler: {})
        }
        
    }
    
    
    @IBAction func visaAction(_ sender: UIButton) {
        alertMessage(message: "This Payment Method Is Comming Soon. Please Select Cash On delivery Or HBL", completionHandler: {
            
            
            self.btnVisaRadio.isSelected = false
             
            self.btncashRadio.isSelected = false
             
            self.btneasyPaisaRadio.isSelected = false
            
            self.btnjazzCashRadio.isSelected = false
              
            self.btnHBLRadio.isSelected = false
            
            
            
            
        })
        
    }
    @IBAction func TCSAction(_ sender: UIButton) {
        
        
        
                   
                   self.btnVisaRadio.isSelected = false
                    
                   self.btncashRadio.isSelected = true
                    
                   self.btneasyPaisaRadio.isSelected = false
                   
                   self.btnjazzCashRadio.isSelected = false
                     
                   self.btnHBLRadio.isSelected = false
                   
                   
                   
                   
              
        
        
        
    }
    @IBAction func easyPaisaAction(_ sender: UIButton) {
        alertMessage(message: "This Payment Method Is Comming Soon. Please Select Cash On delivery Or HBL", completionHandler: {
                   
                   
                   self.btnVisaRadio.isSelected = false
                    
                   self.btncashRadio.isSelected = false
                    
                   self.btneasyPaisaRadio.isSelected = false
                   
                   self.btnjazzCashRadio.isSelected = false
                     
                   self.btnHBLRadio.isSelected = false
                   
                   
                   
                   
               })
        
    }
    
    @IBAction func jazzCasAction(_ sender: Any) {
        
        alertMessage(message: "This Payment Method Is Comming Soon. Please Select Cash On delivery Or HBL", completionHandler: {
                   
                   
                   self.btnVisaRadio.isSelected = false
                    
                   self.btncashRadio.isSelected = false
                    
                   self.btneasyPaisaRadio.isSelected = false
                   
                   self.btnjazzCashRadio.isSelected = false
                     
                   self.btnHBLRadio.isSelected = false
                   
                   
                   
                   
               })
        
    }
    
    @IBAction func hblAction(_ sender: UIButton) {
        
         
                   
                   
                   self.btnVisaRadio.isSelected = false
                    
                   self.btncashRadio.isSelected = false
                    
                   self.btneasyPaisaRadio.isSelected = false
                   
                   self.btnjazzCashRadio.isSelected = false
                     
                   self.btnHBLRadio.isSelected = true
                   
                   
                   
                   
               
        
        
    }
    
    
    
    
    

}


    
    
    
    
    
////MARK:- AutoCompleteAddress
//extension CheckOutVC: UITextFieldDelegate {
//
//
//func textFieldDidBeginEditing(_ textField: UITextField) {
//    self.addresstype = 1
//        if textField == self.txtBilllingAddress {
//        let autoComplete = GMSAutocompleteViewController()
//        autoComplete.delegate = self
//        //            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
//        //            UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
//        present(autoComplete, animated: true, completion: nil)
//
//} else if textField == self.txtShippingAddress {
//           self.addresstype = 2
//            let autoComplete = GMSAutocompleteViewController()
//            autoComplete.delegate = self
//            //            UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
//            //            UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1026112512, green: 0.6214135885, blue: 0.06590007991, alpha: 1)
//            present(autoComplete, animated: true, completion: nil)
//}
//        let placePickerController = GMSAutocompleteViewController()
//        placePickerController.delegate = self
//        self.present(placePickerController, animated: true) {
//        }
////        let config = GMSPlacePickerConfig(viewport: nil)
////        let placePicker = GMSPlacePickerViewController(config: config)
////        placePicker.delegate = self
////        present(placePicker, animated: true, completion: nil)
//}
//}
/////GMSAutocompleteViewControllerDelegate
//extension CheckOutVC: GMSAutocompleteViewControllerDelegate {
//
//
//
//
////    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
////        print(place.coordinate.latitude)
////        print(place.coordinate.longitude)
//////        self.my_lat = place.coordinate.latitude
//////        self.my_long = place.coordinate.longitude
//////        print(place.formattedAddress!)
////
////        if(place.formattedAddress == "" || place.formattedAddress == nil){
////            self.txtaddress.text = "Unknown place Cordinates Selected  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
////        }else{
////            self.txtaddress?.text = place.formattedAddress!
////        }
////
////        dismiss(animated: true, completion: nil)
////    }
//
//
//func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//
//                print(place.coordinate.latitude)
//                print(place.coordinate.longitude)
//
//
//                //        self.my_lat = place.coordinate.latitude
//                //        self.my_long = place.coordinate.longitude
//                //        print(place.formattedAddress!)
//    if   self.addresstype == 1 {
//
//                if(place.formattedAddress == "" || place.formattedAddress == nil){
//
//                     self.txtBilllingAddress.text = "Unknown place Cordinates Selected" + "  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
//
//                }else{
//
//                     self.txtBilllingAddress?.text = place.formattedAddress!
//                }
//
//    } else {
//
//            if(place.formattedAddress == "" || place.formattedAddress == nil){
//
//                self.txtShippingAddress.text = "Unknown place Cordinates Selected" + "  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
//
//            }else{
//
//                  self.txtBilllingAddress?.text = place.formattedAddress!
//            }
//    }
//
//
//
//
//                dismiss(animated: true, completion: nil)
//
//}
//
//func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
//
//viewController.dismiss(animated: true, completion: nil)
//
//print("No place selected")
//}
//
//func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//
//     print("Error: ", error.localizedDescription)
//}
//
//func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//dismiss(animated: true, completion:nil )
//}
//
//
//func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//      UIApplication.shared.isNetworkActivityIndicatorVisible = true
//}
//
//
//func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//       UIApplication.shared.isNetworkActivityIndicatorVisible = false
//}
//
//func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
//
//    dismiss(animated: true, completion: nil)
//    return true
//}
//
//
//}
//
//

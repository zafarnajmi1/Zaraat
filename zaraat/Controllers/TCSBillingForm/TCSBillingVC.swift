//
//  TCSBillingVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 12/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  DropDown
import SkyFloatingLabelTextField
class TCSBillingVC: UIViewController {
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

            addBackButton()
            setNavigationBarWhiteColor()
            btncontinoue.roundButton()
            self.title  = "TCS Detail"
            getAddress()
            btnCheck.setImage(UIImage.init(named: "unchcecked"), for: .normal)
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
                    
                self.txtBillingAddressType.text! = response.billing?.billing_address ?? ""
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
            if response.success == 1 {
                self.submitTCSApi()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    
    func submitTCSApi() {
        let headers = [
          "x-ibm-client-id": "c475d153-6d5e-4dda-820b-666629ec375c",
          "content-type": "application/json",
          "accept": "application/json"
        ]

        let parameters = [
          "userName": "zaraattech",
          "password": "zaraat@tcs2020",
          "costCenterCode": "01",
          "consigneeName": "\(self.txtShippingFirstName.text!)",
        "consigneeAddress": "\(self.txtShippingAddress.text!)",
        "consigneeMobNo": "\(self.txtShippingPhone.text!)",
        "consigneeEmail": "",
        "originCityName": "Lahore",
        "destinationCityName":"\(self.txtShippingCityName.text!)",
        "weight": 1,
        "pieces": pieces,
        "codAmount": "\(price)",
            "customerReferenceNo": "\(Int.random(in: 1..<1000))",
        "services": "O",
        "productDetails": "\(ProductsName)",
        "fragile": "Yes",
        "remarks": "metileku",
        "insuranceValue": 1
        ] as [String : Any]
    
        print(parameters)
        
        do {
        let postData =  try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://apis.tcscourier.com/production/v1/cod/create-order")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
          if (error != nil) {
            print(error?.localizedDescription ?? "")
             ShareData.hideProgress()
            DispatchQueue.main.async {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error!.localizedDescription, messagetype: 0)
                }
            
          } else {
             
            do {
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode(TCSModel.self, from: data!)
                
                self.tcsData = responseModel
                print(responseModel.bookingReply?.result)
                self.PlaceOrderApi()
//            let jsonData =  JSONDecoder()
//            let d = try jsonData.decode(TCSModel.self, from: data!)
//            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse)
            
            } catch {
                 ShareData.hideProgress()
            }
            
            }
        })
            
        
            
        dataTask.resume()
    
        } catch {
                 ShareData.hideProgress()
            }
        ShareData.hideProgress()
    }
    
    
    
    func PlaceOrderApi() {
        let userToken = ShareData.shareInfo.userInfo?.token
            let headers = [

              "content-type": "application/json",
              "accept": "application/json",
                "Authorization"  : "Bearer  " + userToken!
            ]

  
        var para:NSMutableDictionary = NSMutableDictionary()
        let prodArray:NSMutableArray = NSMutableArray()

       
        para = [ "shipping_id": addressdata.shipping?.shipping_id ?? "",
        "billing_id":addressdata.billing?.billing_id! ?? "",
        "payment_method": paymentMethod,
        "cn_cod": tcsData?.bookingReply?.result ?? "",
        "transection_uuid": "", "total":price]
        for product in cartData?.cart ?? []
        {
            let prod: NSMutableDictionary = NSMutableDictionary()
            prod.setValue("\(product.product?.products_id! ?? 0)", forKey: "product_id")
            prod.setValue(product.quantity, forKey: "order_quantity")
            prod.setValue(product.product?.selling_price, forKey: "price")
            prodArray.add(prod)
        }

        para.setObject(prodArray, forKey: "items" as NSCopying)
        
        
        print(para)
        
            do {
            let postData =  try JSONSerialization.data(withJSONObject: para, options: [])


                print(postData)
                let request = NSMutableURLRequest(url: NSURL(string: Constant.MainUrl + Constant.URLs.placeOrder)! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10000.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
              if (error != nil) {
                print(error?.localizedDescription ?? "")
                 ShareData.hideProgress()
                DispatchQueue.main.async {
                self.alertMessage(message: error!.localizedDescription, completionHandler: {})
                }
              } else {
                 
              
                do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddtoCart.self, from: data!)
                    ShareData.hideProgress()
                    DispatchQueue.main.async {
                        if responseModel.success == 1 {
                            
                        print(responseModel)
                            ShareData.shareInfo.count =  0
                            ShareData.shareInfo.unseenCart =  0
                            //self.alertMessage(message: "Order Place Successfully", completionHandler: {})
                        ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: responseModel.message ?? "", messagetype: 1)
                           self.movetoHome()
                        } else {
                            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: responseModel.message ?? "", messagetype: 0)
                        }
                    
                    }
                    
                   
                } catch {
                     ShareData.hideProgress()
                }

                }
            })



            dataTask.resume()

            } catch {
                     ShareData.hideProgress()
                }
            
        }
    
    
   
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
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
/*featuresdropDown.anchorView = btnstatus
                    featuresdropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    featuresdropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


                  var statustArray = [String]()
            statustArray = ["Active","In Active"]
            featuresdropDown.dataSource = statustArray

                    featuresdropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                        print(index)
                        self.txtstatus.text = item
                        if item == "Active" {
                            self.status = 1
                        } else {
                            self.status = 0
                        }
    //
                        
                        
//                        self.params.params.updateValue(self.categoriesList[index].categories_id!, forKey:"vendor_category_id" )
//                        self.subgategorapicall(id:self.categoriesList[index].categories_id)

                    }

                    featuresdropDown.show()*/

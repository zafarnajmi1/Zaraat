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
import  WebKit

class HBLBillingFormVC: UIViewController,WKNavigationDelegate  {
    
    
    var getAddrsses : BillingShipping?
    var amount = 0
    @IBOutlet weak var webView: WKWebView!
    var cartData : GetCartModel?
    var customer_id = 0
    var catids = ""
    var productnames = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    webView.navigationDelegate = self
       self.webView.isHidden = false
        addBackButton()
        setNavigationBarWhiteColor()
       
        self.title  = "HBL Payment Detail"
        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = true
        
       print(random(digits: 8))
        
    }
       
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.customer_id = cartData?.cart![0].customer_id ?? 0
        self.getAddrsses =  ShareData.shareInfo.billingshippignAddress
        settheValue()
    }
   
    func random(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
    
    
    func settheValue() {
        
        
        let queryItems = [URLQueryItem(name: "amount", value: "\(amount)"), URLQueryItem(name: "bill_to_forename", value: self.getAddrsses?.billing?.billing_person_name),URLQueryItem(name: "bill_to_surname", value: self.getAddrsses?.billing?.billing_person_name),URLQueryItem(name: "bill_to_address_line1", value: self.getAddrsses?.billing?.billing_address),URLQueryItem(name: "bill_to_address_city", value: self.getAddrsses?.billing?.billing_city),URLQueryItem(name: "bill_to_address_state", value: self.getAddrsses?.billing?.billing_state),URLQueryItem(name: "bill_to_address_postal_code", value: self.getAddrsses?.billing?.billing_zipcode),URLQueryItem(name: "bill_to_phone", value: self.getAddrsses?.billing?.billing_phone),URLQueryItem(name: "bill_to_email", value: ShareData.shareInfo.userInfo?.customer?.email),URLQueryItem(name: "ship_to_forename", value: self.getAddrsses?.shipping?.shipping_person_name),URLQueryItem(name: "ship_to_surname", value: self.getAddrsses?.shipping?.shipping_person_name),URLQueryItem(name: "ship_to_address_line1", value: self.getAddrsses?.shipping?.shipping_address),URLQueryItem(name: "ship_to_address_city", value: self.getAddrsses?.shipping?.shipping_city),URLQueryItem(name: "ship_to_address_state", value: self.getAddrsses?.shipping?.shipping_state),URLQueryItem(name: "ship_to_address_postal_code", value: self.getAddrsses?.shipping?.shipping_zipcode),URLQueryItem(name: "ship_to_phone", value: self.getAddrsses?.shipping?.shipping_phone),URLQueryItem(name: "ship_to_email", value: ShareData.shareInfo.userInfo?.customer?.email),URLQueryItem(name: "ship_to_phone", value: self.getAddrsses?.shipping?.shipping_phone),URLQueryItem(name: "consumer_id", value: "\(customer_id)"),URLQueryItem(name: "customer_ip_address", value: "\(getIP() ?? "")"),URLQueryItem(name: "reference_number", value: "\(random(digits: 8))"),URLQueryItem(name: "transaction_uuid", value: random(digits: 8)),URLQueryItem(name: "merchant_defined_data3", value: catids),URLQueryItem(name: "merchant_defined_data4", value: productnames) ]
        
         var urlComps = URLComponents(string: "https://zaraat.com/hblapiform")!
         urlComps.queryItems = queryItems
         let result = urlComps.url!
        
        
        print(result)
       
        let request = URLRequest(url: result)
        webView.load(request)
        
        
    }
        
     
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            print(urlStr)
            
            if urlStr == "https://secureacceptance.cybersource.com/declined" {
                //PlaceOrderApi()
            } else {
                
            }
        }

        decisionHandler(.allow)
    }
    
    struct Root : Codable {
        let reason_code:String?
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        webView.evaluateJavaScript("document.body.innerHTML") { (anyObject, error) in
            guard let htmlStr = anyObject as? String else {
                return
            }
            print(htmlStr.html2String)
            do {
                let dec = JSONDecoder()
                dec.keyDecodingStrategy = .useDefaultKeys
                let res = try dec.decode(Root.self, from:Data(htmlStr.html2String.utf8))
                print(res.reason_code!)
                
                if res.reason_code == "100" {
                    self.webView.isHidden = true
                    self.PlaceOrderApi()
                } else {
                    self.alertMessage(message: "Sorry! We Are Unable To Proceed, Try Again!", completionHandler: {
                        self.navigationController?.popViewController(animated: true)
                    })
                }
                
                
                
                print(res)
            } catch  {
                print("having trouble converting it to a dictionary" , error)
            }
//            let data: Data = htmlStr.html2String.data(using: .utf8)!
//            do {
//                let jsObj = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0))
//                if let jsonObjDict = jsObj as? Dictionary<String, Any> {
//                    //let threeDSResponse = ThreeDSResponse(dict: jsonObjDict)
//                    print(jsonObjDict["reason_code"])
//                }
//            } catch _ {
//                print("having trouble converting it to a dictionary")
//            }
            
        }
    }
    
    
    func PlaceOrderApi() {
        ShareData.showProgress()
           let userToken = ShareData.shareInfo.userInfo?.token
               let headers = [

                 "content-type": "application/json",
                 "accept": "application/json",
                   "Authorization"  : "Bearer  " + userToken!
               ]

     
           var para:NSMutableDictionary = NSMutableDictionary()
           let prodArray:NSMutableArray = NSMutableArray()

          
        para = [ "shipping_id": getAddrsses?.shipping?.shipping_id ?? "",
                 "billing_id":getAddrsses?.billing?.billing_id! ?? "",
           "payment_method": "HBL",
           "cn_cod":  "",
           "transection_uuid": random(digits: 8),
           "total":amount]
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
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func editAddress(_ sender: UIButton) {
        
            let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
            let vc =  storyBoard.instantiateViewController(withIdentifier: "SaveAddressesVC") as? SaveAddressesVC
            vc?.hidesBottomBarWhenPushed = true

            self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
      func getIP()-> String? {

      var address: String?
      var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
      if getifaddrs(&ifaddr) == 0 {

          var ptr = ifaddr
          while ptr != nil {
              defer { ptr = ptr?.pointee.ifa_next } // memory has been renamed to pointee in swift 3 so changed memory to pointee

              let interface = ptr?.pointee
              let addrFamily = interface?.ifa_addr.pointee.sa_family
              if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                  if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {  // String.fromCString() is deprecated in Swift 3. So use the following code inorder to get the exact IP Address.
                      var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                      getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                      address = String(cString: hostname)
                  }

              }
          }
          freeifaddrs(ifaddr)
        }

        return address
      }
    
}


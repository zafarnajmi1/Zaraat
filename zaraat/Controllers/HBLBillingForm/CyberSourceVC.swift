//
//  CyberSourceVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 12/21/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  InAppSDK
import  Alamofire
class CyberSourceVC: UIViewController, InAppSDKGatewayDelegate {
    
    
    var kInAppSDKDemoTestTransactionSecretKey = "819e57aac99f4a4ca045a589696b3cb6946012d48536428daf81ffccff8810d68f231be8bf1944aca2bba6ea29f3a03a59b2279de6fb4232a3858f18fe97d08cb1f72f26b7bf4eadb6b13180f7ed670d73a0826258974ff9a29f8315ebd3f439aaffe7d00e01465c943a965b2e8009740c57a0c27ae348ba8450ca27f6ff39e8"
    var kInAppSDKDemoTestMerchantReferenceNumber = "InAppSDKDemo_12345";
    var kInAppSDKDemoTestMerchantID = "7718C5C3-1647-4021-A39B-4F2C8744C8CD";
    
    @IBOutlet weak var txtcarnumber: UITextField!
    @IBOutlet weak var txtyear: UITextField!
    @IBOutlet weak var txtcvv: UITextField!
    @IBOutlet weak var btnpayment: UIButton!
    
    @IBOutlet weak var txtmonth: UITextField!
    var signature = ""
    var inappMarchent = InAppSDKMerchant.init()
      var inappTransactionObject = InAppSDKTransactionObject.init()
      var  cardData =  InAppSDKCardData.init()
      var  InAppSDKDemoSig =  InAppSDKDemoSignatureGenerator.init()
    
    var getBillToData =  InAppSDKAddress()
    
   
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(getIP())
        print(UIDevice.current.ipAddress())
        setNavigationBarWhiteColor()
        
        signature = InAppSDKDemoSig.generateDEMOSignature(withMerchantId: kInAppSDKDemoTestMerchantID, transactionSecretKey: kInAppSDKDemoTestTransactionSecretKey, merchantReferenceCode: kInAppSDKDemoTestMerchantReferenceNumber)
        
        print("my signature", signature)
        
              
        
            }
            
            
            
            
            
            
           
           
            
            func SignatureConfig() {
                
                inappMarchent.merchantID = kInAppSDKDemoTestMerchantID
                inappMarchent.merchantReferenceCode = "InAppSDKDemo_12345"
                inappMarchent.userName = "zafar Najmi"
                inappMarchent.passwordDigest = signature
                
                
                cardData.accountNumber = self.txtcarnumber.text
               cardData.cvNumber =  self.txtcvv.text
                cardData.expirationMonth = self.txtmonth.text
                cardData.expirationYear = self.txtyear.text
                
                
                getBillToData.firstName = "zafar"
                getBillToData.lastName = "najmi"
                getBillToData.postalCode = "54000"
                
                
                
                inappTransactionObject.merchant = inappMarchent
                inappTransactionObject.cardData = cardData
                inappTransactionObject.billTo = getBillToData
                
                
                
//                let cardData = InAppSDKCardData.init()
//                       cardData.accountNumber = txtCardNumber.text
//                       cardData.expirationMonth = txtMonth.text
//                       cardData.expirationYear = txtYear.text
//                       cardData.cvNumber = txtCVV.text
//
//                       //Create Transaction object
//                       let transactionObj = InAppSDKTransactionObject.init()
//                       transactionObj.billTo =
//                       transactionObj.cardData = cardData
//
//                       //Get the Merchant data and credentials and assign.
//                       transactionObj.merchant = getMerchantData()

                       //Set the End point / Environment. Test or Live
                       InAppSDKSettings.sharedInstance()?.inAppSDKEnvironment = INAPPSDK_ENV_TEST

                       //Enable log for debugging
                       InAppSDKSettings.sharedInstance()?.enableLog = true

                       //Obtain the gateway sharted instance.
                       let gatWay = InAppSDKGateway.sharedInstance()
            
                       let result = (gatWay?.performPaymentDataEncryption(inappTransactionObject, with: self))!

                       if (result) {
                        
                         print(result)
                           NSLog("InAppSDK: Request Accepted. Expect the response in the delegate method.");
                       }
                       else {
                           NSLog("InAppSDK: Request NOT Accepted. Verify the input values if any one is invalid.");
                       }
                
                
                
                
                
                
                
                
                
                
                
                
               
            }
    
    
    func encryptPaymentDataServiceFinished(with paramResponseData: InAppSDKGatewayResponse!, withError paramError: InAppSDKError!) {
           print(paramResponseData.resultCode)
       }
    
    
    
    
    
    
    
//signed_field_names:access_key,profile_id,bill_to_forename,bill_to_surname,bill_to_address_line1,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code,bill_to_phone,bill_to_email,ship_to_forename,ship_to_surname,ship_to_address_line1,ship_to_address_city,ship_to_address_state,ship_to_address_country,ship_to_address_postal_code,ship_to_phone,ship_to_email,consumer_id,customer_ip_address,merchant_defined_data1,merchant_defined_data2,merchant_defined_data3,merchant_defined_data4,merchant_defined_data5,merchant_defined_data6,merchant_defined_data7,merchant_defined_data8,merchant_defined_data20,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency
    
    func HBLApi(){
            let headers = [
              "content-type": "application/json",
              "accept": "application/json",
                "_token": ShareData.shareInfo.userInfo?.token
            ]

            let parameters = [
                "_token": ShareData.shareInfo.userInfo?.token ?? "",
            "signed_field_names": "access_key,profile_id,bill_to_forename,bill_to_surname,bill_to_address_line1,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code,bill_to_phone,bill_to_email,ship_to_forename,ship_to_surname,ship_to_address_line1,ship_to_address_city,ship_to_address_state,ship_to_address_country,ship_to_address_postal_code,ship_to_phone,ship_to_email,consumer_id,customer_ip_address,merchant_defined_data1,merchant_defined_data2,merchant_defined_data3,merchant_defined_data4,merchant_defined_data5,merchant_defined_data6,merchant_defined_data7,merchant_defined_data8,merchant_defined_data20,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency",
            
            "access_key" : "9b56c776d8663f75bc87ca015d0171ed",
            "profile_id": "7718C5C3-1647-4021-A39B-4F2C8744C8CD",
            "bill_to_forename": "zafar" ,
            "bill_to_surname" : "najmi",
            "bill_to_address_line1":"lahore",
            "bill_to_address_city" : "Lahore",
            "bill_to_address_state" : "Punjab",
            "bill_to_address_country": "Pakistan",
            "bill_to_address_postal_code":"54000",
            "bill_to_phone":"03328484285",
            "bill_to_email":"zafar@zaraat.com",
            "ship_to_forename":"ali",
            "ship_to_surname":"Mirxa",
            "ship_to_address_line1":"Lahore",
            "ship_to_address_city":"Lahore",
            "ship_to_address_state":"Punjab",
            "ship_to_address_country":"Pakistan",
            "ship_to_address_postal_code":"54000",
            "ship_to_phone":"033284567",
            "ship_to_email":"ali@zaraat.com",
            "consumer_id":"123",
            "customer_ip_address":"127.0.0.1",
            "merchant_defined_data1":"No",
            "merchant_defined_data2":"WC",
            "merchant_defined_data3":"36",
            "merchant_defined_data4":"136",
            "merchant_defined_data5":"Standerd",
            "merchant_defined_data6":"Pakitan",
            "merchant_defined_data7":"No",
            "merchant_defined_data8":"No",
            "merchant_defined_data20":"No",
            "transaction_uuid":kInAppSDKDemoTestTransactionSecretKey,
            
            "unsigned_field_names":"",
            "locale":"en",
            "transaction_type":"sale",
            "reference_number":"12",
            "amount":"12000",
            "currency":"PKR",
            "signature": signature
            
            
            
            
            
            ] as [String : Any]
        
            print(parameters)
        
        
        
//       AF.request("https://testsecureacceptance.cybersource.com/pay", method:.post, parameters: parameters,encoding: JSONEncoding.default) .responseJSON { (response) in
//        print(response.result)
//        print(response.error)
//        }
        
        
        
        
//
        //create the url with URL
        let url = URL(string: "https://testsecureacceptance.cybersource.com/pay")! //change the url

        //create the session object
        let session = URLSession.shared

        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Content-Type", forHTTPHeaderField: "text/html; charset=UTF-8")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

            guard error == nil else {
                print(error?.localizedDescription)
                return
            }

            guard let data = data else {
                return
            }

            do {

                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            
//            do {
//            let postData =  try JSONSerialization.data(withJSONObject: parameters, options: [])
//
//            let request = NSMutableURLRequest(url: NSURL(string: "https://testsecureacceptance.cybersource.com/pay")! as URL,
//                                                    cachePolicy: .useProtocolCachePolicy,
//                                                timeoutInterval: 10.0)
//            request.httpMethod = "POST"
//            request.allHTTPHeaderFields = headers
//            request.httpBody = postData as Data
//            let session = URLSession.shared
//            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
//              if (error != nil) {
//                print(error?.localizedDescription ?? "")
//                 ShareData.hideProgress()
//                DispatchQueue.main.async {
//                    ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error!.localizedDescription, messagetype: 0)
//                    }
//
//              } else {
//
//                do {
//                let jsonDecoder = JSONDecoder()
//                let responseModel = try jsonDecoder.decode(TCSModel.self, from: data!)
//
//
//    //            let jsonData =  JSONDecoder()
//    //            let d = try jsonData.decode(TCSModel.self, from: data!)
//    //            let httpResponse = response as? HTTPURLResponse
//    //            print(httpResponse)
//
//                } catch {
//                     ShareData.hideProgress()
//                }
//
//                }
//            })
//
//
//
//            dataTask.resume()
//
//            } catch {
//                     ShareData.hideProgress()
//                }
//            ShareData.hideProgress()
        }
    @IBAction func paymentAction(_ sender: UIButton) {
        
        SignatureConfig()
        //HBLApi()
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

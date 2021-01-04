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
let merchantIdentifier = "merchant.cybersource.net.test.dev"
class HBLBillingFormVC: UIViewController,WKNavigationDelegate,WKUIDelegate, WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        extractJsonObjFromScriptMsg(message: message)
    }
    
    func extractJsonObjFromScriptMsg(message: WKScriptMessage) {
    
    //var housePrices = [HousePrice]()
    //step 1: check if the obj is a string
    if let objStr = message.body as? String {
        //step 2: convert the string to Data
        let data: Data = objStr.data(using: .utf8)!
        do {
            let jsObj = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0))
            if let jsonObjDict = jsObj as? Dictionary<String, Any> {
                print(jsonObjDict["reason_code"] as Any)
//                let housePrice = HousePrice(dict: jsonObjDict)
//                housePrices.append(housePrice)
//                } else if let jsonArr = jsObj as? [Dictionary<String, Any>] {
//                    for jsonObj in jsonArr {
//                        let hPrice = HousePrice(dict: jsonObj)
//                        housePrices.append(hPrice)
//                    }
                }
                } catch _ {
                    print("having trouble converting it to a dictionary")
                }
            }
        }
    
    var getAddrsses : BillingShipping?
    var amount = 0
    @IBOutlet weak var webView: WKWebView!
    
    

    
    
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
    webView.navigationDelegate = self
        addBackButton()
        setNavigationBarWhiteColor()
        //btncontinoue.roundButton()
        self.title  = "HBL Payment Detail"
        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = true
//        let url:URL = URL(string: "https://zaraat.com/hblapiform")!
//            let urlRequest:URLRequest = URLRequest(url: url)
//            webView.load(urlRequest)
        getAddresses()
    }
       
    
    //wv.loadUrl("https://zaraat.com/hblapiform?bill_to_forename=" + bfname + "&bill_to_surname=" + blname + "&bill_to_address_line1=" + baddr + "&bill_to_address_city=" + bcity + "&bill_to_address_state=" + bprovince + "&bill_to_address_postal_code=" + bpostalcode + "&bill_to_phone=" + bphone + "&ship_to_forename=" + sfname + "&ship_to_surname=" + slname + "&ship_to_address_line1=" + saddr + "&ship_to_address_city=" + scity + "&ship_to_address_state=" + sprovince + "&ship_to_address_postal_code=" + spostalcode + "&ship_to_phone=" + sphone + "&ship_to_email=" + semail + "&amount=" + amount + "&bill_to_email=" + bemail + "");
    
    func getAddresses() {
        ShareData.showProgress()
        userhandler.getAddress(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.getAddrsses =  response
                
                self.settheValue()

                

//
//                self.webView.evaluateJavaScript("document.getElementById('bill_to_address_city').value=\(self.getAddrsses?.billing?.billing_city ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('bill_to_address_state').value =\(self.getAddrsses?.billing?.billing_state ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('bill_to_address_postal_code').value=\(self.getAddrsses?.billing?.billing_zipcode ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('bill_to_phone').value =\(self.getAddrsses?.billing?.billing_phone ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('bill_to_email').value = '') ;")
//
//
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_forename').value=\(self.getAddrsses?.shipping?.shipping_person_name ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_surname').value=\(self.getAddrsses?.shipping?.shipping_person_name ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_address_line1').value=\(self.getAddrsses?.shipping?.shipping_address ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_address_city').value=\(self.getAddrsses?.shipping?.shipping_city ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_address_state').value=\(self.getAddrsses?.shipping?.shipping_state ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_address_postal_code').value=\(self.getAddrsses?.shipping?.shipping_zipcode ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_phone').value=\(self.getAddrsses?.shipping?.shipping_phone ?? "") ;")
//                self.webView.evaluateJavaScript("document.getElementById('ship_to_email').value = '') ;")
//                self.webView.evaluateJavaScript("document.getElementById('amount').value= '\(self.amount)') ;")
                
            } else {
                ShareData.hideProgress()
            }
        }, Failure: {error in
            ShareData.hideProgress()
        })
    }
    
    
    func settheValue() {
        
        
        webView.evaluateJavaScript("document.getElementByName('amount').value = '\(amount)') ;")
        let myurl = "https://zaraat.com/hblapiform?amount=\(amount)"
//        let myurl = "https://zaraat.com/hblapiform?amount=\(amount)&bill_to_forename=\(self.getAddrsses?.billing?.billing_person_name ?? "")&bill_to_address_line1=\(self.getAddrsses?.billing?.billing_address ?? "")&bill_to_address_city=\(self.getAddrsses?.billing?.billing_city ?? "")&bill_to_address_state=\(self.getAddrsses?.billing?.billing_state ?? "")&bill_to_address_postal_code=\(self.getAddrsses?.billing?.billing_zipcode ?? "")&bill_to_phone=\(self.getAddrsses?.billing?.billing_phone ?? "")&bill_to_email=&ship_to_forename=\(self.getAddrsses?.shipping?.shipping_person_name ?? "")&ship_to_surname=\(self.getAddrsses?.shipping?.shipping_person_name ?? "")&ship_to_address_line1=\(self.getAddrsses?.shipping?.shipping_address ?? "")&ship_to_address_city=\(self.getAddrsses?.shipping?.shipping_city ?? "")&ship_to_address_state=\(self.getAddrsses?.shipping?.shipping_state ?? "")&ship_to_address_postal_code=\(self.getAddrsses?.shipping?.shipping_zipcode ?? "")&ship_to_phone=\(self.getAddrsses?.shipping?.shipping_phone ?? "")&ship_to_email="
        
        
        print(myurl)
       let url = URL(string: myurl)
        
        let urlRequest:URLRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
    }
    
//    func webViewDidFinishLoad(webView: WKWebView!) {
//        webView.evaluateJavaScript("document.getElementById('bill_to_forename').value = \(getAddrsses?.billing?.billing_person_name ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('bill_to_address_line1').value = \(getAddrsses?.billing?.billing_address ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('bill_to_address_city').value = \(getAddrsses?.billing?.billing_city ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('bill_to_address_state').value = \(getAddrsses?.billing?.billing_state ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('bill_to_address_postal_code').value = \(getAddrsses?.billing?.billing_zipcode ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('bill_to_phone').value = \(getAddrsses?.billing?.billing_phone ?? "") ;")
//         webView.evaluateJavaScript("document.getElementById('bill_to_email').value = '') ;")
//
//
//        webView.evaluateJavaScript("document.getElementById('ship_to_forename').value = \(getAddrsses?.shipping?.shipping_person_name ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('ship_to_surname').value = \(getAddrsses?.shipping?.shipping_person_name ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('ship_to_address_line1').value = \(getAddrsses?.shipping?.shipping_address ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('ship_to_address_city').value = \(getAddrsses?.shipping?.shipping_city ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('ship_to_address_state').value = \(getAddrsses?.shipping?.shipping_state ?? "") ;")
//         webView.evaluateJavaScript("document.getElementById('ship_to_address_postal_code').value = \(getAddrsses?.shipping?.shipping_zipcode ?? "") ;")
//         webView.evaluateJavaScript("document.getElementById('ship_to_phone').value = \(getAddrsses?.shipping?.shipping_phone ?? "") ;")
//        webView.evaluateJavaScript("document.getElementById('ship_to_email').value = '') ;")
//        webView.evaluateJavaScript("document.getElementById('amount').value = '\(amount)') ;")
//       }
    
    
    
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            //urlStr is what you want
        }

        decisionHandler(.allow)
    }
    
    


    

    
}
extension HBLBillingFormVC {

//func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//
//    print("insert element")
//
//    let scriptFunction = "document.getElementById('id_i').value = '\(2)';"
//    webView.evaluateJavaScript(scriptFunction) { (result, error) in
//
//        if error != nil {
//
//            //ProgressHUD.showError(error as? String)
//
//        } else {
//
//            print("trying to submit")
//            let submitFunction = "document.forms[0].submit();"
//            webView.evaluateJavaScript(submitFunction) { (result, error) in
//                if error != nil {
//                    print(error?.localizedDescription)
//
//                } else {
//                    print("submited")
//                }
//            }
//        }
//    }
//
//}
//    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
//        webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML") { innerHTML, error in
//            print(innerHTML!)
//        }
//    }
    
    
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        print("redirect didFinish")
//
//        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
//                                   completionHandler: { (html: Any?, error: Error?) in
//                                    print(html as Any)
//
//
//        })
//    }
//
    
    
   


//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
//        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { (anyObject, error) in
//            guard let htmlStr = anyObject as? String else {
//                return
//            }
//            let data: Data = htmlStr.data(using: .utf8)!
//            print(data.base64EncodedData())
//
//            do {
//                let jsObj = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0))
//                if let jsonObjDict = jsObj as? Dictionary<String, Any> {
//                    print(jsonObjDict["reason_code"]!)
////                    let threeDSResponse = ThreeDSResponse(dict: jsonObjDict)
////                    print(threeDSResponse)
//                }
//            } catch _ {
//                print("having trouble converting it to a dictionary")
//            }
//        }
//    }
////
    
    
    
//    func webView(webView:WKWebView,
//          shouldStartLoadWithRequest request:NSURLRequest,
//          navigationType:WKWebView.n) -> Bool
//    {
//    if (navigationType == .FormSubmitted)
//        {
//        print("was the 'submit' form")
//        }
//
//    let u = request.mainDocumentURL
//    print("local or remote url was " ,u)
//
//    return true // allow the form to in fact send the form
//    }
    
    
    
    
}
extension URL {

    func appending(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
    
//    func appending(_ queryItems: [URLQueryItem]) -> URL? {
//        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
//            // URL is not conforming to RFC 3986 (maybe it is only conforming to RFC 1808, RFC 1738, and RFC 2732)
//            return nil
//        }
//        // append the query items to the existing ones
//        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
//
//        // return the url from new url components
//        return urlComponents.url
//    }
}

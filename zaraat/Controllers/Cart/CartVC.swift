//
//  CartVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 06/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class CartVC: UIViewController,ItemDelete,UITextFieldDelegate,Additems {
    
    @IBOutlet weak var lblcoupan: UILabel!
    @IBOutlet weak var lblcoupanValue: UILabel!
    @IBOutlet weak var lblsubtotla: UILabel!
    @IBOutlet weak var lbldeliveryCharg: UILabel!
    
    @IBOutlet weak var lbltotla: UILabel!
    
    @IBOutlet weak var txtcoupan: UITextField!
    

    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var btnproceed: UIButton!
    
    @IBOutlet weak var sbTotalView: UIView!
    var cartData : GetCartModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtcoupan.delegate = self
        self.txtcoupan.addTarget(self, action: #selector(textFieldDidChange(_:)),for: UIControl.Event.editingDidEnd)
        self.btnproceed.roundButton()
        addBackButton()
        //setNavigationBar()
        setNavigationBarWhiteColor()
        self.title = "Shopping Cart"
        tblView.register(UINib.init(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
        sbTotalView.viewSetUp(radius: 5, color: #colorLiteral(red: 0.8587297797, green: 0.8588775992, blue: 0.8587204218, alpha: 1), borderwidth: 1)
        getCartDataApi()
        self.lblcoupan.isHidden = true
        self.lblcoupanValue.isHidden =  true
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
    

    
    func getCartDataApi(){
        ShareData.showProgress()
        userhandler.getCartData(Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.cartData =  response
               
                var value = 0
                var mytotal = 0
                
                for item in self.cartData?.cart ?? [] {
                    let p = ((item.product?.selling_price!)! as NSString).integerValue
                    mytotal += (item.quantity ?? 0) * (p)
                    //value += value + mytotal
                }
               value = mytotal
                self.lbltotla.text = "\(value)"
                self.lbldeliveryCharg.text = "200"
                let deliveryCharg = Int(self.lbldeliveryCharg.text!)
                let totalValue = value + deliveryCharg!
                self.lbltotla.text = "\(totalValue)"
                self.lblsubtotla.text = "\(value)"
                
                
                self.tblView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    func deleteProduct(cell: CartCell) {
        let indx =  tblView.indexPath(for: cell)
       
        ShareData.showProgress()
        let dic : [String:Any] =  ["cart_id": self.cartData?.cart![indx!.row].cart_id ?? 0]
        userhandler.DeleteFromCart(parms: dic, Success: { response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.cartData?.cart?.remove(at: indx?.row ?? 0)
                self.tblView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    func additem(cell: CartCell) {
        
        let indx =  tblView.indexPath(for: cell)

        let dic : [String:Any] = ["product_id":self.cartData?.cart?[indx?.row ?? 0].product_id ?? 0, "quantity": Int(cell.stper.value)]
        userhandler.addtoCart(parms: dic, Success: {response in
            if response.success == 1 {
                self.cartData =  response

//                       self.lbldeliveryCharg.text = "200"
//                let sellingPrice = ((self.cartData?.cart?[indx?.row ?? 0].product?.selling_price)! as NSString).integerValue
//                       let qty  =   self.cartData?.cart?[indx?.row ?? 0].quantity
//                       let Deliverycharg = Int(self.lbldeliveryCharg.text!)
//                let subtotal = (sellingPrice ) * (qty!)
//                       self.lblsubtotla.text = "\(subtotal)"
//                       let totalValue = subtotal + Deliverycharg!
//                       self.lbltotla.text = "\(totalValue)"
                
                
                
                var value = 0
                var mytotal = 0
                self.lblcoupan.isHidden = true
                self.lblcoupanValue.isHidden =  true
                self.txtcoupan.text = ""
                for item in self.cartData?.cart ?? [] {
                    let p = ((item.product?.selling_price!)! as NSString).integerValue
                    mytotal += (item.quantity ?? 0) * (p)
//                    value += value + (item.quantity ?? 0) * (p)
                }
                value = mytotal
                self.lbltotla.text = "\(value)"
                self.lbldeliveryCharg.text = "200"
                let deliveryCharg = Int(self.lbldeliveryCharg.text!)
                let totalValue = value + deliveryCharg!
                self.lbltotla.text = "\(totalValue)"
                self.lblsubtotla.text = "\(value)"


                ShareData.shareInfo.count = response.cart?.count ?? 0
                ShareData.shareInfo.unseenCart = response.cart?.count ?? 0

               self.tblView.reloadData()

            } else {
                self.alertMessage(message: response.message ?? "", completionHandler: {
                    print("error in Add product")
                })
            }
        }, Failure: {error in
            self.alertMessage(message: error.message , completionHandler: {
                print("error")
            })
        })
    }
    
    
    
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
       print( "i am coupan code")
        addcouncodeApi()
    }
    
    func addcouncodeApi() {
        
        userhandler.getCoupancode(coupan: self.txtcoupan.text!, Success: {response in
            if response.success == 1 {
                self.lblcoupan.isHidden = false
                self.lblcoupanValue.isHidden =  false
                
                self.lblcoupanValue.text = response.coupon?.coupon_value
                
                let totalvalue = ((self.lbltotla.text!) as NSString).integerValue
                let coupanvalue = ((response.coupon?.coupon_value!)! as NSString).integerValue
                print(response.coupon?.coupon_value)
                let total =  totalvalue -  coupanvalue
                self.lbltotla.text =  "\(total)"
            } else {
                self.txtcoupan.text = ""
                self.lblcoupan.isHidden = true
                self.lblcoupanValue.isHidden =  true
            }
        }, Failure: {error in
            
        })
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print( "i am coupan code")
//    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print( "i am coupan code")
//    }
    
}
extension CartVC :  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ShareData.shareInfo.unseenCart = self.cartData?.cart?.count ?? 0
        return self.cartData?.cart?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell
        let obj =  self.cartData?.cart![indexPath.row]
        cell?.delegate = self
        cell?.addiremDelegate = self
        cell?.loadData(obj: obj!)
        return cell!
    }
    
    
}

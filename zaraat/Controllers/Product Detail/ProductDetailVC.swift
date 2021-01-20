//
//  ProductDetailVC.swift
//  zaraat
//
//  Created by Zafar Najmi on 26/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  Cosmos
import SDWebImage
class ProductDetailVC: UIViewController {
    
       
    @IBOutlet weak var colorClView: UICollectionView!
    
    @IBOutlet weak var sizeClView: UICollectionView!
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var yearsView: UIView!
    @IBOutlet weak var lblb2bPrices: UILabel!
    @IBOutlet weak var StockB2B: UILabel!
    @IBOutlet weak var lblAbility: UILabel!
    @IBOutlet weak var lblBags: UILabel!
    @IBOutlet weak var lblstock: UILabel!
    
   // @IBOutlet weak var btncomments: UIButton!
    @IBOutlet weak var shareView: UIView!
    var isb2b =  0
    var iswishlist = true
    @IBOutlet weak var heartimg: UIImageView!
    @IBOutlet weak var btninquires: UIButton!
    @IBOutlet weak var btnchat: UIButton!
    
    @IBOutlet weak var b2bstack: UIStackView!
    @IBOutlet weak var clViewheight: NSLayoutConstraint!
    @IBOutlet weak var pager: UIPageControl!
     @IBOutlet weak var sliderClView: UICollectionView!
    @IBOutlet weak var lblsupliretitle: UILabel!
    
    @IBOutlet weak var lbldetailsseller: UILabel!
    @IBOutlet weak var lblshopename: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var lbltitle: UILabel!
    //@IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbldetail: UILabel!
    @IBOutlet weak var btnaddtocart: UIButton!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var stockInfoB2B: UIStackView!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var hertView: UIView!
    var productData : ProductDetail?
    //@IBOutlet weak var colorSizeStack: UIStackView!
    var id = 0
    var sizename = ""
    var colorName = ""
    var variations = ""
    
   
    var  sizeArray = [String]()
    
    struct colorArray {
        var colorname : String?
        var colorCode : String?
    }
     var colorData = [colorArray]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        //self.btncomments.roundButton()
        self.title = "Product Detail"
        btnaddtocart.roundButton()
        btnchat.roundButton()
        btninquires.roundButton()
        hertView.layer.borderWidth = 1
              hertView.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
              hertView.layer.cornerRadius = 5
        
        self.rating.isUserInteractionEnabled = false
        
        yearsView.layer.borderWidth = 1
        yearsView.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
        yearsView.layer.cornerRadius =  10
        
        shareView.layer.borderWidth = 1
                     shareView.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
                     shareView.layer.cornerRadius = 5
        
        setNavigationBarWhiteColor()
        
         sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")
        detailView.layer.cornerRadius = 8
        detailView.layer.borderWidth = 1
        detailView.layer.borderColor =  #colorLiteral(red: 0.8468492627, green: 0.8509765267, blue: 0.8550060391, alpha: 1)
       getproductdetailApi()
        setSlider()
        if isb2b == 2 {
            b2bstack.isHidden = false
             btnaddtocart.isHidden = true
        } else {
            b2bstack.isHidden = true
            btnaddtocart.isHidden = false
        }
        
        
        
        self.tblView.register(UINib.init(nibName: "ReviewsCell", bundle: nil), forCellReuseIdentifier: "ReviewsCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tblView.estimatedRowHeight = 100
        tblView.rowHeight = UITableView.automaticDimension
    }
    
    func setSlider(){
            
            //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    //        layout.itemSize = CGSize(width:self.slidercollection.frame.width, height: self.slidercollection.frame.height)
    //        layout.minimumInteritemSpacing = 0
    //        layout.minimumLineSpacing = 0
    //        layout.scrollDirection = .horizontal
    //        self.slidercollection!.collectionViewLayout = layout
            Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
            
            
        }
        
        
        @objc func scrollAutomatically(_ timer: Timer) {
            
            if let coll  = self.sliderClView {
                for cell in coll.visibleCells {
                    let indexPath: IndexPath? = coll.indexPath(for: cell)
                    if ((indexPath?.row)!  < self.productData?.images?.count ?? 0 - 1){
                        let indexPath1: IndexPath?
                        indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                        
                        coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    }
                    else{
                        let indexPath1: IndexPath?
                        indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                        coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                    }
                    
                }
            }
        }
    
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let newHeighttop : CGFloat = sliderClView.collectionViewLayout.collectionViewContentSize.height
         clViewheight.constant = newHeighttop
    sliderClView.reloadData()
         self.view.setNeedsLayout()
        
    }
    
    
    
    func getproductdetailApi(){
        ShareData.showProgress()
        userhandler.getProductDetail(id: id, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
               
                self.productData =  response.product
                
                self.colorData.removeAll()
                self.sizeArray.removeAll()
                
                for item in self.productData?.variations?.attributes ?? [] {
                     //"Color"
                    if item.attribute_name?.attribute_title == "Color"{
                        for i in item.attribute_values ?? [] {
                            self.colorData.append(colorArray(colorname: i.actual_value?.value_names, colorCode: i.actual_value?.attribute_values)) //append((i.actual_value?.attribute_values)!)
                        }
                    } else {
                        for i in item.attribute_values ?? [] {
                            self.sizeArray.append((i.actual_value?.value_names)!)
                        }
                    }
                }
                
                
                
                
                
                
                
                self.rating.rating =  self.productData?.avg_rating ?? 0
                if response.product?.liked == 1 {
                    self.iswishlist = false
                    self.heartimg.image = UIImage.init(named: "heart")
                } else {
                    self.iswishlist = true
                    self.heartimg.image = UIImage.init(named: "Heart-1")
                }
                
                
                
                
               self.lbldetail.text = response.product?.product_description_en
                self.lbltitle.text =  response.product?.product_title_en
                self.lbldetailsseller.text =  response.product?.vendor?.description
                self.lblshopename.text = response.product?.vendor?.company_name
                
                
                if response.product?.market?.lowercased() == "b2b" || response.product?.market?.lowercased() == "both"{
                    self.b2bstack.isHidden = false
                    self.btnaddtocart.isHidden = true
                    self.rating.isHidden = true
                    self.b2bstack.isHidden = false
                    self.stockInfoB2B.isHidden = false
                    self.lblb2bPrices.isHidden = false
                    self.lblprice.isHidden = true
                    self.lblb2bPrices.text =  "Price : " + (response.product?.selling_price)!  + " PKR"
                    
                    self.lblBags.text = "Min Order Qty :" + (response.product?.product_stock)!
                    self.lblAbility.text = "Supply Ability :" + (response.product?.product_supply_ability)!
                    self.lblBags.text = "Stock:" + (response.product?.product_stock)!
                    
                    //self.colorSizeStack.isHidden = true
                    
                } else {
                    self.rating.isHidden = false
                    self.b2bstack.isHidden = true
                    self.b2bstack.isHidden = true
                    self.btnaddtocart.isHidden = false
                    self.lblb2bPrices.isHidden = true
                    self.lblprice.isHidden = false
                    self.stockInfoB2B.isHidden = true
                    //self.colorSizeStack.isHidden = false
                    self.lblstock.text = "Instock :" + (response.product?.product_stock)!
                                  
                                  self.lblprice.text =  "Price : " + (response.product?.selling_price)!  + " PKR"
                                 
                    
                    
                    
                }
                
                
                
                
                 self.setViewHeight()
                self.tblView.reloadData()
                self.colorClView.reloadData()
                self.sizeClView.reloadData()
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    private func setViewHeight(){
        var tableViewHeight:CGFloat = 0;
        for i in 0..<self.tblView.numberOfRows(inSection: 0){
            tableViewHeight = tableViewHeight + tableView(self.tblView, heightForRowAt: IndexPath(row: i, section: 0))
        }
        tblHeight.constant = tableViewHeight + 10
        self.tblView.setNeedsDisplay()
    }
    
    
//    @IBAction func commentsAction(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "WriteCommentsVC") as? WriteCommentsVC
//        vc!.modalPresentationStyle = .overCurrentContext
//        present(vc!, animated: true, completion: nil)
//    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        if let name = URL(string: productData?.share_url ?? ""), !name.absoluteString.isEmpty {
          let objectsToShare = [name]
          let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
          self.present(activityVC, animated: true, completion: nil)
        } else {
          // show alert for not available
        }
    }
    
    
    @IBAction func btnChatAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func btnInquieriesAction(_ sender: UIButton) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "B2BInquireisVC") as? B2BInquireisVC
        vc?.productData =  self.productData
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func addtoCartAction(_ sender: UIButton) {
        addtocartApi()
    }
    
    
    
    func addtocartApi() {
        let dic : [String:Any] = ["product_id":self.productData?.products_id ?? 0, "variations": colorName + "," + sizename]
        userhandler.addtoCart(parms: dic, Success: {response in
            if response.success == 1 {
                
                //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CartCount"), object: nil, userInfo: ["CartValue":response.cart?.count ?? 0] )
                ShareData.shareInfo.count = response.cart?.count ?? 0
                ShareData.shareInfo.unseenCart = response.cart?.count ?? 0
                ShareData.shareInfo.CartSaveData(cart: response)
                
                self.alertMessage(message: response.message ?? "", completionHandler: {
                    self.navigationController?.popViewController(animated: true)
                })
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
    
    
    @IBAction func addWishLisst(_ sender: UIButton) {
        if iswishlist == true {
            //iswishlist = false
            self.heartimg.image = UIImage.init(named: "heart")
            addwishlist()
            
        } else {
            //iswishlist = true
            self.heartimg.image = UIImage.init(named: "Heart-1")
            Removewishlist()
        }
        
        iswishlist = !iswishlist
    }
    
    
    func addwishlist() {
        ShareData.showProgress()
        let dic : [String:Any] = ["product_id":self.productData?.products_id ?? 0]
        userhandler.WishList(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1{
                
            } else {
                ShareData.hideProgress()
            }
        }, Failure: {error in
            ShareData.hideProgress()
        })
        
    }
    
    
    
    func Removewishlist() {
        ShareData.showProgress()
        let dic : [String:Any] = ["item_id":self.productData?.products_id ?? 0]
        userhandler.removeWishList(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1{
                
            } else {
                ShareData.hideProgress()
            }
        }, Failure: {error in
            ShareData.hideProgress()
        })
        
    }
    
    
    

    @IBAction func MoreAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SellerProfileVC") as! SellerProfileVC
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc.supplierData = self.productData
        self.present(vc, animated: true, completion: nil)
    }
}
extension ProductDetailVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your message here" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)
            
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Write your message here"
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)//UIColor.lightGray
            
        }
    }
    
    
    
    
    
    
}
extension ProductDetailVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == colorClView {
            return self.colorData.count
            
        } else if collectionView == sizeClView {
            return self.sizeArray.count
        } else {
            
        self.pager.numberOfPages =  self.productData?.images?.count ?? 0
             return self.productData?.images?.count ?? 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView ==  sliderClView {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCLCell", for: indexPath) as? SliderCLCell
        cell?.img.sd_setImage(with: URL(string: self.productData?.images?[indexPath.row].file_path ?? "Text"))
         return cell!
    
     } else if collectionView == sizeClView {
                  let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) as? SizeCell
           
            cell?.lblsize.text =  self.sizeArray[indexPath.row]
                                 return cell!
                 
              
        } else {
                  
            let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell
                  
            let color2 = UIColor(hex: self.colorData[indexPath.row].colorCode!)
            cell?.ColorView.backgroundColor =  color2
                                 return cell!
                 
              }
      }
      
      
      
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
       if collectionView == sizeClView {
              let cell = collectionView.cellForItem(at: indexPath) as! SizeCell
              cell.toggleSelected()
              
        
        
        
        self.sizename = self.sizeArray[indexPath.row]
              
          } else {
              let cell = collectionView.cellForItem(at: indexPath) as? ColorCell
        cell?.toggleSelected()
               
                     
                   
        self.colorName = self.colorData[indexPath.row].colorname!
          }
      }
      

      func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
          if collectionView == sizeClView {
                     let cell = collectionView.cellForItem(at: indexPath) as! SizeCell
                     cell.toggleSelected()
                     // sizeid = ""
                     
                 } else {
                     let cell = collectionView.cellForItem(at: indexPath) as! ColorCell
                     cell.toggleSelected()
                    //colorid = ""
                 }
      }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           self.pager.currentPage = indexPath.row
       }
   
}

extension ProductDetailVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

         return 200

    }
    
    
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productData?.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ReviewsCell") as? ReviewsCell
        cell!.lblReviews.text = self.productData?.reviews![indexPath.row].reviews
        cell?.lblName.text =  self.productData?.reviews![indexPath.row].customer?.first_name
        return cell!
    }
    
    
}

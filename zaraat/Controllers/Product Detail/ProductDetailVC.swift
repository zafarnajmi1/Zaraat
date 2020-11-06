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
    
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var hertView: UIView!
    var productData : ProductDetail?
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        self.title = "Product Detail"
        btnaddtocart.roundButton()
        btnchat.roundButton()
        btninquires.roundButton()
        hertView.layer.borderWidth = 1
              hertView.layer.borderColor = #colorLiteral(red: 0.1253529191, green: 0.1293642223, blue: 0.1335152388, alpha: 1)
              hertView.layer.cornerRadius = 5
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
                
                if response.product?.liked == 1 {
                    self.iswishlist = false
                    self.heartimg.image = UIImage.init(named: "heart")
                } else {
                    self.iswishlist = true
                    self.heartimg.image = UIImage.init(named: "Heart-1")
                }
                
                self.lbltitle.text =  response.product?.product_title_en
                self.lblprice.text =  "Price : " + (response.product?.selling_price)!  + " PKR"
                self.lbldetail.text = response.product?.product_description_en
                
                self.lbldetailsseller.text =  response.product?.vendor?.description
                self.lblshopename.text = response.product?.vendor?.company_name
                self.lblsupliretitle.text =  response.product?.vendor?.owners_name
                
                
                
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    @IBAction func btnChatAction(_ sender: UIButton) {
    }
    
    
    @IBAction func btnInquieriesAction(_ sender: UIButton) {
    }
    
    
    @IBAction func addtoCartAction(_ sender: UIButton) {
        addtocartApi()
    }
    
    
    
    func addtocartApi() {
        let dic : [String:Any] = ["product_id":self.productData?.products_id ?? 0]
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
        
            
        self.pager.numberOfPages =  self.productData?.images?.count ?? 0
             return self.productData?.images?.count ?? 0
            
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCLCell", for: indexPath) as? SliderCLCell
        cell?.img.sd_setImage(with: URL(string: self.productData?.images?[indexPath.row].file_path ?? "Text"))
         return cell!
        }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           self.pager.currentPage = indexPath.row
       }
   
}


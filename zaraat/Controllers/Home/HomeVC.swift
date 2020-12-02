//
//  HomeVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SDWebImage
class HomeVC: UIViewController {

    @IBOutlet weak var btnFlash: UIButton!
    var pageIndex: Int = 0
   
    @IBOutlet weak var btnFeatures: UIButton!
    @IBOutlet weak var btnWekkly: UIButton!
    @IBOutlet weak var btntoprated: UIButton!
    
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var sliderClView: UICollectionView!
    
    @IBOutlet weak var FlashClView: UICollectionView!
    @IBOutlet weak var FlashClViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pager: UIPageControl!
    
    
    @IBOutlet weak var topProductClView: UICollectionView!
    @IBOutlet weak var topProductClviewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var adimgOne: UIImageView!
    
    @IBOutlet weak var adimgtwo: UIImageView!
    
    @IBOutlet weak var adimgthree: UIImageView!
    
    
    @IBOutlet weak var FeaturedProductsClView: UICollectionView!
    
    @IBOutlet weak var FeaturdProductClViewHeight: NSLayoutConstraint!
    
    
    
    
    
//    @IBOutlet weak var womenView: UIView!
//
//    @IBOutlet weak var menView: UIView!
//
//    @IBOutlet weak var electronicView: UIView!
//
//    @IBOutlet weak var homeView: UIView!
//
//    @IBOutlet weak var zMartView: UIView!
//
//    @IBOutlet weak var educationView: UIView!
    
    var homeLanding : HomeLandingModel?
   
    
    
    
    
    
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.estimatedRowHeight = 100
            tblView.rowHeight =  UITableView.automaticDimension
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFlash.roundButton()
        btnFeatures.roundButton()
      btnWekkly.roundButton()
         btntoprated.roundButton()
        adimgOne.layer.cornerRadius = 10
         adimgtwo.layer.cornerRadius = 10
         adimgthree.layer.cornerRadius = 10
       //self.tblView.contentInset.bottom = 100
        self.tblView.rowHeight = UITableView.automaticDimension;
//        womenView.viewconfig(radius: 5)
//        menView.viewconfig(radius: 5)
//        electronicView.viewconfig(radius: 5)
//
//         homeView.viewconfig(radius: 5)
//
//         zMartView.viewconfig(radius: 5)
//
//       educationView.viewconfig(radius: 5)
        
        
    
        sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")

        addNavigationButton()
        setUpUI()
        

      tblView.register(UINib.init(nibName: "WeeklySellerCell", bundle: nil), forCellReuseIdentifier: "WeeklySellerCell")
//      tblView.register(UINib.init(nibName: "WeeklyViewAll", bundle: nil), forCellReuseIdentifier: "WeeklyViewAll")
//      tblView.register(UINib.init(nibName: "AddsCell", bundle: nil), forCellReuseIdentifier: "AddsCell")


//        setViewHeight()
         setSlider()
        //homeapi()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "MoreTab"), object: nil)
        
        
    }
    
    
    
    private func setViewHeight(){
           var tableViewHeight:CGFloat = 0;
           for i in 0..<self.tblView.numberOfRows(inSection: 0){
               tableViewHeight = tableViewHeight + tableView(self.tblView, heightForRowAt: IndexPath(row: i, section: 0))
           }
           tblHeight.constant = tableViewHeight + 10
           self.tblView.setNeedsDisplay()
       }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let newHeighttop : CGFloat = topProductClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
             topProductClviewHeight.constant = newHeighttop
        topProductClView.reloadData()
             self.view.setNeedsLayout()
        
        let newHeight : CGFloat = FeaturedProductsClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
        FeaturdProductClViewHeight.constant = newHeight + 100
        FeaturedProductsClView.reloadData()
        self.view.setNeedsLayout()
            // self.view.layoutIfNeeded()
        
    }
    
    
    @objc func showSpinningWheel(_ notification: NSNotification) {
           print(notification.userInfo ?? "")
           if let dict = notification.userInfo as NSDictionary? {
            if let id = dict["Index"]{
                if id as! Int == 0 {
                    self.homeapi()
                }
               }
           }
    }
    
    func setUpUI() {

        
        let logoImage = UIImage.init(named: "Logo")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:0.0,y:10, width:70,height:70)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 70)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 70)
         heightConstraint.isActive = true
         widthConstraint.isActive = true
         navigationItem.leftBarButtonItem =  imageItem

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
                    if ((indexPath?.row)!  < 3 - 1){
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

    
    
    func homeapi() {
        ShareData.showProgress()
        userhandler.getHomeLanding( Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.homeLanding =  response
                
                
                
                if self.homeLanding?.data?.ad_1?.category_image == "" {
                    self.adimgOne.isHidden = true
                } else {
                     self.adimgOne.isHidden = false
                     self.adimgOne.sd_setImage(with: URL(string: self.homeLanding?.data?.ad_1?.category_image ?? "Text"))
                }
                
                if self.homeLanding?.data?.ad_2?.category_image == "" {
                    self.adimgtwo.isHidden = true
                } else {
                     self.adimgtwo.isHidden = false
                     self.adimgtwo.sd_setImage(with: URL(string: self.homeLanding?.data?.ad_2?.category_image ?? "Text"))
                }
                
                if self.homeLanding?.data?.ad_3?.category_image == "" {
                    self.adimgthree.isHidden = true
                } else {
                     self.adimgthree.isHidden = false
                     self.adimgthree.sd_setImage(with: URL(string: self.homeLanding?.data?.ad_3?.category_image ?? "Text"))
                }
               
                 
                
                self.FeaturedProductsClView.reloadData()
                self.topProductClView.reloadData()
                self.FeaturedProductsClView.reloadData()
                self.FlashClView.reloadData()
                self.tblView.reloadData()
                self.setViewHeight()
            } else {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    
    @IBAction func btnflashViewAll(_ sender: UIButton) {
        let sotoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sotoryBoard.instantiateViewController(identifier: "ViewAllProductsVC") as? ViewAllProductsVC
        vc?.viewAll = 1
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    @IBAction func topRatedProducts(_ sender: UIButton) {
        let sotoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sotoryBoard.instantiateViewController(identifier: "ViewAllProductsVC") as? ViewAllProductsVC
        vc?.viewAll = 2
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func WeeklyViewAll(_ sender: UIButton) {
        let sotoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sotoryBoard.instantiateViewController(identifier: "ViewAllProductsVC") as? ViewAllProductsVC
        vc?.viewAll = 3
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func FeatureProducts(_ sender: UIButton) {
        let sotoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sotoryBoard.instantiateViewController(identifier: "ViewAllProductsVC") as? ViewAllProductsVC
        vc?.viewAll = 4
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func ZMallAction(_ sender: UIButton) {
        
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "ZMallVC") as?  ZMallVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func ZMartAction(_ sender: UIButton) {
        
       let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
       let vc =  StoryBoard.instantiateViewController(identifier: "ZMartVC") as?  ZMartVC
       self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func ZPharmacyAction(_ sender: UIButton) {
        
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
            let vc =  StoryBoard.instantiateViewController(identifier: "ZPharmacyVC") as?  ZPharmacyVC
            self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func ZDigitalAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                   let vc =  StoryBoard.instantiateViewController(identifier: "ZDigitalVC") as?  ZDigitalVC
                   self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func FashinBeautyAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                   let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
                     vc?.id = 1
                   self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func ElectroincAction(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        vc?.id = 2
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    @IBAction func HomeLifeStyleAction(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        vc?.id = 3
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    
    
    @IBAction func EducationAction(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        vc?.id = 4
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    
    @IBAction func WatchJewllery(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        vc?.id = 5
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    @IBAction func homeAppliances(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        vc?.id = 6
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
     
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    

   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
               
                
                return 140
           
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return self.homeLanding?.data?.weekly_products?.count ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let cell  = tableView.dequeueReusableCell(withIdentifier: "WeeklySellerCell") as? WeeklySellerCell
            let obj =  self.homeLanding?.data?.weekly_products?[indexPath.row]
            cell?.loadData(obj: obj!)
                return cell!
            
        
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if UIDevice.current.userInterfaceIdiom == .pad {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
            vc?.id = self.homeLanding?.data?.weekly_products?[indexPath.row].products_id ?? 0
                self.navigationController?.pushViewController(vc!, animated: true)

        } else {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
            vc?.id = self.homeLanding?.data?.weekly_products?[indexPath.row].products_id ?? 0
                self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    }

extension HomeVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
//    indexPath: IndexPath) -> CGSize {
//
//    let height = collectionView.frame.height
//    let width = sliderClView.frame.width
//    let size = CGSize(width: width , height: height)
//    return size
//
//
//
//
//}
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
//        if collectionView == sliderClView {
//         return 1
//        } else if collectionView ==  FlashClView {
//            return 1
//        } else if collectionView == topProductClView {
//            return 1
//        } else {
//            return 1
//        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            if collectionView == sliderClView {
             self.pager.numberOfPages =  4
             return 4
            } else if collectionView ==  FlashClView {
                return self.homeLanding?.data?.sales?.count ?? 0
            } else if collectionView == topProductClView {
                return  self.homeLanding?.data?.top_products?.count ?? 0
            } else if collectionView == FeaturedProductsClView{
                return  self.homeLanding?.data?.featured_products?.count ?? 0
            } else {
                return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       if collectionView == sliderClView {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCLCell", for: indexPath) as? SliderCLCell
        
         return cell!
       } else if collectionView ==  FlashClView {
          let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FlashCellClView", for: indexPath) as? FlashCellClView
           let obj = self.homeLanding?.data?.sales![indexPath.row]
           cell?.LoadData(obj: obj!)
           return cell!
        
       } else if collectionView == topProductClView {
           let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "topRatedClView", for: indexPath) as? topRatedClView
        let obj = self.homeLanding?.data?.top_products![indexPath.row]
        cell?.LoadData(obj:obj!)
         cell?.contentView.layoutIfNeeded()
            return cell!
        
       } else {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsClView", for: indexPath) as? FeaturedProductsClView
        let obj = self.homeLanding?.data?.featured_products![indexPath.row]
        cell?.loadData(obj:obj!)
         cell?.contentView.layoutIfNeeded()
                      return cell!
       }
            
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           self.pager.currentPage = indexPath.row
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView ==  FlashClView {
            
            let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                          let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
            vc?.id = self.homeLanding?.data?.sales![indexPath.row].product_id ?? 0
                          self.navigationController?.pushViewController(vc!, animated: true)
            
        } else if collectionView == topProductClView {
            
            let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
              let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
            vc?.id =  self.homeLanding?.data?.top_products?[indexPath.row].products_id ?? 0
              self.navigationController?.pushViewController(vc!, animated: true)
           
        } else if collectionView == FeaturedProductsClView{
            
            let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
              let vc =  StoryBoard.instantiateViewController(identifier: "ProductDetailVC") as?  ProductDetailVC
            vc?.id =  self.homeLanding?.data?.featured_products![indexPath.row].products_id ?? 0
              self.navigationController?.pushViewController(vc!, animated: true)
             
        }
    }
}


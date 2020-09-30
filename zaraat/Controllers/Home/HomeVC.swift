//
//  HomeVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var pageIndex: Int = 0
   
    @IBOutlet weak var sliderClView: UICollectionView!
    
    @IBOutlet weak var pager: UIPageControl!
    
    @IBOutlet weak var womenView: UIView!
    
    @IBOutlet weak var menView: UIView!
    
    @IBOutlet weak var electronicView: UIView!
    
    @IBOutlet weak var homeView: UIView!
    
    @IBOutlet weak var zMartView: UIView!
    
    @IBOutlet weak var educationView: UIView!
    
    
    
    
    
    
    
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            tblView.estimatedRowHeight = 200
            tblView.rowHeight =  UITableView.automaticDimension
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tblView.contentInset.bottom = 100
        womenView.viewconfig(radius: 5)
        menView.viewconfig(radius: 5)
        electronicView.viewconfig(radius: 5)

         homeView.viewconfig(radius: 5)

         zMartView.viewconfig(radius: 5)

       educationView.viewconfig(radius: 5)
        
        
//        if pageIndex == 0 {
//            tblView.isHidden = false
//            print(pageIndex)
//        } else{
//            tblView.isHidden = true
//        }
        
        sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")

        addNavigationButton()
        setUpUI()
        

      tblView.register(UINib.init(nibName: "WeeklySellerCell", bundle: nil), forCellReuseIdentifier: "WeeklySellerCell")
      tblView.register(UINib.init(nibName: "WeeklyViewAll", bundle: nil), forCellReuseIdentifier: "WeeklyViewAll")
      tblView.register(UINib.init(nibName: "AddsCell", bundle: nil), forCellReuseIdentifier: "AddsCell")


        
         setSlider()
        
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
                   self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func ElectroincAction(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    @IBAction func HomeLifeStyleAction(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    
    
    @IBAction func EducationAction(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    
    @IBAction func WatchJewllery(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    @IBAction func homeAppliances(_ sender: UIButton) {
           let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
                      let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
                      self.navigationController?.pushViewController(vc!, animated: true)
       }
    
     
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    

   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
              return  280
            } else if indexPath.section ==  1 {
                let cell =  tableView.dequeueReusableCell(withIdentifier: "topRatedCell") as? topRatedCell
                
                return ((cell?.clView.contentSize.height)! + 40)
            } else if indexPath.section == 2 {
               
                
                return 180
            }  else if indexPath .section == 6 {
                
                let cell =  tableView.dequeueReusableCell(withIdentifier: "FeaturedProductsCell") as? FeaturedProductsCell
                               
                               return ((cell?.clView.contentSize.height)! + 40)
            }else {
                return UITableView.automaticDimension
        }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  section == 4 {
            return 10
        } else {
            return 1
        }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.section == 0 {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "FlashSaleCell") as? FlashSaleCell
        return cell!
        } else if indexPath.section == 1 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "topRatedCell") as? topRatedCell
            return cell!
        } else if indexPath.section == 2 {
             let cell  = tableView.dequeueReusableCell(withIdentifier: "LifeStyleCell") as? LifeStyleCell
              
             return cell!
        } else if indexPath.section == 3 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "WeeklyViewAll") as? WeeklyViewAll
              return cell!
        } else if indexPath.section == 4 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "WeeklySellerCell") as? WeeklySellerCell
                return cell!
        }  else if indexPath.section == 6 {
            
            let cell  = tableView.dequeueReusableCell(withIdentifier: "FeaturedProductsCell") as? FeaturedProductsCell
                 return cell!
        } else {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "AddsCell") as? AddsCell
            return cell!
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        if UIDevice.current.userInterfaceIdiom == .pad {
//
//                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
//                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
//                self.navigationController?.pushViewController(vc!, animated: true)
//
//        } else {
//
//                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
//                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
//                self.navigationController?.pushViewController(vc!, animated: true)
//        }
    }
}

extension HomeVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
    
    let height = collectionView.frame.height
    let width = sliderClView.frame.width
    let size = CGSize(width: width , height: height)
    return size
}
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.pager.numberOfPages =  4
            return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCLCell", for: indexPath) as? SliderCLCell
                  
                   return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           self.pager.currentPage = indexPath.row
       }
    
}


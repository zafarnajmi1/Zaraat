//
//  B2BHomeVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class B2BHomeVC: UIViewController {
    
    
    var pageIndex: Int = 0
       
    @IBOutlet weak var adimg: UIImageView!
    @IBOutlet weak var ChanelClView: UICollectionView!
    @IBOutlet weak var sliderClView: UICollectionView!
        
    @IBOutlet weak var secOneClView: UICollectionView!
    @IBOutlet weak var seconeClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var adimgThree: UIImageView!
    @IBOutlet weak var secthreeClViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var secthreeClView: UICollectionView!
    @IBOutlet weak var adimgtwo: UIImageView!
    @IBOutlet weak var sectwoClViewHeight: NSLayoutConstraint!
    @IBOutlet weak var sectwoClView: UICollectionView!
   var   b2bHomedata : B2bHomeData?
    
        override func viewDidLoad() {
            super.viewDidLoad()

            
            adimg.layer.cornerRadius = 8
             adimgtwo.layer.cornerRadius = 8
             adimgThree.layer.cornerRadius = 8
            
            sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")

            addNavigationButton()
            setUpUI()
            
 NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "B2BMoreTab"), object: nil)
         setSlider()
            
        }
        
    
    @objc func showSpinningWheel(_ notification: NSNotification) {
              print(notification.userInfo ?? "")
              if let dict = notification.userInfo as NSDictionary? {
               if let id = dict["B2BIndex"]{
                   if id as! Int == 0 {
                      b2bhomeapi()
                   }
                  }
              }
       }
    
    
    func b2bhomeapi() {
        ShareData.showProgress()
        userhandler.getB2BHomeLanding( Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.b2bHomedata =  response.data

                self.adimg.sd_setImage(with: URL(string: self.b2bHomedata?.ad_1?.category_image ?? "Text"))
                 self.adimgtwo.sd_setImage(with: URL(string: self.b2bHomedata?.ad_2?.category_image ?? "Text"))
                 self.adimgThree.sd_setImage(with: URL(string: self.b2bHomedata?.ad_3?.category_image ?? "Text"))

                self.ChanelClView.reloadData()
                self.secOneClView.reloadData()
                self.sectwoClView.reloadData()
                self.secthreeClView.reloadData()
                
            } else {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
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

        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            let newHeighttop : CGFloat = secOneClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
                 seconeClViewHeight.constant = newHeighttop
            secOneClView.reloadData()
                 self.view.setNeedsLayout()
            
            let newHeight : CGFloat = sectwoClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
            sectwoClViewHeight.constant = newHeight + 40
            sectwoClView.reloadData()
            self.view.setNeedsLayout()
            
            
            let newHeightThree : CGFloat = secthreeClView.contentSize.height//collectionViewLayout.collectionViewContentSize.height
            secthreeClViewHeight.constant = newHeightThree + 40
            secthreeClView.reloadData()
            self.view.setNeedsLayout()
                // self.view.layoutIfNeeded()
            
        }
    
    
    @IBAction func LiveStockAction(_ sender: UIButton) {
        
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
               let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func SeedsAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func PesticidesAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func IrrigationAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func ColdStorageAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    @IBAction func TunnelFarmingAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func FertilizersAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func Machinery(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func CropsAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func PrintingPackageAction(_ sender: UIButton) {
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  StoryBoard.instantiateViewController(identifier: "HomeButtonsVC") as?  HomeButtonsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    }





//    extension B2BHomeVC : UITableViewDelegate, UITableViewDataSource {
//        
//
//       
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 6
//        }
//        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                if indexPath.section == 0 {
//                  return  280
//                } else if indexPath.section ==  1 {
//                    
//                    let cell =  tableView.dequeueReusableCell(withIdentifier: "ProductsShowcaseCell") as? ProductsShowcaseCell
//                    
//                    return ((cell?.clView.contentSize.height)! + 40)
//                    
//                } else if indexPath.section == 2 {
//                   
//                    return 180
//                }  else if indexPath .section == 3 {
//                    
//                    let cell =  tableView.dequeueReusableCell(withIdentifier: "OneCell") as? OneCell
//                                   
//                                   return ((cell?.clView.contentSize.height)! + 40)
//                    
//                } else if indexPath .section == 5 {
//                    
//                    let cell =  tableView.dequeueReusableCell(withIdentifier: "TwoCell") as? TwoCell
//                    
//                    return ((cell?.clView.contentSize.height)! + 40)
//                    
//                }else {
//                    return UITableView.automaticDimension
//            }
//        }
//        
//
//        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            
//                return 1
//            
//            }
//        
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            if  indexPath.section == 0 {
//            let cell  = tableView.dequeueReusableCell(withIdentifier: "OtherChanelCell") as? OtherChanelCell
//                cell!.delegate = self
//            return cell!
//            } else if indexPath.section == 1 {
//                let cell  = tableView.dequeueReusableCell(withIdentifier: "ProductsShowcaseCell") as? ProductsShowcaseCell
//                cell?.Delegate =  self
//                return cell!
//            } else if indexPath.section == 2 {
//                 let cell  = tableView.dequeueReusableCell(withIdentifier: "LifeStyleCell") as? LifeStyleCell
//                  
//                 return cell!
//            }  else if indexPath.section == 3 {
//                let cell  = tableView.dequeueReusableCell(withIdentifier: "OneCell") as? OneCell
//                cell?.delegate = self
//                    return cell!
//            }  else if indexPath.section == 5 {
//                
//                let cell  = tableView.dequeueReusableCell(withIdentifier: "TwoCell") as? TwoCell
//                cell?.delegate = self
//                     return cell!
//            } else {
//                let cell  = tableView.dequeueReusableCell(withIdentifier: "AddsCell") as? AddsCell
//                return cell!
//            }
//           
//        }
        
        
        
//        private func tableView(tableView: UITableView,willDisplayCell cell: UITableViewCell,forRowAtIndexPath indexPath: NSIndexPath) {
//
//            if indexPath.section == 3 {
//
//                    guard let tableViewCell = cell as? OneCell else { return }
//
//                    tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
//            }
//        }
        
        
        
        
        //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
       // }
    //}

    extension B2BHomeVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
        
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
//        indexPath: IndexPath) -> CGSize {
//
//        let height = collectionView.frame.height
//        let width = sliderClView.frame.width
//        let size = CGSize(width: width , height: height)
//        return size
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
             return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView ==  sliderClView {
            self.pager.numberOfPages =  4
                return 4
        } else if collectionView ==  ChanelClView {
            return 4
        } else if collectionView == secOneClView {
            return 4
        } else if collectionView == sectwoClView {
            return 4
        } else {
            return 4
        }
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView ==  sliderClView {
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCLCell", for: indexPath) as? SliderCLCell
                
                 return cell!
            } else if collectionView ==  ChanelClView {
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClviewOtherChenlsCell", for: indexPath) as? ClviewOtherChenlsCell
                return cell!
                
            } else if collectionView == secOneClView {
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClViewProductsShowcase", for: indexPath) as? ClViewProductsShowcase
                return cell!
                
            } else if collectionView == sectwoClView {
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "clViewOneCell", for: indexPath) as? clViewOneCell
                   return cell!
            } else {
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClViewTwoCell", for: indexPath) as? ClViewTwoCell
                return cell!
            }
            
           
                
            
        }
        
        
        
        
        
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
               self.pager.currentPage = indexPath.row
           }

    

}

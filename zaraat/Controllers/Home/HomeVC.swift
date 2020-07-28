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
    //@IBOutlet weak var btncart: UIButton!
    @IBOutlet weak var sliderClView: UICollectionView!
    
    //@IBOutlet weak var tabClView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!{
        didSet{
            tblView.estimatedRowHeight = 200
            tblView.rowHeight =  UITableView.automaticDimension
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if pageIndex == 0 {
            tblView.isHidden = false
        } else{
            tblView.isHidden = true
        }
        //tabClView.register(UINib.init(nibName: "TablCLViewCell", bundle: nil), forCellWithReuseIdentifier: "TablCLViewCell")
        sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationItem.hidesBackButton = true
        addNavigationButton()
        setUpUI()
        navigationController?.navigationBar.shadowImage = UIImage()

        tblView.register(UINib.init(nibName: "CropsCell", bundle: nil), forCellReuseIdentifier: "CropsCell")
         tblView.register(UINib.init(nibName: "LiveStockCell", bundle: nil), forCellReuseIdentifier: "LiveStockCell")
        tblView.register(UINib.init(nibName: "GeneralItemsCell", bundle: nil), forCellReuseIdentifier: "GeneralItemsCell")
        tblView.register(UINib.init(nibName: "FeatueredBidingCell", bundle: nil), forCellReuseIdentifier: "FeatueredBidingCell")
        tblView.register(UINib.init(nibName: "HotBidingCell", bundle: nil), forCellReuseIdentifier: "HotBidingCell")
         tblView.register(UINib.init(nibName: "LatestProductsCell", bundle: nil), forCellReuseIdentifier: "LatestProductsCell")
         tblView.register(UINib.init(nibName: "LatestProductListCell", bundle: nil), forCellReuseIdentifier: "LatestProductListCell")
        tblView.register(UINib.init(nibName: "HotDealCell", bundle: nil), forCellReuseIdentifier: "HotDealCell")
        tblView.register(UINib.init(nibName: "VideosAllCell", bundle: nil), forCellReuseIdentifier: "VideosAllCell")
        
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

    
    
    
    
    
     
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
//    private func tableView(tableView: UITableView,willDisplayCell cell: UITableViewCell,forRowAtIndexPath indexPath: NSIndexPath) {
//
//        guard let tableViewCell = cell as? VideosAllCell else { return }
//
//        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
//    }
    //LatestProductsCell
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            if indexPath.section == 9 {
                


                if let cell = tableView.dequeueReusableCell(withIdentifier: "VideosAllCell") as? VideosAllCell {

                       

                        if UIDevice.current.userInterfaceIdiom == .pad{
    
                            return cell.allCLView.collectionViewLayout.collectionViewContentSize.height - 2100
                        }else {
                            return cell.allCLView.collectionViewLayout.collectionViewContentSize.height + 120
                        }


                } else {
                   return 280
                }
                } else{

                   return UITableView.automaticDimension
                }
            
               }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 6 {
              return 4
        } else if section == 7 {
              return 3
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  indexPath.section == 0 {
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "CropsCell") as? CropsCell
            return cell!
            
        }else if indexPath.section == 1{
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "FeatueredBidingCell") as? FeatueredBidingCell
                   return cell!
            
        } else if indexPath.section == 2{
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "LiveStockCell") as? LiveStockCell
                   return cell!
            
        } else if indexPath.section == 3 {
                   
               let cell =  tableView.dequeueReusableCell(withIdentifier: "GeneralItemsCell") as? GeneralItemsCell
               return cell!
            
        }else if indexPath.section == 4{
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "HotBidingCell") as? HotBidingCell
            return cell!
            
        } else if indexPath.section == 5{
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "LatestProductsCell") as? LatestProductsCell
            return cell!
        } else if indexPath.section == 6 {
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "LatestProductListCell") as? LatestProductListCell
            return cell!
        } else if indexPath.section == 7{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "HotDealCell") as? HotDealCell
            return cell!
        } else if indexPath.section == 8{
           
            let cell =  tableView.dequeueReusableCell(withIdentifier: "LatestProductsCell") as? LatestProductsCell
                    
            cell?.lbltitle.text = "All Products & Videos"
            cell?.lblsubtitle.text = "View All Products And Videos"
             return cell!
        }
        else {
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "VideosAllCell") as? VideosAllCell
                       
            cell?.setUpCell()
             return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if UIDevice.current.userInterfaceIdiom == .pad {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
                self.navigationController?.pushViewController(vc!, animated: true)

        } else {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
                self.navigationController?.pushViewController(vc!, animated: true)
        }
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
        
            return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCLCell", for: indexPath) as? SliderCLCell
                  
                   return cell!
        
    }
    
}


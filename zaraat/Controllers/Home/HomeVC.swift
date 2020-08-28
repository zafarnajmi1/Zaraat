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
        
        womenView.viewconfig(radius: 5)
        menView.viewconfig(radius: 5)
        electronicView.viewconfig(radius: 5)

         homeView.viewconfig(radius: 5)

         zMartView.viewconfig(radius: 5)

       educationView.viewconfig(radius: 5)
        
        
        if pageIndex == 0 {
            tblView.isHidden = false
            print(pageIndex)
        } else{
            tblView.isHidden = true
        }
        
        sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")

        addNavigationButton()
        setUpUI()
        

       // tblView.register(UINib.init(nibName: "FlashSaleCell", bundle: nil), forCellReuseIdentifier: "FlashSaleCell")
     //tblView.register(UINib.init(nibName: "topRatedCell", bundle: nil), forCellReuseIdentifier: "topRatedCell")


        
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
    

   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
        return  280
        } else {
                let cell =  tableView.dequeueReusableCell(withIdentifier: "topRatedCell") as? topRatedCell
                
                return ((cell?.clView.contentSize.height)! + 150) 
        }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return 1
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.section == 0 {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "FlashSaleCell") as? FlashSaleCell
        return cell!
        } else {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "topRatedCell") as? topRatedCell
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


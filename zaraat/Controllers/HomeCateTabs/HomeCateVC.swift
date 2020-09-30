//
//  HomeCateVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/30/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class HomeCateVC: UIViewController {


              
                 @IBOutlet weak var sliderClView: UICollectionView!
                  @IBOutlet weak var pager: UIPageControl!
              
                 @IBOutlet weak var tblView: UITableView! {
                     didSet {
                         tblView.estimatedRowHeight = 200
                         tblView.rowHeight =  UITableView.automaticDimension
                         
                     }
                 }
                 
              
              override func viewDidLoad() {
                  super.viewDidLoad()
               
                  
                  let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))

                       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
                       imageView.contentMode = .scaleAspectFit
                       let image = UIImage(named: "Zaraat Mall")
                       imageView.image = image
                       logoContainer.addSubview(imageView)
                       navigationItem.titleView = logoContainer
                  
                  
                  
               
                   sliderClView.register(UINib.init(nibName: "SliderCLCell", bundle: nil), forCellWithReuseIdentifier: "SliderCLCell")
                  addBackButton()
                  setNavigationBarWhiteColor()
                  setSlider()
              }
              
             
              
                 func setSlider(){
                         
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
          extension HomeCateVC :   UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

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


       extension HomeCateVC :  UITableViewDelegate, UITableViewDataSource {
           func numberOfSections(in tableView: UITableView) -> Int {
               return 4
           }
           
           
           func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               if indexPath.section == 1 {
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCatePartTwoCell") as? HomeCatePartTwoCell
                   return (cell?.ClView.contentSize.height)! + 1500
               } else if indexPath.section == 3 {
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCatePartThreeCell") as? HomeCatePartThreeCell
                   return (cell?.ClView.contentSize.height)! + 1500
               }else  {
                    return UITableView.automaticDimension
               }
           }
           
           
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 1
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               if indexPath.section == 0 {
               let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCatePartOneCell") as? HomeCatePartOneCell
               return cell!
               } else if indexPath.section == 1 {
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCatePartTwoCell") as? HomeCatePartTwoCell
                          return cell!
               } else if indexPath.section == 2 {
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCateAdsCell") as? HomeCateAdsCell
                   return cell!
               } else {
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "HomeCatePartThreeCell") as? HomeCatePartThreeCell
                   return cell!
               }
           }
           
           
       }
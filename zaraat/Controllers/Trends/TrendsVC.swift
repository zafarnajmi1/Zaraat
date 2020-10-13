//
//  TrendsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class TrendsVC: UIViewController {
      @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var trendClView: UICollectionView!
    @IBOutlet weak var tblView: UITableView! {
                         didSet {
                             tblView.estimatedRowHeight = 200
                             tblView.rowHeight =  UITableView.automaticDimension
                             
                         }
                     }
                     
                  
                  override func viewDidLoad() {
                      super.viewDidLoad()
                     searchView.roundView()
                      
                      self.navigationItem.title = "Trends"
                      
                      
                      
                   
                      
                      
                      setNavigationBarWhiteColor()
                     
                  }
                  
                 
}
                     
           extension TrendsVC :  UITableViewDelegate, UITableViewDataSource {
               func numberOfSections(in tableView: UITableView) -> Int {
                   return 3
               }
               
               
               func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                   if indexPath.section == 0 {
                       let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartOneCell") as? TrendsPartOneCell
                       return (cell?.ClView.contentSize.height)! + 1500
                   } else if indexPath.section == 2 {
                       let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartThreeCell") as? TrendsPartThreeCell
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
                   let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartOneCell") as? TrendsPartOneCell
                   return cell!
                   } else if indexPath.section == 1 {
                       let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsAdsCell") as? TrendsAdsCell
                              return cell!
                    
                   } else  {
                    
                       let cell =  tableView.dequeueReusableCell(withIdentifier: "TrendsPartThreeCell") as? TrendsPartThreeCell
                       return cell!
                   }
               }
               
               
           }

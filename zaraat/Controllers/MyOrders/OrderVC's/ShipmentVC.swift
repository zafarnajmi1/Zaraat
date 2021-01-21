//
//  ShipmentVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/16/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
import  DZNEmptyDataSet
class ShipmentVC: UIViewController, IndicatorInfoProvider  {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Processing")
    }
    
    
    fileprivate func setupDelegates(){
           self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
           self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
           self.tblView.tableFooterView = UIView()
           self.tblView.reloadData()
       }
    
  var progressData : InprogressModel?
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
                self.tblView.register(UINib.init(nibName: "InprogressCell", bundle: nil), forCellReuseIdentifier: "InprogressCell")
            }
            
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           getInprogressDataApi()
       }
           
            
            func getInprogressDataApi() {
                ShareData.showProgress()
                userhandler.getInprogressOrders(Success: {response in
                    ShareData.hideProgress()
                    if response.success == 1 {
                        self.progressData =  response
                        if self.progressData?.orders?.count == 0 {
                           self.setupDelegates()
                        }
                        self.tblView.reloadData()
                    } else {
                        ShareData.hideProgress()
                        ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
                    }
                    
                }, Failure: {error in
                    ShareData.hideProgress()
                    ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
                })
            }

        }
        extension ShipmentVC : UITableViewDelegate, UITableViewDataSource {
            func numberOfSections(in tableView: UITableView) -> Int {
                return 1
            }
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return self.progressData?.orders?.count ?? 0
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
                if self.progressData?.orders?[indexPath.row].status == "processing" {
                let cell =  tableView.dequeueReusableCell(withIdentifier: "InprogressCell") as? InprogressCell
                cell?.lblprice.text = "Total Price :" + (self.progressData?.orders?[indexPath.row].total_price)!
                cell?.lblorderDate.text =  "Order Date :" + (self.progressData?.orders?[indexPath.row].order_date!)!
                cell?.lblorderNo.text =  " Order Number : \(self.progressData?.orders?[indexPath.row].order_id ?? 0)"
                cell?.lblstatus.text = "Status :" + (self.progressData?.orders?[indexPath.row].status)!
                return  cell!
                } else {
                    
                    return UITableViewCell()
                }
            }
            
            
        }
extension ShipmentVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Sorry there is no data available"
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Try Again!"
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5818647146, green: 0.8263530135, blue: 0.2647219598, alpha: 1)
            ] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
       
        
       
            
            self.getInprogressDataApi()
            
            
            
    }
    
    
    
    
}

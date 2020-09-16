//
//  RevievedVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/16/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class RevievedVC: UIViewController ,IndicatorInfoProvider  {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Recieved")
    }
    

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tblView.register(UINib.init(nibName: "InprogressCell", bundle: nil), forCellReuseIdentifier: "InprogressCell")
    }
    

   

}
extension RevievedVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "InprogressCell") as? InprogressCell
        return cell!
    }
    
    
}

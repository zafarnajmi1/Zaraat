//
//  MyinquiresVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class MyinquiresVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var inquiresdata :  GetInguiresModel?
    override func viewDidLoad() {
        super.viewDidLoad()
         addBackButton()
        setNavigationBarWhiteColor()
        self.title = "My Inquires"
        self.tblView.register(UINib.init(nibName: "MyinquiresCell", bundle: nil), forCellReuseIdentifier: "MyinquiresCell")
        getMyinquiresApi()
    }
    

    func getMyinquiresApi() {
        ShareData.showProgress()
        userhandler.getMyinquires(Success: {response in
            ShareData.hideProgress()
            if response.success == 1{
                self.inquiresdata =  response
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
extension MyinquiresVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inquiresdata?.enquiries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyinquiresCell") as? MyinquiresCell
        cell?.lblto.text =  "To :" + (self.inquiresdata?.enquiries![indexPath.row].owners_name)!
        cell?.lbldate.text = " Inquiry Date :" + (self.inquiresdata?.enquiries![indexPath.row].updated_at)!
        cell?.lbltitle.text = self.inquiresdata?.enquiries![indexPath.row].message
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(identifier: "InquiresViewVC") as? InquiresViewVC
        vc?.quiresData = self.inquiresdata?.enquiries![indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
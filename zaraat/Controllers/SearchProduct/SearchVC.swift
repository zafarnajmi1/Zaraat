//
//  SearchVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
  var keyword = ""
    @IBOutlet weak var clView: UICollectionView!
    var searchData : SearchProductModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        setNavigationBarWhiteColor()
        self.title = "Searched Product"
         searchProductApi()
    }
    
    
    func searchProductApi() {
        let dic : [String:Any] = ["search_text":keyword ]
        ShareData.showProgress()
        userhandler.Searchproduct(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.searchData =  response
                self.clView.reloadData()
            } else {
                ShareData.showProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.showProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
    }
    

}
extension SearchVC :  UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchData?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "HomeButtonClViewPartOneCell", for: indexPath) as? HomeButtonClViewPartOneCell
        cell?.lbltitl.text = self.searchData?.products![indexPath.row].product_title_en
        cell?.lblprice.text =  "PKR :" + (self.searchData?.products![indexPath.row].selling_price)!
        cell?.lblstock.text = "(InStock) :" + (self.searchData?.products![indexPath.row].product_stock)!
          cell?.img.sd_setImage(with: URL(string: self.searchData?.products![indexPath.row].featured_image ?? "Text"))
                return cell!
    }
    
    
}

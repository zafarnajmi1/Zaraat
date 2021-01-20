//
//  SearchVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var mainView: UIView!
    var keyword = ""
    @IBOutlet weak var txtsearch: UITextField!
    @IBOutlet weak var clView: UICollectionView!
    var searchData : SearchProductModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.roundView()
        addBackButton()
        setNavigationBarWhiteColor()
        self.title = "Searched Product"
         //searchProductApi()
    }
    
    @IBAction func btnSearcAction(_ sender: UIButton) {
        if txtsearch.text != ""{
            searchProductApi()
        }
    }
    
    func searchProductApi() {
        let dic : [String:Any] = ["search_text":txtsearch.text! ]
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        let StoryBoard =  UIStoryboard.init(name: "Main", bundle: nil)
         let vc =  StoryBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as?  ProductDetailVC
        vc?.id =   self.searchData?.products![indexPath.row].products_id ?? 0
         self.navigationController?.pushViewController(vc!, animated: true)
    }
}

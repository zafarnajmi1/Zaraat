//
//  ProductListsVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ProductListsVC: UIViewController {

    @IBOutlet weak var ClView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    var isGride = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackButton()
        setNavigationBarWhiteColor()
        self.title = "Products List"
        tblView.register(UINib.init(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        setnavigationButton()
    }
    

    
    func setnavigationButton(){
        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        if isGride == false {
        btn1.setBackgroundImage(UIImage(named: "Grid"), for: .normal)
        } else {
            btn1.setBackgroundImage(UIImage(named: "Single"), for: .normal)
        }
        btn1.addTarget(self, action: #selector(GridView), for: .touchUpInside)
        let btnmsg = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButtonItems([btnmsg], animated: true)
    }
    @objc func GridView(){
        if isGride == false {
            setnavigationButton()
            isGride = true
            
            self.tblView.isHidden = true
            self.ClView.isHidden =  false
            self.ClView.reloadData()
        } else {
             setnavigationButton()
            isGride = false
           
            self.tblView.isHidden = false
            self.ClView.isHidden =  true
            self.tblView.reloadData()
        }
    }

}
extension ProductListsVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell")as? ProductListCell
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "ProductDetailVC") as? ProductDetailVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


extension ProductListsVC :  UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ClViewCell", for: indexPath) as? ClViewCell
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
               let vc =  storyBoard.instantiateViewController(identifier: "ProductDetailVC") as? ProductDetailVC
               
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: (self.ClView.frame.width/3.0) - 5 , height: (self.ClView.frame.height/4.0))
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return  2
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return  2
//    }
}

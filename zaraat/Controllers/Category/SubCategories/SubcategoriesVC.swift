//
//  SubcategoriesVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/4/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class SubcategoriesVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var clView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
   addBackButton()
       setNavigationBar()
        self.title = "Sub Categories"
        self.clView.register(UINib.init(nibName: "SubcateGoriesCell", bundle: nil), forCellWithReuseIdentifier: "SubcateGoriesCell")
        self.tblView.register(UINib.init(nibName: "SubCateCellTb", bundle: nil), forCellReuseIdentifier: "SubCateCellTb")
    }
    
     

    

}
extension SubcategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SubCateCellTb") as? SubCateCellTb
        return cell!
    }
    
    
}

extension SubcategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SubcateGoriesCell", for: indexPath) as? SubcateGoriesCell
        return cell!
    }
    
    
}

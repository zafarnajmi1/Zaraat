//
//  testMallVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class testMallVC: UIViewController {

    @IBOutlet weak var ClView: UICollectionView!
    @IBOutlet weak var clHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        //config()
    }
    func config() {
       ClView.reloadData()
        clHeight.constant = clHeight.constant +  self.ClView.contentSize.height + 100
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        config()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        config()
         
        self.view.layoutIfNeeded()
    }
    
    

}
extension testMallVC  : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "testClView", for: indexPath) as? testClView
        //clHeight.constant = CGFloat((cell?.frame.height)!) +  50
        return cell!
    }
    
    
}

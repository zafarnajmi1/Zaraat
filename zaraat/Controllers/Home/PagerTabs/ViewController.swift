//
//  ViewController.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit
import  BadgeHub

class ViewController: UIViewController {
    var notificationBadge : BadgeHub?
   
    @IBOutlet weak var businessView: UIView!
    //@IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var menuBarView: MenuTabsView!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var txtsearch: UITextField!
    
    
    var currentIndex: Int = 0
    var tabs = ["ALL","Agriculture","Consumer Electronics","Apparel","Vehicles","Sports"]
    var pageController: UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Text")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
        
        
        
        menuBarView.dataArray = tabs
        menuBarView.isSizeToFitCellsNeeded = true
        //menuBarView.collView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)//UIColor.init(white: 0.97, alpha: 0.97)
        
        presentPageVCOnView()
        
        menuBarView.menuDelegate = self
        pageController.delegate = self
        pageController.dataSource = self
        
        //For Intial Display
        menuBarView.collView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
        
        // With CallBack Function...
        //menuBarView.menuDidSelected = myLocalFunc(_:_:)
         setSearchBar()
        cartButton()
        businessView.roundView()
        addNavigationButton()
       // addMenuButton()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//              super.viewWillAppear(animated)
//              setNavigationBarWhiteColor()
//        
//          }
    
//    func addMenuButton()
//           {
//               let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//               btn1.setBackgroundImage(UIImage(named: "menu"), for: .normal)
//
//               btn1.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
//               let btnmsg = UIBarButtonItem(customView: btn1)
//
//
//
//    //        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//    //        btn2.setBackgroundImage(UIImage(named: "SignIn"), for: .normal)
//    //
//    //        btn2.addTarget(self, action: #selector(btnLoginClick(_:)), for: .touchUpInside)
//    //        let btnLogin = UIBarButtonItem(customView: btn2)
//            self.navigationItem.setLeftBarButtonItems([btnmsg], animated: true)
//
//
//           }
//      @objc func btnClick (_ sender: Any){
//              let manager = ZSideMenuManager(isRTL: AppLanguage.shared.isRTL)
//              manager.openSideMenu(vc: self)
//            print("From Naviagtion ")
//    //               let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    //               let vc =  storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
//    //               self.navigationController?.pushViewController(vc, animated: true)
//
//
//           }
        
   
    
    
    func cartButton() {
//            let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//            let notification = UIImage(named: "notifi")
//            imageView.image = notification
//            view.addSubview(imageView)
//
//            btncart.setImage(UIImage(named: "Cart"), for: .normal)
//            btncart.addTarget(self, action: #selector(moveToCart), for: .touchUpInside)
//            notificationBadge = BadgeHub(view: btncart)
//
//            notificationBadge?.scaleCircleSize(by: 0.65)
//            notificationBadge?.setCircleColor(#colorLiteral(red: 0.9994444251, green: 0.09782101959, blue: 0.1073825285, alpha: 1), label: nil)
//
//           notificationBadge?.moveCircleBy(x: -5, y: 5)
//            notificationBadge?.setCount(1)
//        notificationBadge?.setCountLabel(UIFont.init(name: "Poppins-Regular", size: 12))
//            let backTap = UITapGestureRecognizer(target: self, action: #selector(moveToNotification))
//            view.addGestureRecognizer(backTap)
//
//            let rightBarButtonItem = UIBarButtonItem(customView: view)
            
        }
    @objc func moveToCart () {
        if UIDevice.current.userInterfaceIdiom == .pad {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "CartVC") as? CartVC
                self.navigationController?.pushViewController(vc!, animated: true)

        } else {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "CartVC") as? CartVC
                self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
    @IBAction func BtwoBAction(_ sender: UIButton) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "B2BViewController") as? B2BViewController
        self.navigationController?.pushViewController(vc!, animated: true )
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func setSearchBar(){
        
        txtsearch.placeholder = "Search"
        txtsearch.backgroundColor = .clear
        self.searchView.layer.cornerRadius =  searchView.layer.frame.height / 2
        self.searchView.layer.borderWidth = 0.8
        self.searchView.layer.borderColor = #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
        
        
        
//        searchBar.backgroundColor =  .clear
//
//       self.searchBar.layer.borderWidth = 1;
//        self.searchBar.layer.borderColor = #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
//        self.searchBar.layer.cornerRadius = self.searchBar.layer.frame.height / 2
//        self.searchBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//        self.searchBar.clipsToBounds  = true
//         let searchTextField = searchBar.searchTextField
//
//                searchTextField.placeholder = "Search"
//               let imageView = UIImageView()
//               imageView.image =  UIImage.init(named: "Home")
//               searchTextField.rightView = imageView
//               searchTextField.rightViewMode = UITextField.ViewMode.always
    }
    
    
    
//    private var isFirst = true
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        guard isFirst else {
//        return
//        }
//        isFirst = false
//        setupSearchTextField()
//    }
//
//    private func setupSearchTextField() {
//
//        //searchBar.backgroundColor =  .clear
//        self.searchBar.searchBarStyle = .default
//        self.searchBar.layer.borderWidth = 1;
//         self.searchBar.layer.borderColor = #colorLiteral(red: 0.8628344536, green: 0.8547772765, blue: 0.8628706932, alpha: 1)
//         self.searchBar.layer.cornerRadius = self.searchBar.layer.frame.height / 2
//         self.searchBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//         self.searchBar.clipsToBounds  = true
//        let searchTextField = searchBar.searchTextField
//        searchTextField.backgroundColor = .clear
//        //searchTextField.layer.borderColor = UIColor(named: "707070")?.cgColor
//
//        searchTextField.placeholder = "Search"
//        let imageView = UIImageView()
//        imageView.image =  UIImage.init(named: "Home")
//        searchTextField.rightView = imageView
//        searchTextField.rightViewMode = UITextField.ViewMode.always
//        //delegate
////        //searchBar.delegate = self as! UISearchBarDelegate
//    }
    
    
    
    
    /*
     // Call back function
    func myLocalFunc(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
        
        
        if indexPath.item != currentIndex {
            
            if indexPath.item > currentIndex {
                self.pageController.setViewControllers([viewController(At: indexPath.item)!], direction: .forward, animated: true, completion: nil)
            }else {
                self.pageController.setViewControllers([viewController(At: indexPath.item)!], direction: .reverse, animated: true, completion: nil)
            }
            
            menuBarView.collView.scrollToItem(at: IndexPath.init(item: indexPath.item, section: 0), at: .centeredHorizontally, animated: true)
            
        }
        
    }
     */
 
    func presentPageVCOnView() {
        
        self.pageController = storyboard?.instantiateViewController(withIdentifier: "PageControllerVC") as! PageControllerVC
        if UIDevice.current.userInterfaceIdiom == .pad {
          self.pageController.view.frame = CGRect.init(x: 0, y: menuBarView.frame.maxY + 30 , width: self.view.frame.width, height: self.view.frame.height - menuBarView.frame.maxY)
        } else {
            
             self.pageController.view.frame = CGRect.init(x: 0, y: menuBarView.frame.maxY + 10 , width: self.view.frame.width, height: self.view.frame.height - menuBarView.frame.maxY)
        }
        self.addChild(self.pageController)
        self.view.addSubview(self.pageController.view)
        self.pageController.didMove(toParent: self)
        
    }
    
    //Present ViewController At The Given Index
    
    func viewController(At index: Int) -> UIViewController? {
        
        if((self.menuBarView.dataArray.count == 0) || (index >= self.menuBarView.dataArray.count)) {
            return nil
        }
        if index == 0 {
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        contentVC.strTitle = tabs[index]
           // contentVC.tblView.isHidden = false
        contentVC.pageIndex = index
        currentIndex = index
        return contentVC
        } else {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "HomeCateVC") as! HomeCateVC
            //        contentVC.strTitle = tabs[index]
                    //contentVC.pageIndex = index
               //contentVC.tblView.isHidden = true
                    currentIndex = index
                    return contentVC
        }
    }
    
}





extension ViewController: MenuBarDelegate {

    func menuBarDidSelectItemAt(menu: MenuTabsView, index: Int) {

        // If selected Index is other than Selected one, by comparing with current index, page controller goes either forward or backward.
        
        if index != currentIndex {

            if index > currentIndex {
                self.pageController.setViewControllers([viewController(At: index)!], direction: .forward, animated: true, completion: nil)
            }else {
                self.pageController.setViewControllers([viewController(At: index)!], direction: .reverse, animated: true, completion: nil)
            }

            menuBarView.collView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)

        }

    }

}


extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! HomeVC).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewController(At: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! HomeVC).pageIndex
        
        if (index == tabs.count) || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewController(At: index)
        
    }
   
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                let cvc = pageViewController.viewControllers!.first as! HomeVC
                let newIndex = cvc.pageIndex
                menuBarView.collView.selectItem(at: IndexPath.init(item: newIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
                menuBarView.collView.scrollToItem(at: IndexPath.init(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        
    }
    
}

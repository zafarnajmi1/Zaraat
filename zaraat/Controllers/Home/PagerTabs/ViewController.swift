//
//  ViewController.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit
import  BadgeHub
var searchText = ""
@available(iOS 13.0, *)
class ViewController: UIViewController {
    var notificationBadge : BadgeHub?
    @IBOutlet weak var menuBarView: MenuTabsView!
    
    @IBOutlet weak var b2bView: UIView!
    
    @IBOutlet weak var txtSearchData: UITextField!
    //@IBOutlet weak var txtsearch: UITextField!
    @IBOutlet weak var searchView: UIView!
    
    var currentIndex: Int = 0
    var tabs = [String]()
    var pageController: UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        b2bView.roundView()
        searchView.roundView()
        ShareData.shareInfo.unseenCart =  ShareData.shareInfo.count ?? 0
       
        //addNavigationButton()
         addNavigation()
        NotificationCenter.default.addObserver(self, selector: #selector(self.CartConfig(_:)), name: NSNotification.Name(rawValue: "CartCount"), object: nil)
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))

                           let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
                           imageView.contentMode = .scaleAspectFit
                           let image = UIImage(named: "Text")
                           imageView.image = image
                           logoContainer.addSubview(imageView)
                           navigationItem.titleView = logoContainer
        
        txtSearchData.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
         
        
        
       
        
        
        // With CallBack Function...
        //menuBarView.menuDidSelected = myLocalFunc(_:_:)

    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        searchText =  self.txtSearchData.text ?? ""
        print("Text changed")

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //presentPageVCOnView()
////        self.pageController.view.frame = CGRect.init(x: 0, y: menuBarView.frame.maxY + 10 , width: self.view.frame.width, height: self.view.frame.height - menuBarView.frame.maxY)
//    }
    
    
    override func viewDidLayoutSubviews() {
        self.tabs.removeAll()
        presentPageVCOnView()
        
        for item in ShareData.shareInfo.EcommerceCate?.categories ?? []{
             self.tabs.append(item.category_title_en ?? "")
         }
        
         self.tabs.insert("ALL", at: 0)
         menuBarView.dataArray =  tabs
         menuBarView.isSizeToFitCellsNeeded = true
         menuBarView.collView.backgroundColor = UIColor.init(white: 0.97, alpha: 0.97)
         
         
         pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
        
               menuBarView.menuDelegate = self
               pageController.delegate = self
               pageController.dataSource = self
               
               //For Intial Display
               menuBarView.collView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
    }
    
    @objc func CartConfig(_ notification: NSNotification) {
           
        
        notificationBadge?.setCount(ShareData.shareInfo.unseenCart)
    }
    
    
    func addNavigation()
       {
        
        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn2.setBackgroundImage(UIImage(named: "filter"), for: .normal)
        
        btn2.addTarget(self, action: #selector(btnFilterClick(_:)), for: .touchUpInside)
        let btnfilter = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.setRightBarButtonItems([cartCountnButton(),btnfilter], animated: true)
        
           
       }
    
    
    func cartCountnButton() -> UIBarButtonItem{
        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                btn1.setBackgroundImage(UIImage(named: "cart"), for: .normal)
                
                btn1.addTarget(self, action: #selector(btnCartClick(_:)), for: .touchUpInside)
                
                
              
                  notificationBadge = BadgeHub(view: btn1)

                 notificationBadge?.scaleCircleSize(by: 0.60)
                 notificationBadge?.setCircleColor(#colorLiteral(red: 0.9905504584, green: 0.7299582362, blue: 0.007647278253, alpha: 1), label: nil)

                notificationBadge?.moveCircleBy(x: -1, y: -4)
             
             notificationBadge?.setCount(ShareData.shareInfo.unseenCart)
                 notificationBadge?.setCountLabel(UIFont.init(name: "Poppins-Regular", size: 12))
              return  UIBarButtonItem(customView: btn1)
    }
    
    
    
    @objc func btnCartAction (_ sender: Any){
        
           let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
           let vc =  storyBoard.instantiateViewController(withIdentifier: "CartVC") as? CartVC
           vc?.hidesBottomBarWhenPushed = true
           self.navigationController?.pushViewController(vc!, animated: true)
       }
    
    
    @objc func btnFilterAction (_ sender: Any){
        
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "FilterVC") as? FilterVC
        vc?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
     
    
    @IBAction func searchAction(_ sender: UIButton) {
        
        //if txtSearchData.text != "" {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        //vc!.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(vc!, animated: true)
//        present(vc!, animated: true, completion: nil)
//        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc =  storyBoard.instantiateViewController(identifier: "SearchVC") as? SearchVC
//         vc?.hidesBottomBarWhenPushed = true
//        vc?.keyword =  self.txtSearchData.text!
//
//        self.navigationController?.pushViewController(vc!, animated: true)
        //}
    }
    
    
    
    
    
    
    
    
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

    } */
     
    
    
    @IBAction func b2bAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "B2BViewController") as? B2BViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func presentPageVCOnView() {
       // - menuBarView.frame.maxY
        self.pageController = storyboard?.instantiateViewController(withIdentifier: "PageControllerVC") as! PageControllerVC
        self.pageController.view.frame = CGRect.init(x: 0, y: menuBarView.frame.maxY + 10 , width: self.view.frame.width, height: self.view.frame.height)
        self.addChild(self.pageController)
        self.view.addSubview(self.pageController.view)
        self.pageController.didMove(toParent: self)
        
    }
    
    //Present ViewController At The Given Index
    
    func viewController(At index: Int) -> UIViewController? {
        
        if((self.menuBarView.dataArray.count == 0) || (index >= self.menuBarView.dataArray.count)) {
            return nil
        }
        
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "HomeContainerVC") as! HomeContainerVC
        
        contentVC.pageIndex = index
        currentIndex = index
        return contentVC
        
    }
    
}





@available(iOS 13.0, *)
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


@available(iOS 13.0, *)
extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! HomeContainerVC).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewController(At: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! HomeContainerVC).pageIndex
        
        if (index == tabs.count) || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewController(At: index)
        
    }
   
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                let cvc = pageViewController.viewControllers!.first as! HomeContainerVC
                let newIndex = cvc.pageIndex
                menuBarView.collView.selectItem(at: IndexPath.init(item: newIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
                menuBarView.collView.scrollToItem(at: IndexPath.init(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        
    }
    
}

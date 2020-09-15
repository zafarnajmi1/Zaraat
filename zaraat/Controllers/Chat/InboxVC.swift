//
//  InboxVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/5/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class InboxVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title =  "Chat"
        self.tblView.register(UINib.init(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarWhiteColor()
    }
  

}

extension InboxVC :  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ChatCell") as? ChatCell
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(identifier: "ChatVC") as? ChatVC
        vc?.hidesBottomBarWhenPushed =  true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.deleteData(at: indexPath)
        }
            deleteAction.image = UIImage.init(named: "delete (2)")
            deleteAction.title = "Delete"
        let editAction = UIContextualAction(style: .normal, title: "More") {  (contextualAction, view, boolValue) in
            
            self.editData(at: indexPath)
        }
        editAction.backgroundColor = .purple
        editAction.image =  UIImage.init(named: "More")
        editAction.title = "More"
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction,editAction])

        return swipeActions
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func deleteData(at indexPath: IndexPath) {
        print(indexPath.row)
    }

    func editData(at indexPath: IndexPath) {
        print(indexPath.row)
    }

}

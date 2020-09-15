//
//  ChatVC.swift
//  CarInsurance
//
//  Created by apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


class ChatVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var txtMsg: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Live Chat"
         addBackButton()
        setNavigationBarWhiteColor()
        setupView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.txtMsg.placeholder = "Write message..."
        sendBtn.setTitle("Send", for: .normal)
        
        
    }
    
    func setupView()  {
        
        
        txtMsg.delegate = self
        IQKeyboardManager.shared.enableAutoToolbar = false
        tableView.keyboardDismissMode = .onDrag // .interactive
        navigationController?.hidesBarsWhenKeyboardAppears = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
        
        tableView.transform = CGAffineTransform (scaleX: 1,y: -1)
        
       
        
        
        
    }
    
  
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        IQKeyboardManager.shared.enableAutoToolbar = true
        
    }
    

    
   
    
   
    
 
    

    
    
}



extension ChatVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
}

extension ChatVC : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ReceiverImageCell") as? ReceiverImageCell
        return cell!
        
       
        
        
    }
    
    
}
    
   




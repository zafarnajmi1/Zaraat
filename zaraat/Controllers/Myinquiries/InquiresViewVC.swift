//
//  InquiresViewVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class InquiresViewVC: UIViewController {

    @IBOutlet weak var lblmessage: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblvendorName: UILabel!
    var quiresData  : Enquiries?
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        setNavigationBarWhiteColor()
        self.title = "Quiry"
        
        self.lblmessage.text = quiresData?.message
        self.lblvendorName.text =  quiresData?.owners_name
        self.mainView.layer.borderWidth = 1
        self.mainView.layer.borderColor =  #colorLiteral(red: 0.7488200665, green: 0.7529315352, blue: 0.7569777966, alpha: 1)
        self.mainView.layer.cornerRadius = 8
    }
    
    
    @IBAction func attachAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewImageVC") as! PreviewImageVC
        vc.policyPath = self.quiresData?.document ?? ""
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
    }
    
}

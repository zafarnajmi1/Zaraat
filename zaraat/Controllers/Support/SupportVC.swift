//
//  SupportVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  MessageUI
class SupportVC: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var phoneView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Support"
        addBackButton()
        
        
        EmailView.layer.cornerRadius =  8
        EmailView.layer.borderWidth = 1
        EmailView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        phoneView.layer.cornerRadius =  8
        phoneView.layer.borderWidth = 1
        phoneView.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         
    }
    @IBAction func EmailAction(_ sender: UIButton) {
        
       sendEmail()

    }
    func sendEmail() {
        let emailTitle = "Feedback"
        let messageBody = "Feature request or bug report?"
        let toRecipents = ["friend@stackoverflow.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)

        self.present(mc, animated: true, completion: nil)
        } else {
            print("Present Issues")
        }
    }
    
    
private func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
        switch result {
        case MFMailComposeResult.cancelled:
            print("Mail cancelled")
        case MFMailComposeResult.saved:
            print("Mail saved")
        case MFMailComposeResult.sent:
            print("Mail sent")
        case MFMailComposeResult.failed:
            print("Mail sent failure: \(error.localizedDescription)")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func PhoneAction(_ sender: UIButton) {
        
       callNumber(phoneNumber:"00345678890")
    }
    
    
    private func callNumber(phoneNumber:String) {

        if let phoneCallURL = URL(string: "telprompt://\(phoneNumber)") {

            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                     application.openURL(phoneCallURL as URL)

                }
            }
        }
    }
    
    
}

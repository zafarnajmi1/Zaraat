//
//  LoginVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 2/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import  AuthenticationServices
import LocalAuthentication
class LoginVC: ZaraatBaseVC {
   
    @IBOutlet weak var txtemail: UITextField!
    
   
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var btnlogin: UIButton!
    
    @IBOutlet weak var gmailView: UIView!
    @IBOutlet weak var fbView: UIView!
    
    @IBOutlet weak var guestView: UIView!
    
    var passClick = true
     @IBOutlet weak var btnpass: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbView.roundView()
        self.gmailView.roundView()
        self.guestView.roundView()
        appleView.roundView()
        btnlogin.roundButton()
        
      
    }
    
    @IBAction func passAction(sender: AnyObject) {
        if(passClick == true) {
            txtpassword.isSecureTextEntry = false
            btnpass.setBackgroundImage(UIImage.init(named: "grey (1)"), for: .normal)
        } else {
            txtpassword.isSecureTextEntry = true
            btnpass.setBackgroundImage(UIImage.init(named: "unhide password"), for: .normal)
        }

        passClick = !passClick
    }
    

    @IBAction func loginAction(_ sender: UIButton) {
        
   if checkData() {
         LoginClinet()
      }
              
       
    }
    
    
    
    func checkData()-> Bool {
        if txtemail.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Email", messagetype: 0)
            return false
        } else if txtpassword.text == "" {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Password", messagetype: 0)
            return false
        }else if txtpassword.text!.count < 3 || txtpassword.text!.count > 15  {
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: " Password length must be 3-15 characters", messagetype: 0)
            return false
        }
//        else if txtemail.text!.isValidEmail != true  {
//            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Valid Email", messagetype: 0)
//            return false
//        }
        return true
        
    }
    

    func LoginClinet() {

        let dic : [String:Any] = ["email" : txtemail.text!,"password":txtpassword.text!, "fcm_token": ShareData.shareInfo.fcmToken!]
        ShareData.showProgress()
           userhandler.login(parms: dic, Success: {response in
             ShareData.hideProgress()
               ShareData.hideProgress()
               if response.success == 1{
                ShareData.shareInfo.userInfo = response
                ShareData.shareInfo.email = self.txtemail.text!
                ShareData.shareInfo.password = self.txtpassword.text!
                ShareData.shareInfo.autologin =  true
                self.movetoHome()

                   //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
               }else {
                 ShareData.hideProgress()
                   ShareData.hideProgress()
                   ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
               }

           }, Failure: {error in
               ShareData.hideProgress()
               ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
           })
       }
    
    
    func movetoHome(){
        if UIDevice.current.userInterfaceIdiom == .pad {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                self.navigationController?.pushViewController(vc!, animated: true)

        } else {

                let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
                let vc =  storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
                self.navigationController?.pushViewController(vc!, animated: true)
        }
    }


    
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    
    
    @IBAction func forgotpasswordAction(_ sender: UIButton) {
        
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Ipad, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        } else {
        
        let storyBoard = UIStoryboard.init(name: ShareData.shareInfo.Iphone, bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    
    
    @IBAction func loginwithFB(_ sender: UIButton) {
        FaceBookBasicInfo()
    }
    
    
    func FaceBookBasicInfo(){
           UserDefaults.standard.set(nil, forKey: "Guest")
           let loginmanger = LoginManager()
           loginmanger.logIn(permissions:["email","public_profile"] , from: self){[weak self](success, error) in
               if error != nil
               {
                   print(error?.localizedDescription ?? "You are not logedIn")
               }else if((success?.isCancelled)!){
                   print("You have cancelled")
                   
               }else if((success?.grantedPermissions.contains("email"))!){
                   self?.FBLogin()
               }}
           
       }
    
    
    
    
    func FBLogin()
    {
        if(AccessToken.current != nil)
        {
    
            GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, first_name, last_name, email, gender, picture.type(large)"]).start{(connection, result, error)in
                
                if(error != nil)
                {
                    print(error?.localizedDescription as Any,"Some thing is Wrong")
                }else
                {
                    let socialdict = result as! [String : AnyObject]
                    print(socialdict)
                    
                       
                    
                    let token = AccessToken.current?.tokenString ??  ""
                    let id = socialdict["id"] as! String
                    let email = socialdict["email"] as? String
                    let name = socialdict["name"] as! String
                    let firstname = socialdict["first_name"] as! String
                    let lastname = socialdict["last_name"] as! String
                    
                    self.SocialLogin(id: id, authmethod: "facebook", fbemail: email ?? "", fbFirstName: firstname, FbLastName: lastname)
                
                   
                }
                
                
            }
            
            
        }
        
        
    }
    
    
    
    
    func SocialLogin(id: String, authmethod: String,fbemail: String, fbFirstName: String, FbLastName: String) {

        let dic : [String:Any] = ["firstname":fbFirstName, "lastname":FbLastName, "provider_id": id, "provider":authmethod, "avatar": "", "fcm_token": ShareData.shareInfo.fcmToken!, "email": fbemail]
        ShareData.showProgress()
        ShareData.showProgress()
        userhandler.sociaLogin(parms: dic, Success: {response in
          ShareData.hideProgress()
            ShareData.hideProgress()
            if response.success == 1{
             ShareData.shareInfo.userInfo = response
             ShareData.shareInfo.email = ""
             ShareData.shareInfo.password = ""
             ShareData.shareInfo.autologin =  false
             self.movetoHome()

                //Zalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 1)
            }else {
              ShareData.hideProgress()
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message!, messagetype: 0)
            }

        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })

    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func LoginWithGmail(_ sender: UIButton) {
        
        self.gmailbasicInfo()
    
    }
          
      func gmailbasicInfo(){
          
          let Googlelogin = GIDSignIn.sharedInstance()
          Googlelogin?.signOut()
          Googlelogin?.shouldFetchBasicProfile = true
          Googlelogin?.scopes = ["profile", "email"]
          Googlelogin?.delegate = self
          Googlelogin?.presentingViewController = self
          Googlelogin?.signIn()
      }
    
    @IBAction func GestContinoue(_ sender: UIButton) {
    }
    
    @IBAction func ContinoueWithApple(_ sender: UIButton) {
        //authenticateUser()
        appleconfig()
    }
    
    
    
    func appleconfig(){
        
        let appleIDProvider =  ASAuthorizationAppleIDProvider()
        let request =  appleIDProvider.createRequest()
        request.requestedScopes =  [.fullName, .email]
        let authorizationcontroller = ASAuthorizationController(authorizationRequests: [request])
        authorizationcontroller.delegate = self
        authorizationcontroller.performRequests()
        
    }
    
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        //self.runSecretCode()
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    
    
    
}

extension LoginVC : ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let  appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential  {
            let useridentifire =  appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email =  appleIDCredential.email
            print(fullName, email)
            self.SocialLogin( id: "\(useridentifire)", authmethod: "apple", fbemail: email ?? "", fbFirstName: appleIDCredential.fullName?.givenName ?? "", FbLastName: appleIDCredential.fullName?.familyName ?? "")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}
//GIDSignInUIDelegate
extension LoginVC : GIDSignInDelegate{
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
        }else if(error == nil)
        {
            let accessToken = GIDSignIn.sharedInstance()?.currentUser.authentication.idToken
       
            
            self.SocialLogin( id: user.userID, authmethod: "google", fbemail: user.profile.email ?? "", fbFirstName: user.profile.givenName, FbLastName: user.profile.name)
            //self.gmailLogin(token: accessToken!, id: user.userID, authmethod: "google", user: user)
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


//
//  ShareData.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import  UIKit
import  KRProgressHUD
class ShareData {
    static let shareInfo = ShareData()
    private init (){}
    var  userInfo : LoginModel?
    
    func userData(User: LoginModel){
        userInfo = User
    }
    
    var b2bCate: B2BCateModel?
    func b2bCateData(cate:B2BCateModel){
        b2bCate =  cate
    }
    
    var EcommerceCate: EcommerceCateModel?
    func ecommerceCateData(cate:EcommerceCateModel){
        EcommerceCate =  cate
    }
    
    
    var userprofile: UserProfile?
    func userProfileData(cate:UserProfile){
        userprofile =  cate
    }
    
    
    var cartSave: GetCartModel?
    func CartSaveData(cart:GetCartModel){
        cartSave =  cart
    }
    
//
//    //Ipad StoryBoard
//
    var Ipad = "Ipad_StoryBoard"//"Storyboard_Ipad"//"Ipad_StoryBoard"
    var Iphone = "Main"

    class func showProgress() {
           KRProgressHUD.show()
       }

       class func hideProgress() {
           DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
              KRProgressHUD.dismiss()
           }
       }
    var password:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "password")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "password")
        }
    }

    var email:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "email")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "email")
        }
    }
    var autologin:Bool?{
        set{
            UserDefaults.standard.set(newValue , forKey: "autologin")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey:  "autologin")
        }
    }
    
    
private var unseenCartCount : Int = 0
   var unseenCart : Int {
       set {
           
           unseenCartCount = newValue
           NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CartCount"), object: nil, userInfo: nil)
       }
       get{
           return unseenCartCount
       }
   }
    
    
    
    
    var count:Int?{
           set{
               UserDefaults.standard.set(newValue , forKey: "count")
               UserDefaults.standard.synchronize()
           }
           get{
               return UserDefaults.standard.integer(forKey:  "count")
           }
       }
    
    
    
  
}

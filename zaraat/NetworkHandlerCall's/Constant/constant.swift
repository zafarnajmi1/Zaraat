//
//  constant.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    
    
    struct instgramUrls {
        static let clientId = "1a50df5f7e4a413b88059ece6c3de03f" //"c09e8026cf0f4335a2fa978ebfa7871e"
        static let redirectUri = "https://www.projects.mytechnology.ae/car-insurance/"//"https://www.projects.mytechnology.ae/car-insurance/en/api/"
       
        static let clientScret = "54786ef7ce44467ba81408c1a9adf89d"
        static let  authorization = "https://api.instagram.com/oauth/authorize/"
        static let scope = "likes+comments+relationships"
    }
   
    static var MainUrl : String {
        return "https://apiengine.zaraat.com/api/customers/"
    }
    
    
    struct activitySize {
        static let size = CGSize(width: 40, height: 40)
    }
    
    enum loaderMessages : String {
        case loadingMessage = "Loading..."
    }
    
    //AuthPArt
    struct URLs {
        
        static let Register = "register"
        static let Login = "login"
        static let LandingPage = "products/landing/"
        static let commerceCate = "categories/ecommerce"
        static let b2bCate = "categories/b2b"
        static let forgotPass = "password/forget"
        static let veriCode = "password/verify"
        static let resetPass = "password/reset"
        static let changePassword = "password/change"
        static let Allcate = "categories/all"
        static let SubCate = "subcategories/"
        static let ChildCate = "childcategories/"
        static let subcateProducts = "subcategory/"
        static let Trending = "products/trending"
        static let CateGories = "category/"
        static let FlashSale = "sales/all"
        static let WeeklyViewAll = "products/weekly/all"
        static let FeatuerProductAll = "products/featured/all"
        static let topproducts = "products/latest"
        static let ZMart = "products/gofresh"
        static let  productList = "childcategory/"
        static let  Zpharmacy = "products/zpharmacy"
        static let Digital = "products/zdigital"
       
        static let Education = "products/education"
        static let Fashion = "products/fashion"
        static let electronics = "products/electronics"
        static let homelifestyle = "products/homelifestyle"
        static let watchsbag = "products/watchesbags"
        static let homeappliance = "products/homeappliances"
        static let productdetail = "products/show/"
        static let mainCate = "category/"
        static let b2bHomeLand = "products/landing/b2b"
        
        
        
        static let LiveStock = "products/livestock"
        static let Seeds = "products/seeds"
        static let Pesticides = "products/pesticides"
        static let Irregation = "products/irrigation"
        static let ColdStorage = "products/coldstorage"
        static let TunnelFarming = "products/tunnelfarming"
        static let Fertilizer = "products/fertilizers"
        static let Machinry = "products/machinery"
        static let Crops = "products/crops"
        static let Printing = "products/printing"
        
        
        
        //Profile
        static let profiel  =  "profile/show"
        static let updateProfile = "profile/update"
        static let profilepicture = "profile/picture/upload"
        
        // Add to Cart
        static let addtoCart = "cart/add"
        static let Getcart = "cart/get"
        static let RemoveCart = "cart/remove"
        static let CoupanCode = "coupons/getbycode/"
        
        // Filters
        static let childCateBrand = "childcategories/main/"
        static let attributes = "filter/attributes"
        static let filterUrl = "filter"
        
        // wish List
        static let wishlist = "wishlist/store"
        static let removewishlist  =  "wishlist/remove"
        static let getwishlist = "wishlist/my"
        
        //notification on off
        static let notification  = "profile/notifications"
        // search
        static let searchProduct = "products/search"
        
        //Myorders
        static let inprogress = "orders"
        //inquiries
        static let inquiryDoc = "enquiries/document"
        static let seninquiry = "enquiries/post"
        static let getInquires = "enquiries"
        static let Zmall = "products/zmall"
        
        static let address = "profile/addresses"
        static let storeAddress = "profile/addresses/store?"
        static let placeOrder = "orders/place"
    }
    
    struct NetworkErrorType {
        static let timeOutInterval: TimeInterval = 20
        
        static let error = "Error"
        static let internetNotAvailable = "Internet Not Available. Please Try Again"
        static let pleaseTryAgain = "Please Try Again"
        
        static let generic = 4000
        static let genericError = "Please Try Again."
        
        static let serverErrorCode = 5000
        static let serverNotAvailable = "Server Not Available"
        static let serverError = "Server Not Availabe, Please Try Later."
        
        static let timout = 4001
        static let timoutError = "Network Time Out, Please Try Again."
        
        static let login = 4003
        static let loginMessage = "Unable To Login"
        static let loginError = "Please Try Again."
        
        static let internet = 4004
        static let internetError = "Internet Not Available. Please Try Again"
    }
    
    struct NetworkSuccess {
        static let statusOK = 200
    }
    
}

let NOTIFICATIONS_UPDATED = "NOTIFICATIONS_UPDATED"

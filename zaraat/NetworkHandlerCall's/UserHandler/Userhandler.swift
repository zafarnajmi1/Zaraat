//
//  Userhandler.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

import Alamofire




class userhandler {
    
    
    class  func login(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Login
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
   
    class  func Register(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Register
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func getHomeLanding( Success: @escaping (HomeLandingModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.LandingPage
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(HomeLandingModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    class  func getB2BHomeLanding( Success: @escaping (B2bHomeLandingModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.b2bHomeLand
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    print(successResponse)
                    let responseModel = try JSONDecoder().decode(B2bHomeLandingModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func getB2BCate( Success: @escaping (B2BCateModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.b2bCate
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(B2BCateModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    class  func getEcommerceCate( Success: @escaping (EcommerceCateModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.commerceCate
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(EcommerceCateModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    class  func forGotPasswordSet(parms: [String: Any], Success: @escaping (ForgotPasswordModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.forgotPass
        print("pages Url", url)
        Networkhandler.PostRequest(url: url, parameters: parms,success: {(successResponse) in

            do {
            
                let responseModel = try JSONDecoder().decode(ForgotPasswordModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    class  func VerificationCode(parms: [String: Any], Success: @escaping (VerificationCodeModel) -> Void, Failure: @escaping(NetworkError) -> Void){
         let url = Constant.MainUrl + Constant.URLs.veriCode
         print("pages Url", url)
         Networkhandler.PostRequest(url: url, parameters: parms,success: {(successResponse) in

             do {
             
                 let responseModel = try JSONDecoder().decode(VerificationCodeModel.self, from: successResponse.data!)
                 Success(responseModel)
             }
             catch {
                 print("Response Error")
             }


         } , Falioure: {(Error) in
             Failure(Error)
         })
     }
    
    
    class  func ResetPassword(parms: [String: Any], Success: @escaping (VerificationCodeModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.resetPass
           print("pages Url", url)
           Networkhandler.PostRequest(url: url, parameters: parms,success: {(successResponse) in

               do {
               
                   let responseModel = try JSONDecoder().decode(VerificationCodeModel.self, from: successResponse.data!)
                   Success(responseModel)
               }
               catch {
                   print("Response Error")
               }


           } , Falioure: {(Error) in
               Failure(Error)
           })
       }
    
    
    
    
    class  func getallCate( Success: @escaping (AllCategoriesModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.Allcate
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(AllCategoriesModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    //ecommerce
    //b2b
    class  func getSubCate( subCate: Int, Success: @escaping (SubCategoriesModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.SubCate + "\(subCate)"
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    print("Response ", successResponse)
                    let responseModel = try JSONDecoder().decode(SubCategoriesModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func getChildCate( ChildCate: Int, Success: @escaping (ChildCateModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.ChildCate + "\(ChildCate)"
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ChildCateModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func getSubCateProducts( Cate: Int, Success: @escaping (SubCateProductsModels) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.subcateProducts + "\(Cate)" + "/products"
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(SubCateProductsModels.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func getTrendingProducts(Success: @escaping (TrendingProductsModels) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.Trending
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(TrendingProductsModels.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func getCateProducts( Cate: Int, Success: @escaping (HomeCate) -> Void, Failure: @escaping(NetworkError) -> Void){
               let url = Constant.MainUrl + Constant.URLs.CateGories + "\(Cate)" + "/products"
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(HomeCate.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
    class  func getViewAllFlashSaleProducts( Success: @escaping (ViewAllFlashSaleModel) -> Void, Failure: @escaping(NetworkError) -> Void){
            let url = Constant.MainUrl + Constant.URLs.FlashSale
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ViewAllFlashSaleModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    class  func getWeeklyViewAllProducts( Success: @escaping (WeeklyViewAllProducts) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.WeeklyViewAll
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(WeeklyViewAllProducts.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    class  func getFeaturedAllProducts( Success: @escaping (WeeklyViewAllProducts) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.FeatuerProductAll
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(WeeklyViewAllProducts.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    class  func gettopAllProducts( Success: @escaping (WeeklyViewAllProducts) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.topproducts
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(WeeklyViewAllProducts.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    

    
    class  func getZMart( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.ZMart
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
       class  func getProductsList( id: Int, Success: @escaping (ProductListModel) -> Void, Failure: @escaping(NetworkError) -> Void){
               let url = Constant.MainUrl + Constant.URLs.productList + "\(id)" + "/products"
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ProductListModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
    class  func getZpharmacy( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.Zpharmacy
                  print("pages Url", url)
                  Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
          
                      do {
                          let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                          Success(responseModel)
                      }
                      catch {
                          print("Response Error")
                      }
          
          
                  } , Falioure: {(Error) in
                      Failure(Error)
                  })
              }
       
    
    
    class  func getZDigital( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Digital
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    ////////////////////
    
    class  func getFashion( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Fashion
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    class  func getElectronics( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.electronics
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
       
    
    
    
    class  func getHomeLifeStyle( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.homelifestyle
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
       
    
    
    class  func geteducation( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Education
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
       
    
    class  func getWatchs( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.watchsbag
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
    class  func getHomeAppliances( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.homeappliance
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
       
       
    
    class  func getProductDetail(id:Int, Success: @escaping (ProductDetailModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.productdetail + "\(id)"
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ProductDetailModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    

    class  func getMainCateProducts( Cate: Int, Success: @escaping (MainCategoriesProducts) -> Void, Failure: @escaping(NetworkError) -> Void){
              let url = Constant.MainUrl + Constant.URLs.mainCate + "\(Cate)" + "/productsonly"
              print("pages Url", url)
              Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
      
                  do {
                      let responseModel = try JSONDecoder().decode(MainCategoriesProducts.self, from: successResponse.data!)
                      Success(responseModel)
                  }
                  catch {
                      print("Response Error")
                  }
      
      
              } , Falioure: {(Error) in
                  Failure(Error)
              })
          }
    
    
    
    //////B2B Buttons Section
    
    
    class  func getLiveStock( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.LiveStock
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
    
    class  func getSeeds( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Seeds
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    class  func getPesticides( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Pesticides
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func getIrregation( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Irregation
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    class  func getColdStorage( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.ColdStorage
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    class  func getTunnelFarming( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.TunnelFarming
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    class  func getFertilizers( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Fertilizer
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    class  func getMachinery( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Machinry
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    class  func getCrops( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Crops
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
    
    class  func getPrinting( Success: @escaping (ZMartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Printing
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(ZMartModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
    
    
    
    
    class  func getUserProfile( Success: @escaping (UserProfile) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.profiel
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(UserProfile.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    
    
    
    class  func getUploadrProfileimg(file:String,image:UIImage, Success: @escaping (ImageUpload) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.profilepicture
            print("pages Url", url)
        Networkhandler.UploadProfile(url: url, filename: file, parameters: nil, userimg: image, Progress: {progress in
            
        }, Success: {response in
                do {
                   let responseModel = try JSONDecoder().decode(ImageUpload.self, from: response.data!)
                   Success(responseModel)
                }
                catch {
                   print("Response Error")
                }
        }, Falioure: {(Error) in
            Failure(Error)
        })
       
        }
    
    
    
    class  func UpdatePrfileUser(parms: [String: Any], Success: @escaping (UserProfile) -> Void, Failure: @escaping(NetworkError) -> Void){
          let url = Constant.MainUrl + Constant.URLs.updateProfile
          
          Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
              
              do {
              print("MyResponse : ", successResponse)
                  let responseModel = try JSONDecoder().decode(UserProfile.self, from: successResponse.data!)
                  Success(responseModel)
              }
              catch {
                  print("Response Error")
              }
              
              
          } , Falioure: {(Error) in
              Failure(Error)
          })
      }
    
    
    class  func addtoCart(parms: [String: Any], Success: @escaping (GetCartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.addtoCart
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(GetCartModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    
    class  func getCartData( Success: @escaping (GetCartModel) -> Void, Failure: @escaping(NetworkError) -> Void){
     let url = Constant.MainUrl + Constant.URLs.Getcart
            print("pages Url", url)
            Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
    
                do {
                    let responseModel = try JSONDecoder().decode(GetCartModel.self, from: successResponse.data!)
                    Success(responseModel)
                }
                catch {
                    print("Response Error")
                }
    
    
            } , Falioure: {(Error) in
                Failure(Error)
            })
        }
    
    
    
    class  func DeleteFromCart(parms: [String: Any], Success: @escaping (AddtoCart) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.RemoveCart
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(AddtoCart.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func getCoupancode( Success: @escaping (CoupanModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.CoupanCode
               print("pages Url", url)
               Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in
       
                   do {
                       let responseModel = try JSONDecoder().decode(CoupanModel.self, from: successResponse.data!)
                       Success(responseModel)
                   }
                   catch {
                       print("Response Error")
                   }
       
       
               } , Falioure: {(Error) in
                   Failure(Error)
               })
           }
       
    
    
}

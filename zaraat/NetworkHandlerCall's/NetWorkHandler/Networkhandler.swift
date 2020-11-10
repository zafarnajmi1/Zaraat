//
//  Networkhandler.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import Alamofire

class Networkhandler{
    

class func PostRequest(url: String, parameters: Parameters?, success:@escaping (AFDataResponse<Any>)->Void ,Falioure: @escaping (NetworkError) -> Void )
    {
        print("PAramter data", parameters)
        let Manger = Alamofire.Session.default
        var Headers : HTTPHeaders
       //ShareData.shareInfo.userInfo?.collection?.authorization
        //print(UserDefaults.standard.value(forKey: "userAuthToken"))
        //let brear = (ShareData.shareInfo.userInfo?.token_type ?? "") + " " + (ShareData.shareInfo.userInfo?.token ?? "")
        if let userToken = ShareData.shareInfo.userInfo?.token{
            Headers = [
                //"Accept": "application/json",
                "Authorization"  : "Bearer  " + userToken ,  //"Authorization"
            //"Content-Type": "application/x-www-form-urlencoded"//"multipart/form-data"
            ]
        } else {
            Headers = [
                "Accept": "application/json"
            ]
        }
        
        Manger.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: Headers).validate(statusCode: 200..<600).responseJSON{ (response)-> Void in
            
            switch(response.result)
            {
            case .success:
                let ModelRespons = response.result
                print("api response",ModelRespons)
                success(response)
               
                break
            case .failure (let error):
                
                var networkError = NetworkError()
                
                if error._code == NSURLErrorTimedOut {
                    networkError.status = Constant.NetworkErrorType.timout
                    networkError.message = Constant.NetworkErrorType.timoutError
                    
                    Falioure(networkError)
                } else if error._code == NSURLErrorNetworkConnectionLost{
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorNotConnectedToInternet{
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorCannotConnectToHost {
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorSecureConnectionFailed{
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                    
                }else{
                    
                    networkError.status = Constant.NetworkErrorType.generic
                    networkError.message = Constant.NetworkErrorType.genericError
                    
                    Falioure(networkError)
                }
                break
            }
            
            
        }
        
        
    }
    
    
    
    
    class func GetRequiest(url: String, parameters: Parameters?, success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)   {
        
        let Manger = Alamofire.Session.default
        //UserDefaults.standard.value(forKey: "userAuthToken") as? String
        let  Headers : HTTPHeaders
        if let userToken = ShareData.shareInfo.userInfo?.token{
                  Headers = [
                      "Accept": "application/json",
                      "Authorization"  : "Bearer  " + userToken   //"Authorization"
                  ]
              } else {
                  Headers = [
                      "Accept": "application/json"
                  ]
              }
        
        Manger.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Headers).validate(statusCode: 200..<600).responseJSON(completionHandler:{(response) -> Void in
            
            switch(response.result)
            {
                
            case .success:
                let RespomseModel = response.result
                print(RespomseModel)
                success(response)
            case .failure (let error):
                
                
                var networkError = NetworkError()
                
                if error._code == NSURLErrorTimedOut {
                    networkError.status = Constant.NetworkErrorType.timout
                    networkError.message = Constant.NetworkErrorType.timoutError
                    
                    Falioure(networkError)
                } else if error._code == NSURLErrorNetworkConnectionLost {
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorNotConnectedToInternet{
                    networkError.status = Constant.NetworkErrorType.internet
                    networkError.message = Constant.NetworkErrorType.internetError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorCannotConnectToHost {
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                }else if error._code == NSURLErrorSecureConnectionFailed{
                    networkError.status = Constant.NetworkErrorType.serverErrorCode
                    networkError.message = Constant.NetworkErrorType.serverError
                    
                    Falioure(networkError)
                    
                }else{
                    
                    networkError.status = Constant.NetworkErrorType.generic
                    networkError.message = Constant.NetworkErrorType.genericError
                    
                    Falioure(networkError)
                }
                break
            }
            
        } )
        
    }
    
    
    
//
//    func uploadData(url: String,filename:String, parameters: Parameters?,userimg: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void) {
//
//        var Headers : HTTPHeaders
//        let Manger = Alamofire.Session.default
//        if let userToken = ShareData.shareInfo.userInfo?.token {
//            Headers = [
//                "Accept": "application/json",
//                "Authorization" : userToken,
//                "Content-type": "multipart/form-data"
//            ]
//        }else
//        {
//            Headers = ["Accept": "application/json"]
//        }
//
//        let type = "any"
//        let fileName = filename
//
//
//      Manger.upload(multipartFormData: { multipartFormData in
//
//            if let data = userimg.jpegData(compressionQuality: 0.1)
//              {
//                  print(data)
//                  multipartFormData.append(data, withName: filename, fileName: fileName, mimeType: type)
//              }
//
//                  for(key, values ) in parameters!
//                    {
//                        multipartFormData.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
//                        print(values)
//                        print(values)
//                    }
//
//
//
//      },to: url, usingThreshold: UInt64.init(), method: .post , headers: Headers).responseJSON(completionHandler: {response in
//
//
//        switch  response.result {
//
//            case .success:
//
//                let RespomseModel = response.result
//                print(RespomseModel)
//                Success(response)
//
//            case .failure (let error):
//
//                var networkError = NetworkError()
//
//                if error._code == NSURLErrorTimedOut {
//                    networkError.status = Constant.NetworkErrorType.timout
//                    networkError.message = Constant.NetworkErrorType.timoutError
//
//                    Falioure(networkError)
//                } else if error._code == NSURLErrorNetworkConnectionLost {
//                    networkError.status = Constant.NetworkErrorType.internet
//                    networkError.message = Constant.NetworkErrorType.internetError
//
//                    Falioure(networkError)
//                }else if error._code == NSURLErrorNotConnectedToInternet{
//                    networkError.status = Constant.NetworkErrorType.internet
//                    networkError.message = Constant.NetworkErrorType.internetError
//
//                    Falioure(networkError)
//                }else if error._code == NSURLErrorCannotConnectToHost {
//                    networkError.status = Constant.NetworkErrorType.serverErrorCode
//                    networkError.message = Constant.NetworkErrorType.serverError
//
//                    Falioure(networkError)
//                }else if error._code == NSURLErrorSecureConnectionFailed{
//                    networkError.status = Constant.NetworkErrorType.serverErrorCode
//                    networkError.message = Constant.NetworkErrorType.serverError
//
//                    Falioure(networkError)
//
//                }else{
//
//                    networkError.status = Constant.NetworkErrorType.generic
//                    networkError.message = Constant.NetworkErrorType.genericError
//
//                    Falioure(networkError)
//                }
//        default :
//                break
//            }
//
//
//      })
//
//
//
//
//    }
    
    
    
    
    
    
    
    class func UploadProfile(url: String,filename:String, parameters: Parameters?,userimg: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)
        {
            
            print(url)
            print(filename)
            print(userimg)
            
            var Headers : HTTPHeaders
            let Manger = Alamofire.Session.default
            if let userToken = ShareData.shareInfo.userInfo?.token {
                Headers = [
                    "Accept": "application/json",
                    "Authorization" : userToken,
                    "Content-type": "multipart/form-data"
                ]
            }else
            {
                Headers = ["Accept": "application/json"]
            }

           
            let fileName = filename//"image"

            Manger.upload(multipartFormData: {(multipart) in

                if let data = userimg.jpegData(compressionQuality: 0.1)
                {
                    print(data)
                    multipart.append(data, withName: fileName, fileName: filename, mimeType: "any")
                }
//                for(key, values ) in parameters!
//                {
//                    multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
//                    print(values)
//                    print(values)
//                }

            }, to: url, method: .post, headers: Headers) .responseJSON(completionHandler: { result in

                switch(result.result)
                {

                        case .success:
                            let resultValue = result.result
                            print(resultValue)
                            Success(result)
                            break

                        case .failure (let error):


                            var networkError = NetworkError()

                            if error._code == NSURLErrorTimedOut {
                                networkError.status = Constant.NetworkErrorType.timout
                                networkError.message = Constant.NetworkErrorType.timoutError

                                Falioure(networkError)
                            } else if error._code == NSURLErrorNetworkConnectionLost {
                                networkError.status = Constant.NetworkErrorType.internet
                                networkError.message = Constant.NetworkErrorType.internetError

                                Falioure(networkError)
                            }else if error._code == NSURLErrorNotConnectedToInternet{
                                networkError.status = Constant.NetworkErrorType.internet
                                networkError.message = Constant.NetworkErrorType.internetError

                                Falioure(networkError)
                            }else if error._code == NSURLErrorCannotConnectToHost {
                                networkError.status = Constant.NetworkErrorType.serverErrorCode
                                networkError.message = Constant.NetworkErrorType.serverError

                                Falioure(networkError)
                            }else if error._code == NSURLErrorSecureConnectionFailed{
                                networkError.status = Constant.NetworkErrorType.serverErrorCode
                                networkError.message = Constant.NetworkErrorType.serverError

                                Falioure(networkError)

                            }else{

                                networkError.status = Constant.NetworkErrorType.generic
                                networkError.message = Constant.NetworkErrorType.genericError

                                Falioure(networkError)
                            }
                            break

                        }

                    })

               

            }
//

        
        
    
    
    
//    class func UploadData(url: String,filename:String, parameters: Parameters?,userimg: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)
//    {
//        var Headers : HTTPHeaders
//        let Manger = Alamofire.Session.default
//        if let userToken = ShareData.shareInfo.userInfo?.token {
//            Headers = [
//                "Accept": "application/json",
//                "Authorization" : userToken,
//                "Content-type": "multipart/form-data"
//            ]
//        }else
//        {
//            Headers = ["Accept": "application/json"]
//        }
//
//        let type = "any"
//        let fileName = filename//"image"
         
        
        
        
//        AF.upload(multipartFormData: {(multipart) in
//
//            if let data = userimg.jpegData(compressionQuality: 0.1)
//            {
//                print(data)
//                multipart.append(data, withName: "image", fileName: fileName, mimeType: type)
//            }
//            for(key, values ) in parameters!
//            {
//                multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
//                print(values)
//                print(values)
//            }
//
//        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
//            switch(result)
//            {
//            case .success(let request,_,_):
//                request.uploadProgress(closure: { (prgrs) in
//
//                    let progress = Int(prgrs.fractionCompleted * 100)
//                    print(progress)
//                    Progress(progress)
//                })
//                request.responseJSON(completionHandler: {(successresponse)in
//
//                    switch(successresponse.result)
//                    {
//                    case .success:
//                        let resultValue = successresponse.result.value
//                        //print(resultValue)
//                        Success(successresponse)
//                        break
//
//                    case .failure (let error):
//
//
//                        var networkError = NetworkError()
//
//                        if error._code == NSURLErrorTimedOut {
//                            networkError.status = Constant.NetworkErrorType.timout
//                            networkError.message = Constant.NetworkErrorType.timoutError
//
//                            Falioure(networkError)
//                        } else if error._code == NSURLErrorNetworkConnectionLost {
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorNotConnectedToInternet{
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorCannotConnectToHost {
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorSecureConnectionFailed{
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//
//                            Falioure(networkError)
//
//                        }else{
//
//                            networkError.status = Constant.NetworkErrorType.generic
//                            networkError.message = Constant.NetworkErrorType.genericError
//
//                            Falioure(networkError)
//                        }
//                        break
//
//                    }
//
//                })
//            case .failure(let error):
//                Falioure(error as! NetworkError)
//            }
//
//        })


    //}
//    
//   
//    
//    
//    
//    
//    class func UploadImage(url: String, parameters: Parameters?,userimg: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)
//    {
//        var Headers : HTTPHeaders
//        let Manger = Alamofire.Session.default
//        //print(UserDefaults.standard.value(forKey: "userAuthToken")!)
//        if let userToken = ShareData.shareInfo.userInfo?.token {
//            Headers = [
//              
//                    "Accept": "application/json",
//                    "Authorization"  : "Bearer  " + userToken ,  //"Authorization"
//                    "Content-type": "application/json"//"multipart/form-data"
//            ]
//        }else
//        {
//            Headers = ["Accept": "application/json"]
//        }
//        
//        let type = "any"
//        let fileName = "document"
//        
//        Manger.upload(multipartFormData: {(multipart) in
//            
//            if let data = userimg.jpegData(compressionQuality: 0.6)
//            {
//                print(data)
//                multipart.append(data, withName: fileName, fileName: fileName, mimeType: type)
//            }
//            //            for(key, values ) in parameters!
//            //            {
//            //                multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
//            //                print(values)
//            //                print(values)
//            //            }
//            
//        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
//            switch(result)
//            {
//            case .success(let request,_,_):
//                request.uploadProgress(closure: { (prgrs) in
//                    
//                    let progress = Int(prgrs.fractionCompleted * 100)
//                    print(progress)
//                    Progress(progress)
//                })
//                request.responseJSON(completionHandler: {(successresponse)in
//                    
//                    switch(successresponse.result)
//                    {
//                    case .success:
//                        let resultValue = successresponse.result.value
//                        print(resultValue!)
//                        Success(successresponse)
//                        break
//                        
//                    case .failure (let error):
//                        
//                        
//                        var networkError = NetworkError()
//                        
//                        if error._code == NSURLErrorTimedOut {
//                            networkError.status = Constant.NetworkErrorType.timout
//                            networkError.message = Constant.NetworkErrorType.timoutError
//                            
//                            Falioure(networkError)
//                        } else if error._code == NSURLErrorNetworkConnectionLost {
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorNotConnectedToInternet{
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorCannotConnectToHost {
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorSecureConnectionFailed{
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//                            
//                            Falioure(networkError)
//                            
//                        }else{
//                            
//                            networkError.status = Constant.NetworkErrorType.generic
//                            networkError.message = Constant.NetworkErrorType.genericError
//                            
//                            Falioure(networkError)
//                        }
//                        break
//                        
//                    }
//                    
//                })
//            case .failure(let error):
//                Falioure(error as! NetworkError)
//            }
//            
//        })
//    }
//    
//    
//    
//    class func UploadImage1(url: String,filename:String, parameters: Parameters?,gellaryimg: [UIImage],Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)
//    {
//        var Headers : HTTPHeaders
//        let Manger = Alamofire.Session.default
//        //print(UserDefaults.standard.value(forKey: "userAuthToken")!)
//        if let userToken = ShareData.shareInfo.userInfo?.token {
//            Headers = [
//              
//                    "Accept": "application/json",
//                    "Authorization"  : "Bearer  " + userToken ,  //"Authorization"
//                    "Content-type": "application/json"//"multipart/form-data"
//            ]
//        }else
//        {
//            Headers = ["Accept": "application/json"]
//        }
//        
//        let type = "any"
//        let fileName = filename
//        
//        Manger.upload(multipartFormData: {(multipart) in
//            for item  in gellaryimg {
//              let data =  item.jpegData(compressionQuality: 0.4)
//                print("i am data", data!)
//                multipart.append(data!, withName: fileName, fileName: "\( NSUUID().uuidString).jpeg", mimeType: type)
//            }
////            if let data = userimg.jpegData(compressionQuality: 0.6)
////            {
////                print(data)
////                multipart.append(data, withName: fileName, fileName: fileName, mimeType: type)
////            }
////                        for(key, values ) in parameters!
////                        {
////                            multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
////                            print(values)
////                            print(values)
////                        }
//            
//        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
//            switch(result)
//            {
//            case .success(let request,_,_):
//                request.uploadProgress(closure: { (prgrs) in
//                    
//                    let progress = Int(prgrs.fractionCompleted * 100)
//                    print(progress)
//                    Progress(progress)
//                })
//                request.responseJSON(completionHandler: {(successresponse)in
//                    
//                    switch(successresponse.result)
//                    {
//                    case .success:
//                        let resultValue = successresponse.result.value
//                        print(resultValue!)
//                        Success(successresponse)
//                        break
//                        
//                    case .failure (let error):
//                        
//                        
//                        var networkError = NetworkError()
//                        
//                        if error._code == NSURLErrorTimedOut {
//                            networkError.status = Constant.NetworkErrorType.timout
//                            networkError.message = Constant.NetworkErrorType.timoutError
//                            
//                            Falioure(networkError)
//                        } else if error._code == NSURLErrorNetworkConnectionLost {
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorNotConnectedToInternet{
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorCannotConnectToHost {
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorSecureConnectionFailed{
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//                            
//                            Falioure(networkError)
//                            
//                        }else{
//                            
//                            networkError.status = Constant.NetworkErrorType.generic
//                            networkError.message = Constant.NetworkErrorType.genericError
//                            
//                            Falioure(networkError)
//                        }
//                        break
//                        
//                    }
//                    
//                })
//            case .failure(let error):
//                Falioure(error as! NetworkError)
//            }
//            
//        })
//    }
//    
//    class func Uploadfiels(url: String,filename: String, parameters: Parameters?,videourl: URL,Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)
//    {
//        var Headers : HTTPHeaders
//        let Manger = Alamofire.Session.default
//        //print(UserDefaults.standard.value(forKey: "userAuthToken")!)
//        if let userToken = ShareData.shareInfo.userInfo?.token {
//            Headers = [
//              
//                    "Accept": "application/json",
//                    "Authorization"  : "Bearer  " + userToken ,  //"Authorization"
//                    "Content-type": "application/json"//"multipart/form-data"
//            ]
//        }else
//        {
//            Headers = ["Accept": "application/json"]
//        }
//        
//       //let type  = "any"
//        let fileName = filename
//        
//        Manger.upload(multipartFormData: {(multipart) in
//            print(videourl)
//            multipart.append(videourl, withName: fileName, fileName: "mp4", mimeType: "Video/mp4")
//            
//           
//            
//            
//            
//            
//            
////            if let data = userimg.jpegData(compressionQuality: 0.6)
////            {
////                print(data)
////                multipart.append(data, withName: fileName, fileName: fileName, mimeType: type)
////            }
//            //            for(key, values ) in parameters!
//            //            {
//            //                multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
//            //                print(values)
//            //                print(values)
//            //            }
//            
//        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
//            switch(result)
//            {
//            case .success(let request,_,_):
//                request.uploadProgress(closure: { (prgrs) in
//                    
//                    let progress = Int(prgrs.fractionCompleted * 100)
//                    print(progress)
//                    Progress(progress)
//                })
//                request.responseJSON(completionHandler: {(successresponse)in
//                    
//                    switch(successresponse.result)
//                    {
//                    case .success:
//                        let resultValue = successresponse.result.value
//                        print(resultValue!)
//                        Success(successresponse)
//                        break
//                        
//                    case .failure (let error):
//                        
//                        
//                        var networkError = NetworkError()
//                        
//                        if error._code == NSURLErrorTimedOut {
//                            networkError.status = Constant.NetworkErrorType.timout
//                            networkError.message = Constant.NetworkErrorType.timoutError
//                            
//                            Falioure(networkError)
//                        } else if error._code == NSURLErrorNetworkConnectionLost {
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorNotConnectedToInternet{
//                            networkError.status = Constant.NetworkErrorType.internet
//                            networkError.message = Constant.NetworkErrorType.internetError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorCannotConnectToHost {
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//                            
//                            Falioure(networkError)
//                        }else if error._code == NSURLErrorSecureConnectionFailed{
//                            networkError.status = Constant.NetworkErrorType.serverErrorCode
//                            networkError.message = Constant.NetworkErrorType.serverError
//                            
//                            Falioure(networkError)
//                            
//                        }else{
//                            
//                            networkError.status = Constant.NetworkErrorType.generic
//                            networkError.message = Constant.NetworkErrorType.genericError
//                            
//                            Falioure(networkError)
//                        }
//                        break
//                        
//                    }
//                    
//                })
//            case .failure(let error):
//                Falioure(error as! NetworkError)
//            }
//            
//        })
//    }
//    
//    class func UploaDealImage(url: String,filename: String, parameters: Parameters?,img: UIImage,Progress: @escaping (Int) ->Void, Success: @escaping (AFDataResponse<Any>)->Void, Falioure: @escaping (NetworkError) -> Void)
//        {
//            var Headers : HTTPHeaders
//            let Manger = Alamofire.Session.default
//            //print(UserDefaults.standard.value(forKey: "userAuthToken")!)
//            if let userToken = ShareData.shareInfo.userInfo?.token {
//                Headers = [
//                  
//                        "Accept": "application/json",
//                        "Authorization"  : "Bearer  " + userToken ,  //"Authorization"
//                        "Content-type": "multipart/form-data"
//                ]
//            }else
//            {
//                Headers = ["Accept": "application/json"]
//            }
//            
//           let type  = ".png"
//            let fileName = filename
//            
//            Manger.upload(multipartFormData: {(multipart) in
//                
//               
//                if let data = img.jpegData(compressionQuality: 0.6)
//                {
//                    print(data)
//                    multipart.append(data, withName: fileName, fileName: fileName, mimeType: type)
//                }
//                //            for(key, values ) in parameters!
//                //            {
//                //                multipart.append((values as! String).data(using: String.Encoding.utf8)!, withName: key)
//                //                print(values)
//                //                print(values)
//                //            }
//                
//            }, usingThreshold: UInt64.init(), to: url, method: .post, headers: Headers, encodingCompletion:{(result) in
//                switch(result)
//                {
//                case .success(let request,_,_):
//                    request.uploadProgress(closure: { (prgrs) in
//                        
//                        let progress = Int(prgrs.fractionCompleted * 100)
//                        print(progress)
//                        Progress(progress)
//                    })
//                    request.responseJSON(completionHandler: {(successresponse)in
//                        
//                        switch(successresponse.result)
//                        {
//                        case .success:
//                            let resultValue = successresponse.result.value
//                            print(resultValue!)
//                            Success(successresponse)
//                            break
//                            
//                        case .failure (let error):
//                            
//                            
//                            var networkError = NetworkError()
//                            
//                            if error._code == NSURLErrorTimedOut {
//                                networkError.status = Constant.NetworkErrorType.timout
//                                networkError.message = Constant.NetworkErrorType.timoutError
//                                
//                                Falioure(networkError)
//                            } else if error._code == NSURLErrorNetworkConnectionLost {
//                                networkError.status = Constant.NetworkErrorType.internet
//                                networkError.message = Constant.NetworkErrorType.internetError
//                                
//                                Falioure(networkError)
//                            }else if error._code == NSURLErrorNotConnectedToInternet{
//                                networkError.status = Constant.NetworkErrorType.internet
//                                networkError.message = Constant.NetworkErrorType.internetError
//                                
//                                Falioure(networkError)
//                            }else if error._code == NSURLErrorCannotConnectToHost {
//                                networkError.status = Constant.NetworkErrorType.serverErrorCode
//                                networkError.message = Constant.NetworkErrorType.serverError
//                                
//                                Falioure(networkError)
//                            }else if error._code == NSURLErrorSecureConnectionFailed{
//                                networkError.status = Constant.NetworkErrorType.serverErrorCode
//                                networkError.message = Constant.NetworkErrorType.serverError
//                                
//                                Falioure(networkError)
//                                
//                            }else{
//                                
//                                networkError.status = Constant.NetworkErrorType.generic
//                                networkError.message = Constant.NetworkErrorType.genericError
//                                
//                                Falioure(networkError)
//                            }
//                            break
//                            
//                        }
//                        
//                    })
//                case .failure(let error):
//                    Falioure(error as! NetworkError)
//                }
//                
//            })
//        }
    
    
}
struct NetworkError {
    var status: Int = Constant.NetworkErrorType.generic
    var message: String = Constant.NetworkErrorType.genericError
}

struct NetworkSuccess {
    var status: Int = Constant.NetworkErrorType.generic
    var message: String = Constant.NetworkErrorType.genericError
}

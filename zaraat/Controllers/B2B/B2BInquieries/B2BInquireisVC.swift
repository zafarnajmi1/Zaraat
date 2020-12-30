//
//  B2BInquireisVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/24/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import SDWebImage
import  Alamofire
class B2BInquireisVC: UIViewController {
    @IBOutlet weak var txtinquiry: UITextView!
    var cemeraimg = UIImagePickerController()
       var galleryimage = UIImagePickerController()
    @IBOutlet weak var txtqty: UITextField!
    @IBOutlet weak var lblFromInquiry: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblToInquiry: UILabel!
    @IBOutlet weak var inqimg: UIImageView!
    @IBOutlet weak var btnsend: UIButton!
    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
     var productData : ProductDetail?
    var profileimg : UIImage?
       var filepath = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "Send Inquiry"
        addBackButton()
        setNavigationBarWhiteColor()
        btnsend.roundButton()
        
        subview.layer.cornerRadius =  8
        subview.layer.borderColor =  #colorLiteral(red: 0.7684259415, green: 0.7725404501, blue: 0.7765834928, alpha: 1)
        subview.layer.borderWidth =  1
        
        mainView.layer.cornerRadius =  8
        mainView.layer.borderColor =  #colorLiteral(red: 0.7684259415, green: 0.7725404501, blue: 0.7765834928, alpha: 1)
        mainView.layer.borderWidth =  1
        
        
        txtinquiry.delegate = self
         txtinquiry.textColor = UIColor.lightGray
         txtinquiry.text = "Write your Inquiry"
        txtinquiry.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
        inquiryConfig()
    }
    
    
    
    
    
    
    
    
    
    func inquiryConfig() {
        self.lbltitle.text =  self.productData?.product_title_en
        self.img.sd_setImage(with: URL(string: (self.productData?.featured_image)!))
        self.lblToInquiry.text = "To :" +  (self.productData?.vendor?.company_name)!
        self.lblFromInquiry.text = "From :" +  (ShareData.shareInfo.userInfo?.customer?.first_name)! + " " +  (ShareData.shareInfo.userInfo?.customer?.first_name)!
    }

    @IBAction func attachmentAction(_ sender: UIButton) {
        PickImag()
    }
    
    
    
    
    func PickImag() {
            let alert = UIAlertController(title: "Please Select an Option", message: "", preferredStyle: .actionSheet)
            
    //     alert.setValue(NSAttributedString(string: "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 29, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")
    //
    //        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.green]), forKey: "attributedMessage")
            let Gallry = UIAlertAction(title: "Photo Library", style: .default){ (Picimg) in self.GalleryPic()
            }
            let camraimg = UIAlertAction(title: "Camera", style: .default){ (ac) in self.cemeraPic()
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in self.cancel()
                
            }
            
            alert.addAction(Gallry)
            alert.addAction(camraimg)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            
        }
        func cancel()
        {
            self.galleryimage.dismiss(animated: true, completion: nil)
        }
        
        func cemeraPic()
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                cemeraimg.sourceType = .camera
                cemeraimg.delegate = self
                cemeraimg.allowsEditing = false
                present(cemeraimg, animated: true, completion: nil)
            }
            else {
                
                let alert = UIAlertController(title: "Camera", message: "Camera is not available", preferredStyle: .actionSheet)
                let alertaction = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(alertaction)
                present(alert, animated: true, completion: nil)
                
            }
        }
    
    
    
    
        func GalleryPic()
        {
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
            {
                galleryimage.delegate = self
                galleryimage.allowsEditing = false
                galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
                present(galleryimage, animated: true, completion: nil)
                
            }else{
                
                print("Image is not Available")
                
            }
            
        }
    
    
    func uploadImg() {
        ShareData.showProgress()
        
        userhandler.getUploadinquiryDoc(file: "document", image: profileimg!, Success: {response in
            ShareData.hideProgress()
            if response.success == 1{
                
                self.filepath =  response.document ?? ""
            } else {
                 ShareData.hideProgress()
                 ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            
              ShareData.hideProgress()
              ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
        
    }

    
    
    func checkData()-> Bool {
            if txtinquiry.text == "" {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Inquiry", messagetype: 0)
                return false
            }
            
            return true
            
        }
    
    
    
    
    
    @IBAction func sendAction(_ sender: UIButton) {
        if checkData() {
            sendQuiryApi()
        }
    }
    
    
    func sendQuiryApi() {
        let msg = txtinquiry.text! + "   Quantity Needed : " + txtqty.text!
        let dic : [String:Any] = ["product_id": self.productData?.products_id! ?? 0, "vendor_id":self.productData?.vendor_id! ?? 0, "message":msg,"document": self.filepath]
        ShareData.showProgress()
        userhandler.sendInquiry(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 1)
                self.navigationController?.popViewController(animated: true)
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 1)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message, messagetype: 1)
        })
    }
    
    
}
extension B2BInquireisVC: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your Inquiry" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
            
        }
        
      
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == txtinquiry {
            if textView.text == ""{
            textView.text = "Write your Inquiry"
            textView.textColor = #colorLiteral(red: 0.03339828178, green: 0.1443648934, blue: 0.1944116354, alpha: 1)
            
            }
        }
        
        
        
    }
    
    
    
    
    
    
}
extension B2BInquireisVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        let imge =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        inqimg.image = imge
        self.profileimg =  imge
        //self.mydataUploaded()
        self.mydataUploaded()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func mydataUploaded() {
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
              
        
            AF.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(self.profileimg!.jpegData(compressionQuality: 0.5)!, withName: "document" , fileName: "document", mimeType: "image/jpeg")
            },
                to: "https://apiengine.zaraat.com/api/customers/equiries/document", method: .post , headers: Headers)
                .response { resp in
                    if (resp.error == nil) {
                        
                        print(resp.error)
                       
                       
                    }else {
                         print(resp.error)
                    }
                    


            }
    }
    
}

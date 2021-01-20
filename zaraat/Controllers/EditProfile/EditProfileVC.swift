//
//  EditProfileVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 9/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  SkyFloatingLabelTextField
import  DLRadioButton
import  SDWebImage
class EditProfileVC: UIViewController {

    @IBOutlet weak var txtphonenumber: SkyFloatingLabelTextField!
    @IBOutlet weak var userimage: UIImageView!
    
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var txtlastname: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    
    @IBOutlet weak var btnmale: DLRadioButton!
    
    @IBOutlet weak var btnFemale: DLRadioButton!
     var userdata :  UserProfile?
    var uploadimgData : ImageUpload?
    var gender  = ""
    var profileimg : UIImage?
    var filepath = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Profile"
        addBackButton()
        self.userimage.roundImg()
        setNavigationBarWhiteColor()
        btnsave.roundButton()
        
        self.userimage.layer.borderWidth = 1
        self.userimage.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        configData()
        
    }
    
    
    func configData() {
        self.userimage.sd_imageLoadOperation(forKey: "Downloading")
        self.userimage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.userimage.sd_setImage(with: URL(string: ShareData.shareInfo.userprofile?.user?.picture ?? ""), placeholderImage: UIImage(contentsOfFile: "1"))
        txtphonenumber.text = ShareData.shareInfo.userprofile?.user?.phone
        txtEmail.text = ShareData.shareInfo.userprofile?.user?.email
        txtName.text =  ShareData.shareInfo.userprofile?.user?.first_name
        txtlastname.text =  ShareData.shareInfo.userprofile?.user?.last_name
        lblemail.text = ShareData.shareInfo.userprofile?.user?.email
        lblusername.text = ShareData.shareInfo.userprofile?.user?.first_name ?? "" + (userdata?.user?.last_name)!
        
        if ShareData.shareInfo.userprofile?.user?.gender?.lowercased() == "male" {
            self.gender =  "male"
            btnmale.isSelected = true
            btnFemale.isSelected  = false
        } else if ShareData.shareInfo.userprofile?.user?.gender?.lowercased() == "female"{
            self.gender =  "female"
            btnmale.isSelected = false
            btnFemale.isSelected  = true
        } else {
            btnmale.isSelected = false
            btnFemale.isSelected  = false
            self.gender =  ""
        }
        
    }
  
    @IBAction func updateAction(_ sender: UIButton) {
        PickImag()
    }
    
    
    
    
    func checkData()-> Bool {
            if txtName.text == "" {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The First Name", messagetype: 0)
                return false
            } else if txtlastname.text == "" {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Enter The Last Name", messagetype: 0)
                return false
            } else  if btnFemale.isSelected != false && btnmale.isSelected != false {
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: "Please Select the Gender", messagetype: 0)
                return false
            }
            return true
            
        }
    
    @IBAction func SaveAction(_ sender: UIButton) {
        if checkData() {
            updateProfile()
        }
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
        
        userhandler.getUploadrProfileimg( file: "avatar", image: profileimg!, Success: {response in
            ShareData.hideProgress()
            if response.success == 1{
                self.uploadimgData =  response
                self.filepath =  response.image_paths ?? ""
            } else {
                 ShareData.hideProgress()
                 ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            
              ShareData.hideProgress()
              ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
        
    }

    
    func updateProfile() {
        ShareData.showProgress()
        
        if btnFemale.isSelected == true {
            gender =  "female"
        } else if btnmale.isSelected == true {
            gender =  "male"
        } else {
            gender =  ""
        }
        
        var dic : [String:Any] = [:]
        
        if filepath != "" {
            
            dic = ["first_name":txtName.text!, "last_name":txtlastname.text!,"phone":txtphonenumber.text! , "gender": gender, "avatar": filepath,"email": txtEmail.text!]
        } else {
            dic = ["first_name":txtName.text!, "last_name":txtlastname.text!,"phone":txtphonenumber.text! , "gender": gender,"avatar": ShareData.shareInfo.userprofile?.user?.picture ?? "", "email": txtEmail.text!]
        }
         
        userhandler.UpdatePrfileUser(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success == 1 {
                self.userdata =  response
                ShareData.shareInfo.userProfileData(cate: response)
                self.configData()
                self.navigationController?.popViewController(animated: true)
            } else {
                ShareData.hideProgress()
                ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: response.message ?? "", messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            ZaraatZalert.ZshareAlert.showAlert(title: "Alert", message: error.message , messagetype: 0)
        })
        
    }
    
    
    
    
    
    
}
extension EditProfileVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        userimage.image = img
        self.profileimg =  img
        self.uploadImg()
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

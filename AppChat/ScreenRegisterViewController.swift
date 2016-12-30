//
//  ScreenRegisterViewController.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/27/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit
import Firebase

class ScreenRegisterViewController: UIViewController {
    
    //Bien luu duong dan den avatar
    let storage = FIRStorage.storage()
    

    var imgData: Data!
    
    @IBOutlet weak var uvRegister: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPWD: UITextField!
    @IBOutlet weak var txtRPWD: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnRegister.skin(b: false)
        btnLogin.skin(b: false)
        imgAvatar.skin()
        uvRegister.Login()
        
        imgData = UIImagePNGRepresentation(UIImage(named: "camera")!)
    }
    
    @IBAction func btnRegister_action(_ sender: AnyObject) {
        
        //URL den avatar
        let storageRef = storage.reference(forURL: "gs://appchat-4661f.appspot.com")
        
//Tao new user
        FIRAuth.auth()?.createUser(withEmail: txtEmail.text!, password: txtPWD.text!) { (user, error) in
           
            if (error == nil){
            //Cho phep dang nhap luon khi dang ky thanh cong
                FIRAuth.auth()?.signIn(withEmail: self.txtEmail.text!, password: self.txtPWD.text!) { (user, error) in
                    if (error == nil){
                        print("Dang nhap thanh cong")   //Chac chan dang nhap thanh cong sau khi dang ky thanh cong
                    }
                }

//Cap nhat profile cua user sau khi dang nhap thanh cong
            //UP len storage anh avatar truoc
                //Tao duong dan
                let avatarRef = storageRef.child("images/\(self.txtEmail.text!).jpg")    //Phan biet ten anh theo email dang nhap
                
                //Upload
                let uploadTask = avatarRef.put(self.imgData, metadata: nil) { (metadata, error) in
                    guard let metadata = metadata else { return }   // Loi up avatar
    
                    let downloadURL = metadata.downloadURL()
                    
            //sau khi up avatar thanh cong
                    let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
                    changeRequest?.displayName = self.txtFullName.text!
                    changeRequest?.photoURL = downloadURL
                    changeRequest?.commitChanges() { (error) in
                        if error == nil {
                            
                            print("Success!")
                            let VC = self.storyboard?.instantiateViewController(withIdentifier: "isLogin")
                            self.present(VC!, animated: true, completion: nil)
                            
                        }else {
                            print("Loi update profile")
                        }
                    }
                }
                uploadTask.resume()
                
            } else  //Neu co loi khi dang ky tai khoan thi hien alert
                if let err = error {
                print(err.localizedDescription)
            }
            
        }
    }
    
    
    @IBAction func tapAvatar(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: "Thong bao", message: "Chon", preferredStyle: .alert)
        let btnPhoto: UIAlertAction = UIAlertAction(title: "Photo", style: .default) { (UIAlertAction) in
            
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imgPicker.delegate = self
            imgPicker.allowsEditing = false     //Khong cho chinh sua hinh
            self.present(imgPicker, animated: true, completion: nil)
        }
        let btnCamera: UIAlertAction = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            
            if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
                let imgPicker = UIImagePickerController()
                imgPicker.sourceType = UIImagePickerControllerSourceType.camera
                imgPicker.delegate = self
                imgPicker.allowsEditing = false     //Khong cho chinh sua hinh
                self.present(imgPicker, animated: true, completion: nil)
            }
            else {
                print("Khong co camera")
            }
        }
        alert.addAction(btnPhoto)
        alert.addAction(btnCamera)
        
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
}

extension ScreenRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chooseImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Giam do phan giai tam hinh khi can up len server
        let imgValue = max(chooseImg.size.width, chooseImg.size.height)
        if imgValue > 3000 {
            imgData = UIImageJPEGRepresentation(chooseImg, 0.1) //Compression Quality tu 0 den 1, lay nho nhat la 0.1
        }
        else if imgValue > 2000 {
            imgData = UIImageJPEGRepresentation(chooseImg, 0.3)
        }
        else {
            imgData = UIImagePNGRepresentation(chooseImg)   //De binh thuong, compressionQuality = 1
        }
        
        imgAvatar.image = UIImage(data: imgData)
        
        dismiss(animated: true, completion: nil)
    }
}






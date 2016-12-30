//
//  ViewController.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/25/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPWD: UITextField!
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPWD: UIButton!
    @IBOutlet weak var uvBackgroundLogin: UIView!
    
    @IBAction func btnLogin_action(_ sender: AnyObject) {
        
        let alertActivity = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let activity = UIActivityIndicatorView()

        activity.color = UIColor.red
        activity.center = CGPoint(x: 130.5, y: 25)
        alertActivity.view.addSubview(activity)
        activity.startAnimating()
        activity.hidesWhenStopped = true
        self.present(alertActivity, animated: true, completion: nil)
        FIRAuth.auth()?.signIn(withEmail: txtEmail.text!, password: txtPWD.text!) { (user, error) in
            
            
            if error == nil {
            
                activity.stopAnimating()
                alertActivity.dismiss(animated: true, completion: nil)
                
                self.goToChat()
                
            } else {
                
                activity.stopAnimating()
                alertActivity.dismiss(animated: true, completion: nil)
                
                let alert = UIAlertController(title: "Thong bao", message: "Email or Password wrong!", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(btnOK)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   logOut()
        
        btnForgotPWD.skin(b: false)
        btnLogin.skin(b: true)
        btnRegister.skin(b: true)
        uvBackgroundLogin.Login()
        
        isLogin()
    }
    
    func logOut(){
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    func isLogin(){
        FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            if user != nil {
                self.goToChat()
            }
            else {
                print("Chua dang nhap")
            }
        }
    }

    func goToChat(){
        let viewChat = self.storyboard?.instantiateViewController(withIdentifier: "isLogin")
        if viewChat != nil {
            self.present(viewChat!, animated: true, completion: nil)
        }
        else {
            print("Error")
        }
    }

}




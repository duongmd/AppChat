//
//  ScreenListChatViewController.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/29/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit
import Firebase

var ref: FIRDatabaseReference!

var currentUser: User!      //Dang nhap thanh cong thi do du lieu lay ve vao currentUser

class ScreenListChatViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu.toggleMenu(screen: self)
        
        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

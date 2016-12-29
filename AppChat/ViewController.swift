//
//  ViewController.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/25/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPWD: UIButton!
    @IBOutlet weak var uvBackgroundLogin: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnForgotPWD.skin(b: false)
        btnLogin.skin(b: true)
        btnRegister.skin(b: true)
        uvBackgroundLogin.Login()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


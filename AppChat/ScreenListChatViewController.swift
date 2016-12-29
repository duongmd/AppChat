//
//  ScreenListChatViewController.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/29/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit

class ScreenListChatViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu.toggleMenu(screen: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//
//  ScreenChatViewController.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/28/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit

class ScreenChatViewController: UIViewController {

    @IBOutlet weak var constraintViewText: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHideKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func showHideKeyboard()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(ScreenChatViewController.showKey(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ScreenChatViewController.hideKey(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func showKey(_ notification: Notification)
    {
        let s:NSValue = (notification as NSNotification).userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        let rect:CGRect = s.cgRectValue
        self.constraintViewText.constant = rect.size.height
        UIView.animate(withDuration: 1) { () -> Void in
            self.view.layoutIfNeeded()
            
            
        }
    }
    
    
    func hideKey(_ notification: Notification)
    {
        self.constraintViewText.constant = 0
        UIView.animate(withDuration: 1) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }

}

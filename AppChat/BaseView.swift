//
//  BaseView.swift
//  AppChat
//
//  Created by ✪ Công Thái ✪ on 6/25/16.
//  Copyright © 2016 Huynh Cong Thai. All rights reserved.
//

import UIKit


extension UIBarButtonItem
{
    func toggleMenu(screen:UIViewController)
    {
        self.target = screen.revealViewController()
        self.action = #selector(SWRevealViewController.revealToggle(_:))
        screen.view.addGestureRecognizer(screen.revealViewController().panGestureRecognizer())
    }
}

extension UIView
{
    func Login() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.yellow.cgColor
    }
}

extension UIButton
{
    func skin(b:Bool)
    {
        self.titleLabel?.numberOfLines = 1;
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        self.layer.cornerRadius = 10
        if(b)
        {
            self.layer.borderColor = UIColor.red.cgColor
            self.layer.borderWidth = 1
            self.tintColor = UIColor.red
            self.backgroundColor = UIColor.white
        }
        
    }
}

extension UIImageView
{
    func skin() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}

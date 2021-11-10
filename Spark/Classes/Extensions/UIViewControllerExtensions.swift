//
//  UIViewControllerExtensions.swift
//  Spark
//
//  Created by Alex Roman on 10/19/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func dismissKeyBoardOnView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

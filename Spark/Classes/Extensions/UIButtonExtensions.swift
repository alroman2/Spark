//
//  UIButtonExtensions.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import Foundation
import UIKit

extension UIButton {
    func roundFrame(){
//        self.titleLabel?.font = UIFont(name: "CrosstenSoft Bold", size: 50)
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func gradientButton(primary: CGColor, secondary: CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = self.frame.height/2
        gradientLayer.frame = self.layer.bounds
        
        gradientLayer.colors = [
            UIColor(red: 255/255, green: 184/255, blue: 84/255, alpha: 1.0).cgColor, UIColor(red: 255/255, green: 36/255, blue: 66/255, alpha: 1.0).cgColor
        ]
        self.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 0.0
        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowOffset = CGSize(width: -2.0, height: 5.0)
        gradientLayer.shadowRadius = 3.0
        gradientLayer.shadowOpacity = 1.0
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        self.titleLabel?.textAlignment = .center
        self.contentVerticalAlignment = .center
    }
    
    func whiteButton(){
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.tintColor = UIColor.black
    }
    
    func clearButton(borderColor: UIColor, textColor: UIColor){
        self.setTitleColor(textColor, for: UIControl.State.normal)
        self.backgroundColor = UIColor.clear
        self.tintColor = borderColor
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
    }
    
}

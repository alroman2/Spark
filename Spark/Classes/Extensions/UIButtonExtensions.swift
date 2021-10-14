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
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            primary,
            secondary
        ]
        gradientLayer.cornerRadius = self.layer.cornerRadius
        self.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 0.0
        self.layer.addSublayer(gradientLayer)
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

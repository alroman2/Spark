//
//  SparkStyle.swift
//  Spark
//
//  Created by Alex Roman on 10/10/21.
//

import Foundation
import UIKit

struct SparkStyle {
    
    
    static func setGradient(controllerView: UIView){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = controllerView.bounds
        gradientLayer.colors = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPink.cgColor
        ]
        
        controllerView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    static func setButtonGradient(button: UIButton){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPink.cgColor
        ]
        gradientLayer.cornerRadius = button.layer.cornerRadius
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 0.0
        button.layer.addSublayer(gradientLayer)
        
    }
    
    /**
                Default Spark style buttons. Rounded
     */
    static func setButtonPill(button: UIButton){
        button.titleLabel?.font = UIFont(name: "CrosstenSoft Bold", size: 50)
        button.layer.cornerRadius = button.frame.height/2
    }
    
    static func defaultTextField(textField: UITextField){
        var bottomeLine = CALayer()
        bottomeLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomeLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomeLine)
    }
    
    static func setDefaultStyle(textField: UITextField){
        textField.layer.sublayers?[0].backgroundColor = UIColor.gray.cgColor
        textField.textColor = UIColor.label
    }
    
    
}


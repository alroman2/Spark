//
//  UIViewExtensions.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import Foundation
import UIKit

extension UIView {
    func gradientBackground(primary: CGColor, secondary: CGColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            primary,
            secondary
        ]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

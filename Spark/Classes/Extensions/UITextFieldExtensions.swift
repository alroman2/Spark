//
//  TextFieldExtensions.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import Foundation
import UIKit

extension UITextField {
    func setBoxStyleBottomLine(){
        var bottomeLine = CALayer()
        bottomeLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomeLine.backgroundColor = UIColor.gray.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomeLine)
    }
    func setStateError() {
        self.layer.sublayers?[0].backgroundColor = UIColor.systemRed.cgColor
        self.textColor = UIColor.systemRed
    }
    
    func setStateDefault (){
        self.layer.sublayers?[0].backgroundColor = UIColor.gray.cgColor
        self.textColor = UIColor.label
    }
}

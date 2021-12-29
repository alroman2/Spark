//
//  LoginViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButtons()
        setBGGradient()

        // Do any additional setup after loading the view.
    }
    
    
    private func setBGGradient(){
        self.view.gradientBackground(primary: UIColor(red: 255/255, green: 184/255, blue: 84/255, alpha: 1.0).cgColor, secondary: UIColor(red: 255/255, green: 36/255, blue: 66/255, alpha: 1.0).cgColor)
    }
    
    private func styleButtons(){
        createAccountButton.roundFrame()
        createAccountButton.whiteButton()
        signInButton.roundFrame()
        signInButton.clearButton(borderColor: UIColor.white, textColor: UIColor.white)
        
    }

}



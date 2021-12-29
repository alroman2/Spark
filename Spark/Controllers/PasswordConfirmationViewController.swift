//
//  PasswordConfirmationViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/14/21.
//

import UIKit

class PasswordConfirmationViewController: UIViewController {
    
    var hapticManager: HapticsManager!
    var newPassword: String!
    
    @IBOutlet weak var invalidPasswordLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.becomeFirstResponder()
        hapticManager = HapticsManager()
        passwordTextField.setBoxStyleBottomLine()
        continueButton.roundFrame()
        continueButton.gradientButton(primary: UIColor.systemOrange.cgColor, secondary: UIColor.systemPink.cgColor)
        // Do any additional setup after loading the view.
        
        
    }
    

    @IBAction func onPasswordChange(_ sender: Any) {
        invalidPasswordLabel.isHidden = true
        passwordTextField.setStateDefault()
    }
    
    @IBAction func onContinue(_ sender: Any) {
        if (passwordTextField.text != newPassword!){
            invalidPasswordLabel.isHidden = false
            passwordTextField.setStateError()
            hapticManager?.playError()
            return
        }
        
        //TODO: Make call to account API and save account
        //if account save is successful perform segue
        self.performSegue(withIdentifier: "GameSceneSegue", sender: self)
    }
}

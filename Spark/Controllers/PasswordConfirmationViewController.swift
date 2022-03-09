//
//  PasswordConfirmationViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/14/21.
//

import UIKit
import Firebase
import FirebaseAuth
class PasswordConfirmationViewController: UIViewController {
    
    var hapticManager: HapticsManager!
    var newPassword: String!
    var user:User!
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
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { res, error in
            if let error = error {
                var userCreationAlert = UIAlertController(title: "Error", message: "The server was unable to create the account\(error.localizedDescription)", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default) { action in
                    //...
                }
                
                userCreationAlert.addAction(okAction)
                
                self.present(userCreationAlert, animated: true, completion: nil)
            }
            
            print("successfully created account")
        }
        
        self.performSegue(withIdentifier: "PassToName", sender: self)
    }
}

//
//  PasswordCreatorViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import UIKit

class PasswordCreatorViewController: UIViewController {
    
    var hapticManager: HapticsManager!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var invalidPasswordLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hapticManager = HapticsManager()
        passwordTextField.setBoxStyleBottomLine()
        passwordTextField.becomeFirstResponder()
        continueButton.roundFrame()
        continueButton.gradientButton(primary: UIColor.systemOrange.cgColor, secondary: UIColor.systemPink.cgColor)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPasswordChanged(_ sender: Any) {
        invalidPasswordLabel.isHidden = true
        passwordTextField.setStateDefault()
    }
    
    @IBAction func onContinue(_ sender: Any) {
        if (!verifyPassword(password: passwordTextField.text ?? "")) {
            invalidPasswordLabel.isHidden = false
            passwordTextField.setStateError()
            hapticManager?.playError()
            return
        }
        
        user.password = passwordTextField.text!
        self.performSegue(withIdentifier: "ConfirmPasswordSegue", sender: self)
        
    }
    
    private func verifyPassword(password: String) -> Bool{
        if (!(password.count >= 6)){
            return false
        }
        
        return true
    }


     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a //little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //Get the new view controller using segue.destination.
         //Pass the selected object to the new view controller.
    
        if (segue.identifier == "ConfirmPasswordSegue"){
            let viewController = segue.destination as? PasswordConfirmationViewController
            viewController?.user = self.user
            viewController?.newPassword = passwordTextField.text
        }
    }
    

}

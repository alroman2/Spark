//
//  EmailSignupViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/10/21.
//

import UIKit
import CoreHaptics
import Firebase


class EmailSignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var inavlidEmailLabel: UILabel!
    @IBOutlet weak var sumbitEmailButton: UIButton!
    
    
    var user: User!

    private var hapticManager: HapticsManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        user = User()
        hapticManager = HapticsManager()
        emailTextField.setBoxStyleBottomLine()
        emailTextField.becomeFirstResponder()
        sumbitEmailButton.roundFrame()
        sumbitEmailButton.gradientButton(primary: UIColor(red: 255/255, green: 184/255, blue: 84/255, alpha: 1.0).cgColor, secondary: UIColor(red: 255/255, green: 36/255, blue: 66/255, alpha: 1.0).cgColor)
 
        
    }
    
    /**
            Checks email validity when user is finsihed editing. Enables all user warning upon invalid
            email..
     */
    @IBAction func onSubmitEmail(_ sender: Any) {
        if (isEmailValid(email: emailTextField.text ?? "")){
            //go to next segue
            user.email = emailTextField.text!
            self.performSegue(withIdentifier: "EmailToPassword", sender: self)
            return
        }
        
        inavlidEmailLabel.isHidden = false
        emailTextField.setStateError()
        hapticManager?.playError()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PasswordCreatorViewController{
            vc.user = self.user
        }
        
    }
    
    @IBAction func didEmailChange(_ sender: Any) {
        inavlidEmailLabel.isHidden = true
        
        emailTextField.setStateDefault()
    }
   
    private func isEmailValid(email: String) -> Bool{
        //check if email contains @
        // TODO:check if email is already taken
        let char = "@"
        if (!email.contains(char)) {
            return false
        }
        return true
    }
}

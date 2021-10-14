//
//  EmailSignupViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/10/21.
//

import UIKit
import CoreHaptics

class EmailSignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var inavlidEmailLabel: UILabel!
    @IBOutlet weak var sumbitEmailButton: UIButton!

    private var hapticManager: HapticsManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.dismissKeyboardOnTap()
        emailTextField.becomeFirstResponder()
        emailTextField.setBoxStyleBottomLine()
        sumbitEmailButton.roundFrame()
        sumbitEmailButton.gradientBackground(primary: UIColor.systemOrange.cgColor, secondary: UIColor.systemPink.cgColor)
        //setup core engine for haptics
        hapticManager = HapticsManager()
        //setupHapticsEngine()
        
    }
    
    /**
            Checks email validity when user is finsihed editing. Enables all user warning upon invalid
            email..
     */
    @IBAction func onSubmitEmail(_ sender: Any) {
        if (isEmailValid(email: emailTextField.text ?? "")){
            //go to next segue
            self.performSegue(withIdentifier: "verifyEmailSegue", sender: self)
            return
        }
        
        inavlidEmailLabel.isHidden = false
        emailTextField.setStateError()
        hapticManager?.playError()
        
        
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
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func dismissKeyboardOnTap(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

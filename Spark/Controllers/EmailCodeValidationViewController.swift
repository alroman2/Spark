//
//  EmailCodeValidationViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import UIKit
import Firebase
import FirebaseAuth

class EmailCodeValidationViewController: UIViewController {
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var invalidCodeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    var hapticManager: HapticsManager!
    var user:User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hapticManager = HapticsManager()
        codeTextField.setBoxStyleBottomLine()
        codeTextField.becomeFirstResponder()
        continueButton.roundFrame()
        continueButton.gradientButton(primary: UIColor.systemOrange.cgColor, secondary: UIColor.systemPink.cgColor)
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            if let error = error {
                let alert = UIAlertController(title: "Unable to send Email", message: "There was an error sending the verification email", preferredStyle: .alert)
                
                let button = UIAlertAction(title: "Okay", style: .default, handler: nil)
                
                alert.addAction(button)
                self.present(alert, animated: true, completion: nil)
            }
            
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.checkEmailVerification), userInfo: nil, repeats: true)

        })
        
    }
    @objc func checkEmailVerification(){
        if ((Auth.auth().currentUser?.isEmailVerified) != false){
            self.performSegue(withIdentifier: "CodeToName", sender: self)
        }
    }
    
    @IBAction func onCodeChange(_ sender: Any) {
        invalidCodeLabel.isHidden = true
        codeTextField.setStateDefault()
    }
    
    private func isCodeValid(code: String) -> Bool{
        //TODO: Check if code is valid on backend as well
        //TODO: change code count to only be 6
        if (!(code.count <= 6 && code.count > 0)){
            return false
        }
        
        return true
    }
    

    @IBAction func onCodeSubmission(_ sender: Any) {
        if (!isCodeValid(code: codeTextField.text ?? "")) {
            invalidCodeLabel.isHidden = false
            codeTextField.setStateError()
            hapticManager?.playError()
            return
        }
        
        performSegue(withIdentifier: "createUsernameSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

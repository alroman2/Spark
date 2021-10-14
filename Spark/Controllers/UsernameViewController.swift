//
//  usernameViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import UIKit

class UsernameViewController: UIViewController {

    @IBOutlet weak var invalidUsernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    var hapticManager: HapticsManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hapticManager = HapticsManager()
        usernameTextField.setBoxStyleBottomLine()
        usernameTextField.becomeFirstResponder()
        continueButton.roundFrame()
        continueButton.gradientButton(primary: UIColor.systemOrange.cgColor, secondary: UIColor.systemPink.cgColor)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onContinue(_ sender: Any) {
        if (!isUsernameValid(username: usernameTextField.text ?? "")){
            invalidUsernameLabel.isHidden = false
            usernameTextField.setStateError()
            hapticManager?.playError()
            return
        }
        self.performSegue(withIdentifier: "PasswordCreatorSegue", sender: self)
        
    }
    
    @IBAction func onUsernameChange(_ sender: Any) {
        invalidUsernameLabel.isHidden = true
        usernameTextField.setStateDefault()
    }
   
    
    
    /**
                Verifies that the username conforms with restricions. The username should not exist in the databse
     */
    private func isUsernameValid(username: String ) -> Bool{
        //TODO: Add check to see if username has already been taken
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

//
//  EmailCodeValidationViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import UIKit

class EmailCodeValidationViewController: UIViewController {
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var invalidCodeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    var hapticManager: HapticsManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hapticManager = HapticsManager()
        codeTextField.setBoxStyleBottomLine()
        codeTextField.becomeFirstResponder()
        continueButton.roundFrame()
        continueButton.gradientButton(primary: UIColor.systemOrange.cgColor, secondary: UIColor.systemPink.cgColor)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

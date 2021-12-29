//
//  SingleSignOnViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/19/21.
//

import UIKit
import SpriteKit

class SingleSignOnViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var welcomeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.setBoxStyleBottomLine()
        passwordTextField.setBoxStyleBottomLine()
        submitButton.roundFrame()
        submitButton.gradientButton(primary: UIColor.white.cgColor, secondary: UIColor.white.cgColor)
        self.dismissKeyBoardOnView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Form Edit Events
    @IBAction func didEmailEditBegin(_ sender: Any) {
        hideImages()
    }
    
    @IBAction func didEmailEditEnd(_ sender: Any) {
        unhideImages()
    }
    
    @IBAction func didPasswordEditBegin(_ sender: Any) {
        hideImages()
    }
    
    
    @IBAction func didPasswordEditEnd(_ sender: Any) {
        unhideImages()
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        //TODO: Implement sign authentication
        performSegue(withIdentifier: "SparkControllerSegue", sender: self)
    }
    
    
    //MARK: UI Helper
    private func hideImages(){
        UIView.transition(with: welcomeImageView, duration: 0.8, options: .transitionCrossDissolve,
                          animations: { self.welcomeImageView.isHidden = true})
    }
    
    private func unhideImages(){
        UIView.transition(with: welcomeImageView, duration: 0.8, options: .transitionCrossDissolve,
                          animations: { self.welcomeImageView.isHidden = false})
    }

}

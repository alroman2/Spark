//
//  CreateSparkViewController.swift
//  Spark
//
//  Created by Alex Roman on 3/9/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class CreateSparkViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextLabel: UILabel!
    @IBOutlet weak var submitSparkButton: UIButton!
    
    var API: NetworkWrapper!
    override func viewDidLoad() {
        super.viewDidLoad()
        API = NetworkWrapper()
        submitSparkButton.roundFrame()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreateSpark(_ sender: Any) {
        API.doesUserExist(userEmail: emailTextField.text ?? "") { document, err in
            if let err = err {
                let alert = UIAlertController(title: "User doesn't exist", message: "Check the email, or try again", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.API.createSpark(baseUser: Auth.auth().currentUser?.email ?? "", to: self.emailTextField.text ?? "") { () in
                    
                }
            }
        }
    }
}

//
//  SparksViewController.swift
//  Spark
//
//  Created by Alex Roman on 3/8/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class SparksViewController: UIViewController {

    @IBOutlet weak var SparksTableView: UITableView!
    
 
    var sparks: [[String:Any]]! = [[:]]
    var sparkCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SparksTableView.dataSource = self
        SparksTableView.delegate   = self
        getSparks()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getSparks()
    }
    

    func emptyTableMessage(with message: String){
        let messageLabel = UILabel(frame: CGRect(x: 0,y: 0, width: self.SparksTableView.bounds.size.width, height: self.SparksTableView.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        SparksTableView.backgroundView = messageLabel
        SparksTableView.separatorStyle = .none
    }
    
    func restoreTable(){
        SparksTableView.backgroundView = nil
        SparksTableView.separatorStyle = .singleLine
    }
    
    func getSparks(){
        let API  = NetworkWrapper()
        API.getAllSparks { query, error in
            if error != nil {
                print("Unable to do get documents")
            } else {
                for document in query!.documents {
                    
                    print("Data: \(document.data())")
                    self.sparks.append(document.data())
                }
                
                self.SparksTableView.reloadData()
            }
        }
        
    }
}

extension SparksViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sparks.count == 0 {
            emptyTableMessage(with: "No Sparks have been added - lets create one")
        } else {
            restoreTable()
        }
        
        return sparks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SparksTableView.dequeueReusableCell(withIdentifier: "SparkTableViewCell") as! SparkTableViewCell
        let spark = sparks[indexPath.row]
        let usersArray = spark["users"] as? [String] ?? [""]
        cell.emailLabel.text = usersArray[0] as? String ?? "user"
        cell.healtlhLabel.text = "\(spark["Health"] ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ToSpark", sender: self)
    }
    
    
    
}

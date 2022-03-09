//
//  User.swift
//  Spark
//
//  Created by Alex Roman on 3/8/22.
//

import Foundation


struct User {
    var email:String
    var password:String
    var confirmationCode:String
    
     init(email:String, password: String, confirmationCode: String)
    {
        
        self.email = email
        self.password = password
        self.confirmationCode = confirmationCode
    }
    
     init(){
        email = ""
        password = ""
        confirmationCode = "" 
    }
    
}

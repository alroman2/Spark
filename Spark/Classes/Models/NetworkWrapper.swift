//
//  NetworkWrapper.swift
//  Spark
//
//  Created by Alex Roman on 3/8/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import UIKit


class NetworkWrapper {
    
    let db:Firestore!
    
    init(){
        db = Firestore.firestore()
    }
    
  
    
    func getAllCurrentUserSparks(completion: @escaping (DocumentSnapshot?, Error?)->Void){
        let ref = db.collection("Users")
        let userDoc = ref.document("\(String(describing: Auth.auth().currentUser?.uid))")
        userDoc.getDocument { document, err in
            completion(document,err)
        }
    }
    
    func getAllSparks(completion: @escaping (QuerySnapshot?, Error?)->Void){
        let ref = db.collection("Sparks")
        ref.whereField("users", arrayContainsAny: [Auth.auth().currentUser?.email!]).getDocuments { query, err in
            completion(query, err)
        }
        
    }
    
    func getSpark(by path:String, completion: @escaping (DocumentSnapshot?, Error?)->Void){
        let ref = db.collection("Sparks")
        let sparkDoc = ref.document(path)
        sparkDoc.getDocument { snapshot, err in
            completion(snapshot, err)
        }
    }
    

    
    func doesUserExist(userEmail: String,  completion: @escaping (QuerySnapshot?, Error?)->Void) {
        let ref = db.collection("Users")
        ref.whereField("Email", in: [userEmail]).getDocuments { snapshot, err in
            completion(snapshot,err)
        }
    }
    
    
    
    func createSpark(baseUser: String,to otherUser: String, completion: @escaping ()->Void){
        let worldRef = db.collection("Worlds")
        
        let ref = db.collection("Sparks")
        
        let newWorldRef = worldRef.addDocument(data: ["Growth": 0, "TreesCount": 0, "GrassCount": 0], completion: { error in
            
        })
        
                             
        let newSparkRef = ref.addDocument(data: ["users": FieldValue.arrayUnion([baseUser,otherUser]),"Health": 0, "Worlds": newWorldRef.path])
        
        let usersRef = db.collection("Users")
        
        usersRef.whereField("email", in: [baseUser, otherUser]).getDocuments { snapshot, error in
            if error != nil {
                print("Unable to add sparks to users")
            } else {
                for doc in snapshot!.documents {
                    doc.reference.updateData(["Sparks": FieldValue.arrayUnion([newSparkRef.path])])
                }
            }
        }
        
        
        
    }
    
}

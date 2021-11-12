//
//  Tree.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation
import SceneKit



class Tree: WorldObject {
   
   
    
    
    /// Initialize a Tree object and it's respective model
    /// - Parameters:
    ///   - fileName: name of asset
    ///   - fileType: inherits scenekit accepted filetypes
    ///   - dir: directory path from project root
    init(fileName:String, fileType:String, dir:String){
        super.init()
        
        try? loadModel(fileName: fileName, fileType: fileType, dir: dir)
    }
    
    
   
    
    
    
    
}

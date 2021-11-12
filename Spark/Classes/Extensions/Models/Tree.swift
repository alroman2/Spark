//
//  Tree.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation
import SceneKit



class Tree {
    private var geometry: SCNGeometry!
    private var refNode: SCNReferenceNode!
    
    
    /// Initialize a Tree object and it's respective model
    /// - Parameters:
    ///   - fileName: name of asset
    ///   - fileType: inherits scenekit accepted filetypes
    ///   - dir: directory path from project root
    init(fileName:String, fileType:String, dir:String){
        try? loadModel(fileName: fileName, fileType: fileType, dir: dir)
    }
    
    
    /// initializes the corresponding SCNNode for the tree, throws invalid model if the file does not exist or cannot be found
    private func loadModel(fileName: String, fileType: String, dir: String) throws {
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: dir) {
            //attatch model to node
            let url = URL(fileURLWithPath: filePath)
            
            refNode = SCNReferenceNode(url: url)
            refNode?.load()
        } else {
            //throw error
            throw WorldDataError.invalidModel
        }
    }
    
    
    
    
}

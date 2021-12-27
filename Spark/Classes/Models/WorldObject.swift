//
//  WorldObject.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation
import SceneKit

class WorldObject {
    
    var refNode:SCNReferenceNode!
    var vertices: [SCNVector3]!
    
    
    // --MARK: Public Methods
    
    
    /// Loads the world object with a referenced file. The file must be compatible with SCNRefereceNode accepted types.
    /// - Parameters:
    ///   - fileName: The name of the file asset
    ///   - fileType: A compatible file type postfix
    ///   - dir: A directory path to the file from the project root
     func loadModel(fileName: String, fileType: String, dir: String) throws {
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: dir) {
            //attatch model to node
            let url = URL(fileURLWithPath: filePath)
            
            refNode = SCNReferenceNode(url: url)
            refNode.name = "\(fileName)_Ref_Node"
            refNode?.load()
            
            //cache geometry vertices upon successful load
            cacheVertices()
        } else {
            //throw error
            throw WorldDataError.invalidModel
        }
    }
    
   
    /// Temporarily stores the vertices of the world object model. The method should be called intermittenly  when the model changes.
    func cacheVertices(){
        vertices = refNode.geometry?.vertices()
    }
    
    
    // -- MARK: Private Methods
    
}

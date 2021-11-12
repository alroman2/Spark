//
//  WorldObject.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation
import SceneKit

class WorldObject {
    public var refNode:SCNReferenceNode!
    
    init(){
        
    }
    
    // --MARK: Public Methods
    
     func loadModel(fileName: String, fileType: String, dir: String) throws {
        
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
    
    /// Calculates a translation vector by calculating the minimum distance between two coordinate points
    /// - Parameters:
    ///   - startingVector: The initial positon
    ///   - EndVector: The final or target position
    /// - Returns: The distance between the two
     func coordinateTranslation(startingVector: SCNVector3, EndVector: SCNVector3) -> SCNVector3{
        var translationVector: SCNVector3 = SCNVector3()
        
        translationVector.x = EndVector.x - startingVector.x
        translationVector.y = EndVector.y - startingVector.y
        translationVector.z = EndVector.z - startingVector.z
        
        return translationVector
    }
    
    
    // -- MARK: Private Methods
    
}

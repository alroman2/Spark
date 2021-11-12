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

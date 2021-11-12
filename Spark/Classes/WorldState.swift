//
//  WorldStateManager.swift
//  Spark
//
//  Created by Alex Roman on 10/29/21.
//

import Foundation
import SceneKit

// how to add terrain to scene
//terrainScene?.rootNode.enumerateChildNodes({ node, stop in
//    if let name = node.name, name.contains(nodeName){
//        modelCopy = referenceNode!.clone()
//         node name referes to parent node of terrain
//        node.addChildNode(modelCopy!)
//    }
class WorldState{
    var terrain:Terrain!
    
    
    func initializeTerrain(){
        terrain = Terrain(width: 3, length: 3, height: 0)
    }
    
}

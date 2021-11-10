//
//  WorldStateManager.swift
//  Spark
//
//  Created by Alex Roman on 10/29/21.
//

import Foundation
import SceneKit

class WorldState{
    var terrain:Terrain!
    
    
    func initializeTerrain(){
        terrain = Terrain(width: 3, length: 3, height: 0)
    }
    
}

//
//  WorldStateManager.swift
//  Spark
//
//  Created by Alex Roman on 10/29/21.
//

import Foundation
import SceneKit

class WorldState{
    var terrains = [Terrain]()
    
    init() {
        initializeTerrain()
    }
    
    func initializeTerrain(){
        let terrain = Terrain(width: 1, length: 1, height: 1)
        terrains.append(terrain);
        
    }
    
    func spawnCopy(_ object: Tree, on terrain: Terrain)  {
        //random Terrain sector
        var modelCopy: SCNNode?
        
        let z = Int.random(in: 0...terrain.width-1)
        let x = Int.random(in: 0...terrain.length-1)
        
        let terrainSectorNode = terrain.grid[z][x]
        
        
        //clone the model
        modelCopy = object.refNode!.clone()
        
        //add clone to terrain sector node
        terrainSectorNode.addChildNode(modelCopy!)
        
        
        //get all vertices of terrain
        let vertices = terrainSectorNode.childNodes[0].childNodes[0].geometry?.vertices()
        
        //get valid spawn coordinates from vertices
        let spawnCoordinate = validSpawnCoordinate(vertices: vertices!)
        
        //translate the clone to the coordinates
        modelCopy?.localTranslate(by: coordinateTranslation(from: modelCopy!.position, to: (modelCopy?.convertPosition(spawnCoordinate, from: terrainSectorNode.childNodes[0].childNodes[0]))! ) )
    }
    
    
    ///  Generates a randomize spawn point from a list of vertices
    /// - Parameter node: The terrain node
    func validSpawnCoordinate(vertices: [SCNVector3]) -> SCNVector3{
        var spawnCoordinate:SCNVector3 = SCNVector3()
        let randIndex = Int.random(in: 0...vertices.count)
        spawnCoordinate = vertices[randIndex]
        return spawnCoordinate
    }
    
    /// Calculates a translation vector by calculating the minimum distance between two coordinate points
    /// - Parameters:
    ///   - startingVector: The initial positon
    ///   - EndVector: The final or target position
    /// - Returns: The distance between the two
     func coordinateTranslation(from startingVector: SCNVector3, to endVector: SCNVector3) -> SCNVector3{
        var translationVector: SCNVector3 = SCNVector3()
        
        translationVector.x = endVector.x - startingVector.x
        translationVector.y = endVector.y - startingVector.y
        translationVector.z = endVector.z - startingVector.z
        
        return translationVector
    }
    
    
}

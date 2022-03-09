//
//  WorldStateManager.swift
//  Spark
//
//  Created by Alex Roman on 10/29/21.
//

import Foundation
import SceneKit
import GameplayKit

class WorldState {
    var health: Int!
    var growth: Double!
    var tree: Tree!
    var grass: Grass?
    var terrains = [Terrain]()
    
    //var spawnMap = [[SCNNode]]!
    
    //default
    init() {
        initializeTerrain(_of: 1, 1, 0)
        health = 100;
        growth = 0;
        tree = Tree(fileName: "tree", fileType: "scn", dir: "/Art.scnassets/Vegetation")
        grass = Grass(fileName: "grass", fileType: "scn", dir: "/Art.scnassets/Vegetation")
        
    }
    
    func initializeTerrain(_of width: Int,_ length: Int,_ height:Int){
        let terrain = Terrain(width:width , length: length , height: height)
       // spawnMap = [[SCNNode]](repeating: [SCNNode](repeating: SCNNode(), count: width), count: length)
        terrains.append(terrain);
    }
    
    
    
    func update(){
        var randNum = Int.random(in: 0...2)
        var randNum2 = Int.random(in: 0...200)
        if (1 == 2){
            
            randomlySpawnCopy(grass!, on: terrains[0])
            
        }
        if (randNum2 == 6){
            randomlySpawnCopy(tree, on: terrains[0])
        }
        
        
        
    }
    
    /// Places the object at the coordinate space in the world
    /// - Parameters:
    ///   - object: The object
    ///   - coordinate: The placement location
    func place(_ object: WorldObject, at coordinate: SCNVector3 ){
        object.refNode.worldPosition.x = coordinate.x
        object.refNode.worldPosition.y = coordinate.y
        object.refNode.worldPosition.z = coordinate.z
    }
    
    
    /// Places a copy of the object at the coordinate location of the Terrain. While place objects at center of the grid
    /// - Parameters:
    ///   - object: 
    ///   - coordinate:
    ///   - terrain:
    func spawnCopy(_ object: WorldObject, at coordinate: GridPoint, on terrain: Terrain) throws {
        
        guard (terrain.gridContains(x: coordinate.x, y: coordinate.y, z: coordinate.z)) else {
            throw WorldDataError.spawnOutOfBounds
        }
        var modelCopy: SCNNode!

        let z = coordinate.z
        let x = coordinate.x
        let terrainSectorNode = terrain.grid[z][x]
        modelCopy = object.refNode.clone()
        place(object, at: SCNVector3(coordinate.x, coordinate.y, coordinate.z))
        
    }
    
    func randomlySpawnCopy(_ object: WorldObject, on terrain: Terrain)  {
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
    
    func restrictSpawn(at bounds: SCNBoundingVolume){
        
    }
    
    func randomlySpawnCopy(_ object: WorldObject, on terrain: Terrain, with offset: Float)  {
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
    
//    private func randomlyOffsetVector(_ position:SCNVector3, by offset: Float,with bound: SCNBoundingVolume  ) -> SCNVector3 {
//        // pick random offset
//        let randomizer = GKRandomDistribution()
//
//
//
//        //case: all positions can be offset
//
//
//        //case: an offset will cause the position to be out bounds
//    }
//
    
    ///  Generates a randomize spawn point from a list of vertices
    /// - Parameter node: The terrain node
    func validSpawnCoordinate(vertices: [SCNVector3]) -> SCNVector3{
        var spawnCoordinate:SCNVector3 = SCNVector3()
        let randIndex = Int.random(in: 0...(vertices.count - 1))
        spawnCoordinate = vertices[randIndex]
        return spawnCoordinate
    }
    
    
    

    /// Calculates a translation vector by calculating the minimum distance between two coordinate points
    /// - Parameters:
    ///   - startingVector: The initial positon
    ///   - EndVector: The final or target position
    /// - Returns: The euclidian distance between the two
     func coordinateTranslation(from startingVector: SCNVector3, to endVector: SCNVector3) -> SCNVector3{
        var translationVector: SCNVector3 = SCNVector3()
        
        translationVector.x = endVector.x - startingVector.x
        translationVector.y = endVector.y - startingVector.y
        translationVector.z = endVector.z - startingVector.z
        
        return translationVector
    }
    
    
}


extension WorldState {
  
}

//
//  Terrain.swift
//  Spark
//
//  Created by Alex Roman on 10/20/21.
//

import Foundation
import SceneKit




///The terrain class models terrain data and functions
///Accessing or Modify Terrain Properties Should be done before attatching a reference to another scene
class Terrain: WorldObject {
    //TODO: Change terrain geometry to accecpt reference to an external file (Collada)
    
    var width: Int!
    var length: Int!
    var height: Int!
    
    var grid: [[SCNNode]]!
    var parentNode:SCNNode!
     
    
    
    
    /**
     Intialize a terrain with properties, the proporties will determine the grid size of the generated world. The grid size is dependent on spacing
     between nodes in the scene and the models attached to the nodes.
     */
    init(width: Int, length: Int, height: Int){
        super.init()
        
        self.width = width
        self.length = length
        self.height = height
        
        grid = [[SCNNode]](repeating: [SCNNode](repeating: SCNNode(), count: width), count: length)
        
        parentNode = SCNNode()
        parentNode.name = "Terrain Parent Node"
        
      
        
        //loads model as ref node into Terrain
        try? loadModel(fileName: "Terrain_Suraface_Flat", fileType: "scn", dir: "/Art.scnassets/Terrain")
        createNodeGrid(zSize: width, xSize: length)
        loadGridModels()
        //try? generateTree(fileName: "tree", fileType: "scn", directory: "/Art.scnassets/Vegetation")
        
        
    }
    
    
    // --MARK: Node Generation
    
    
    
    /// Creates a zSize*xSize grid of nodes under a parent node. The grid nodes are stored in the terrainGrid
    /// - Parameters:
    ///   - zSize: The size of the grid in the Z-Direction
    ///   - xSize: The sie of the grind in the X-Direnction
    private func createNodeGrid(zSize: Int, xSize:Int){
        var nodeCount = 0
        let y = 0
        
        for z in 0...(zSize-1) {
            //grid.append([SCNNode]())
            for x in 0...(xSize-1) {
                let terrainNode = SCNNode()
                terrainNode.name = "Terrain_Node.\(nodeCount)"
                terrainNode.position = nextNodePosition(x: x, y: y, z: z)
                parentNode.addChildNode(terrainNode)
                grid[z][x] = terrainNode
                nodeCount += 1
            }
        }
        
        
    }
    
    
    /// Attatches each node in the Terrain grid with the reference node that holds the desired model
    private func loadGridModels(){
        var refModelCopy:SCNNode!
        
        parentNode.enumerateChildNodes { node, stop in
            if let name = node.name, name.contains("Terrain_Node.") {
                refModelCopy = refNode.clone()
                node.addChildNode(refModelCopy)
            }
        }
    }
    
    /// Converts a SCNNode X,Y,X postition from Int to a SCNVector3
    /// - Parameters:
    ///   - x: x-coordinate as Int
    ///   - y: y-coordinate as Int
    ///   - z: z-coordinate as Int
    /// - Returns: SCNVector
    private func nextNodePosition(x: Int, y: Int, z: Int) -> SCNVector3 {
        //TODO: Add method to allow the coordiantes to be transformed either individually or together
        return SCNVector3(x: Float(x), y: Float(y), z: Float(z))
    }
    
    
    // --MARK: Model Generation
   
    
    
    /// Spawns a tree model in a random coordinate of a terrain node
    /// - Parameters:
    ///   - fileName: The relative path of the model
    ///   - nodeName: The node name of the desired terrain node
//    func generateTree(fileName: String, fileType: String, directory: String) throws {
//        //Art.scnassets/Vegetation/tree.scn
//        let nodeName = "Terrain_Node."
//        var modelCopy: SCNNode?
//
//        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: directory) {
//            let referenceURL = URL(fileURLWithPath: filePath)
//
//            let referenceNode = SCNReferenceNode(url: referenceURL)
//            referenceNode!.load()
//
//            terrainScene?.rootNode.enumerateChildNodes({ node, stop in
//                if let name = node.name, name.contains(nodeName){
//                    modelCopy = referenceNode!.clone()
//                    node.addChildNode(modelCopy!)
//
//                    let vertices = node.childNodes[0].childNodes[0].geometry?.vertices()
//
//                    let spawnPoint = validSpawnCoordinate(vertices: vertices!)
//
//                    modelCopy?.localTranslate(by: coordinateTranslation(startingVector: modelCopy!.position, EndVector: spawnPoint))
//                }
//            })
//        } else {
//            throw WorldDataError.invalidModel
//        }
//
//    }
    
    
   
    
    
   
    
    
    // MARK: Debugging Options
    
    /// Creates a visible geometry that can attatch to scene nodes to allow for visible debugging
    /// - Returns: A SCNSphere
    private func nodeDebugGeometry() -> SCNGeometry{
        let shape = SCNSphere(radius: 0.1)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.black
        shape.materials = [material]
        return shape
    }
    
    
//
//    /// Allows specified nodes to be visible in the Scene
//    /// - Parameter nodeName: The name of a SCNNode
//    public func enableVisibleNodes(nodeName:String){
//        terrainScene?.rootNode.enumerateChildNodes({ node, stop in
//            if let name = node.name, name.contains(nodeName){
//                node.geometry = nodeDebugGeometry()
//            }
//        })
//    }
    //end class
}



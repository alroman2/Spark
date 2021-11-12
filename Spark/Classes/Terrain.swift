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
class Terrain {
    //TODO: Change terrain geometry to accecpt reference to an external file (Collada)
    
    private var terrainWidth: Int!
    private var terrainLength: Int!
    private var terrainHeight: Int!
    private var terrainGeometry: SCNGeometry?
    var terrainScene: SCNScene?
    
    
    /**
     Intialize a terrain with properties, the proporties will determine the grid size of the generated world. The grid size is dependent on spacing
     between nodes in the scene and the models attached to the nodes.
     */
    init(width: Int, length: Int, height: Int){
        
        terrainWidth = width
        terrainLength = length
        terrainHeight = height
        
        terrainScene = SCNScene()
        
        spawnNodes(zSize: terrainWidth, xSize: terrainLength)
        try! loadModel(fileName: "Terrain_Suraface_Flat", fileType: "scn", directory: "/Art.scnassets/Terrain")
        try? generateTree(fileName: "tree", fileType: "scn", directory: "/Art.scnassets/Vegetation")
    }
    
    
    // --MARK: Node Generation
    
    
    
    /// Creates a zSize*xSize grid of nodes, and attatches them to the Terrain Scene starting at the origin.
    /// - Parameters:
    ///   - zSize: The size of the grid in the Z-Direction
    ///   - xSize: The sie of the grind in the X-Direnction
    private func spawnNodes(zSize: Int, xSize:Int){
        var nodeCount = 0
        let y = 0
        let terrainParentNode = SCNNode()
        terrainParentNode.name = "Terrain Parent Node"
        
        for z in 0...(zSize-1) {
            for x in 0...(xSize-1) {
                let terrainNode = SCNNode()
                terrainNode.name = "Terrain_Node.\(nodeCount)"
                terrainNode.position = nextNodePosition(x: x, y: y, z: z)
                terrainParentNode.addChildNode(terrainNode)
                nodeCount += 1
            }
        }
        terrainScene?.rootNode.addChildNode(terrainParentNode)
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
    
    /// Loads all specified terrain nodes with a specific model.
    /// - Parameter fileName: The relative location of the model file name
    /// - Parameter nodeName: The name of a desired node
    private func loadModel(fileName:String, fileType: String, directory: String) throws {
        let nodeName = "Terrain_Node."
        var modelCopy: SCNNode?
        
        
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: directory){
            let referenceURL = URL(fileURLWithPath: filePath)
            
            let referenceNode = SCNReferenceNode(url: referenceURL)
            referenceNode!.load()
            
            
            //print(referenceNode?.childNodes[0].geometry?.vertices())
            terrainScene?.rootNode.enumerateChildNodes({ node, stop in
                if let name = node.name, name.contains(nodeName){
                    modelCopy = referenceNode!.clone()
                    
                    node.addChildNode(modelCopy!)
                    //print(node.childNodes[0].childNodes[0].geometry?.elementCount)
                    //node.geometry = modelCopy?.geometry
                }
            })
            
        } else {
            throw WorldDataError.invalidModel
        }
        
        
    }
    
    
    /// Spawns a tree model in a random coordinate of a terrain node
    /// - Parameters:
    ///   - fileName: The relative path of the model
    ///   - nodeName: The node name of the desired terrain node
    func generateTree(fileName: String, fileType: String, directory: String) throws {
        //Art.scnassets/Vegetation/tree.scn
        let nodeName = "Terrain_Node."
        var modelCopy: SCNNode?
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: directory) {
            let referenceURL = URL(fileURLWithPath: filePath)
            
            let referenceNode = SCNReferenceNode(url: referenceURL)
            referenceNode!.load()
            
            terrainScene?.rootNode.enumerateChildNodes({ node, stop in
                if let name = node.name, name.contains(nodeName){
                    modelCopy = referenceNode!.clone()
                    node.addChildNode(modelCopy!)
                    
                    let vertices = node.childNodes[0].childNodes[0].geometry?.vertices()
                    
                    let spawnPoint = validSpawnCoordinate(vertices: vertices!)
                    
                    modelCopy?.localTranslate(by: coordinateTranslation(startingVector: modelCopy!.position, EndVector: spawnPoint))
                }
            })
        } else {
            throw TerrainError.invalidModel
        }
        
    }
    
    
    ///  Generates a randomize spawn point from a list of vertices
    /// - Parameter node: The terrain node
    private func validSpawnCoordinate(vertices: [SCNVector3]) -> SCNVector3{
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
    private func coordinateTranslation(startingVector: SCNVector3, EndVector: SCNVector3) -> SCNVector3{
        var translationVector: SCNVector3 = SCNVector3()
        
        translationVector.x = EndVector.x - startingVector.x
        translationVector.y = EndVector.y - startingVector.y
        translationVector.z = EndVector.z - startingVector.z
        
        return translationVector
    }
    
    
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
    
    
    
    /// Allows specified nodes to be visible in the Scene
    /// - Parameter nodeName: The name of a SCNNode
    public func enableVisibleNodes(nodeName:String){
        terrainScene?.rootNode.enumerateChildNodes({ node, stop in
            if let name = node.name, name.contains(nodeName){
                node.geometry = nodeDebugGeometry()
            }
        })
    }
    //end class
}

extension SCNGeometry {
    
    ///   Calculates a the corresponding vertex data points that make up the SCNGeometry
    /// - Returns: A list of SCNVector3
    func vertices() -> [SCNVector3]? {
        let sources = self.sources(for: .vertex)
        
        guard let source = sources.first else {
            print("Unable get the first geometry element")
            return nil
        }
        
        let stride = source.dataStride / source.bytesPerComponent
        let offset = source.dataOffset / source.bytesPerComponent
        
        let vectorCount = source.vectorCount
        
        print("stride: \(stride)")
        print("offset: \(offset)")
        print("vectorCount: \(vectorCount)")
        return source.data.withUnsafeBytes { (buffer: UnsafePointer<Float>) -> [SCNVector3] in
            var result = Array<SCNVector3>()
            
            for i in 0...vectorCount - 1 {
                let start = i * stride + offset
                let x = buffer[start]
                let y = buffer[start + 1]
                let z = buffer[start + 2]
                
                
                result.append(SCNVector3(x,y,z))
            }
            
            return result
        }
    }
    
}


//
//  TestingViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/20/21.
//

import UIKit
import SceneKit

class TestingViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var SpawnTreeButton: UIButton!
    
    var scene: SCNScene!
    var worldScene: WorldScene!
    var world: WorldState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        // Do any additional setup after loading the view.
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

    func setupScene(){
        //setup camera
        worldScene = WorldScene()
        
        //var terrain = Terrain(width: 3, length: 3, height: 0)
       
        //sceneView.allowsCameraControl = true
        //scene = SCNScene()
        //let tarrainReference = SCNReferenceNode(coder: terrain.terrainScene?.rootNode as! SCNNode)
        
        sceneView.scene = worldScene.root
        sceneView.showsStatistics = false
        //sceneView.debugOptions = [.showWireframe,.showBoundingBoxes]
        //sceneView.debugOptions = [.showBoundingBoxes]
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        //setupCamera()
        sceneView.delegate = worldScene
        sceneView.isPlaying = true
        
        //setup light environment
      
        
        
        
        
    }

    @IBAction func onSpawnTreeButtone(_ sender: Any) {
        let tree = Tree(fileName: "tree", fileType: "scn",dir: "/Art.scnassets/Vegetation")
        world.randomlySpawnCopy(tree, on: world.terrains[0]);
    }
    
}

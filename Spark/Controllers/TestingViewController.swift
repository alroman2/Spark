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
        
        world = WorldState();
        //var terrain = Terrain(width: 3, length: 3, height: 0)
       
        //sceneView.allowsCameraControl = true
        scene = SCNScene()
        //let tarrainReference = SCNReferenceNode(coder: terrain.terrainScene?.rootNode as! SCNNode)
        scene.rootNode.addChildNode(world.terrains[0].parentNode)
        sceneView.scene = scene
        sceneView.showsStatistics = true
        //sceneView.debugOptions = [.showWireframe,.showBoundingBoxes]
        //sceneView.debugOptions = [.showBoundingBoxes]
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        //setupCamera()
        
        //setup light environment
      
        //generate trees
        
        
    }

    @IBAction func onSpawnTreeButtone(_ sender: Any) {
        let tree = Tree(fileName: "tree", fileType: "scn",dir: "/Art.scnassets/Vegetation")
        world.spawnCopy(tree, on: world.terrains[0]);
    }
    
}

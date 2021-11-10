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
    var scene: SCNScene!
    
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
        
        var terrain = Terrain(width: 3, length: 3, height: 0)
       
        //sceneView.allowsCameraControl = true
        scene = SCNScene()
        //let tarrainReference = SCNReferenceNode(coder: terrain.terrainScene?.rootNode as! SCNNode)
        scene.rootNode.addChildNode((terrain.terrainScene?.rootNode.childNode(withName: "Terrain Parent Node", recursively: true))!)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

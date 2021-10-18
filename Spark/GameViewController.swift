//
//  GameViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/14/21.
//

import UIKit
import SceneKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    var scene: SCNScene!

    override func viewDidLoad() {
     
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
        sceneView.allowsCameraControl = true
        guard let scene = SCNScene(named: "Art.scnassets/Earth copy.scn") else { fatalError("Unable to load scene file")}
        sceneView.scene = scene
        
        
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

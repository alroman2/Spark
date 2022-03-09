//
//  GameViewController.swift
//  Spark
//
//  Created by Alex Roman on 10/14/21.
//

import UIKit
import SceneKit

class GameViewController: UIViewController {
    
    
    
    @IBOutlet weak var sparkCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        sparkCollectionView.register(SparkCollectionViewCell.nib(), forCellWithReuseIdentifier: SparkCollectionViewCell.identifier)
        sparkCollectionView.delegate = self
        sparkCollectionView.dataSource = self
        sparkCollectionView.reloadData()
        setupScene()
        
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
        
        
//        //sceneView.allowsCameraControl = true
//        guard let scene = SCNScene(named: "Art.scnassets/Earth copy.scn") else { fatalError("Unable to load scene file")}
//
//        sceneView.scene = scene
//        //setupCamera()
//
//        //setup light environment
//        setupEnvironmentLighting()
//
//        worldNode = (sceneView.scene?.rootNode.childNode(withName: "Mountain Lake copy reference", recursively: true))!
//
//        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gestureRecognize:)))
//        sceneView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func panGesture(gestureRecognize: UIPanGestureRecognizer){
//        let translation = gestureRecognize.translation(in: gestureRecognize.view!)
//
//        let widthRatio = Float(translation.x) / Float(gestureRecognize.view!.frame.size.width) + (lastWidthRatio ?? 0.0)
//        let heightRatio = Float(translation.y) / Float(gestureRecognize.view!.frame.size.width) + (lastHeightRatio ?? 0.0)
//
//        self.worldNode?.eulerAngles.y = Float(-2*M_PI)*widthRatio
//        self.worldNode?.eulerAngles.x = Float(-M_PI)*heightRatio
//
//        if (gestureRecognize.state == .ended){
//            lastWidthRatio = widthRatio
//            lastHeightRatio = heightRatio
//        }
    }
    
    func setupCamera(){
        //        frontCamera = SCNCamera()
        //        frontCamera.fieldOfView = 40
        //
        //        let frontCameraNode = SCNNode()
        //        frontCameraNode.camera = frontCamera
        //        frontCameraNode.position = SCNVector3Make(-14, 10, 0)
        //        frontCameraNode.orientation = SCNQuaternion(-0.26, -0.32, 0, 0.91)
        //        scene.rootNode.addChildNode(frontCameraNode)
        
    }
    
    func setupEnvironmentLighting(){
        
    }

    
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sparkCollectionView.dequeueReusableCell(withReuseIdentifier: "SparkCollectionViewCell", for: indexPath) as! SparkCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 800)
    }
    
  
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    
}

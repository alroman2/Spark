//
//  WorldScene.swift
//  Spark
//
//  Created by Alex Roman on 12/31/21.
//

import Foundation
import SceneKit
import GameplayKit

class WorldScene: SCNScene, SCNSceneRendererDelegate {
    
    var root: SCNScene!
    var lightNode: SCNNode!
    
    var worldStateManager: WorldState!
    override init() {
        super.init()
        root = SCNScene()
        worldStateManager = WorldState()
        root.rootNode.addChildNode(worldStateManager.terrains[0].parentNode)
        setupLighting()
        root.background.contents = MDLSkyCubeTexture(name: "sky", channelEncoding: .float16, textureDimensions: vector_int2(128,128), turbidity: 0, sunElevation: 1, upperAtmosphereScattering: 0.5, groundAlbedo: 0.8)
        self.lightingEnvironment.contents = self.background.contents
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// The renderer delegate for an active scene view that calls the world state manager to update
    /// - Parameters:
    ///   - renderer: renderer description
    ///   - time: time description
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        print("updating states")
        worldStateManager.update()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didApplyAnimationsAtTime time: TimeInterval) {
        
    }
    
    func setupLighting(){
        var lightNode = SCNNode()
        var light = SCNLight()
        light.type = .directional
        light.castsShadow = true
        
        lightNode.light = light
        
        
        root.rootNode.addChildNode(lightNode)
        lightNode.worldPosition.y = 5
        lightNode.eulerAngles.x = -90
    }
    
}

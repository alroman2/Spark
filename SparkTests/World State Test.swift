//
//  World State Test.swift
//  SparkTests
//
//  Created by Alex Roman on 12/28/21.
//

import XCTest
@testable import Spark
import SceneKit

class World_State_Test: XCTestCase {

    var world: WorldState!
    
    override func setUp() {
        super.setUp()
        world = WorldState()
    }
    
    override func tearDown() {
        world = nil
        super.tearDown()
    }
    
    func test_Inbound_spawn_point(){
        let spawnPoint = SCNVector3(0.5, 0, 0.5)
    }
    
    func test_spawn_copy_in_bounds(){
        let tree = Tree(fileName: "tree", fileType: "scn", dir: "/Art.scnassets/Vegetation")
        
    }
}

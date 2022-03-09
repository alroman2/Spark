//
//  Terrain Tests.swift
//  SparkTests
//
//  Created by Alex Roman on 12/31/21.
//

@testable import Spark
import XCTest
import SceneKit

class Terrain_Tests: XCTestCase {
    var terrain: Terrain!
    
    
    override func setUp() {
        super.setUp()
        terrain = Terrain(width: 5, length: 5, height: 0)
    }
    
    override func tearDown() {
        terrain = nil
        super.tearDown()
    }
    
    func test_terrain_check_for_valid_grid_coordinate(){
        XCTAssertTrue(terrain.gridContains(x: 1, y: 0, z: 1))
        XCTAssertTrue(terrain.gridContains(x: 0, y: 0, z: 0))
        XCTAssertTrue(terrain.gridContains(x: 5, y: 0, z: 5))
    }
    
    func test_terrain_check_for_out_bounds_grid_coordinate(){
        XCTAssertFalse(terrain.gridContains(x: -1, y: 0, z: -1), "Negative coordinates should not exist in the terrain grid" )
        XCTAssertFalse(terrain.gridContains(x: 6, y: 0, z: 6), "Out of bound coordinates")
        XCTAssertFalse(terrain.gridContains(x: 1, y: 0, z: -5), "z out of bounds")
    }
}

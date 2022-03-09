//
//  World Oject Tests.swift
//  SparkTests
//
//  Created by Alex Roman on 12/28/21.
//

@testable import Spark
import XCTest

class World_Object_Tests: XCTestCase {

    var object: WorldObject!
    
    override func setUp() {
        super.setUp()
        object = WorldObject()
    }
    
    override func tearDown() {
        object = nil
        super.tearDown()
    }
    
    func test_object_valid_model_loading() throws {
        XCTAssertNoThrow(try object.loadModel(fileName: "tree", fileType: "scn", dir: "/Art.scnassets/Vegetation"))
    }
    
    func test_object_missing_model_loading() throws {
        XCTAssertThrowsError( try object.loadModel(fileName: "notFound", fileType: "scn", dir: "dir"))
    }

}

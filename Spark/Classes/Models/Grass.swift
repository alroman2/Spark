//
//  Grass.swift
//  Spark
//
//  Created by Alex Roman on 1/8/22.
//

import Foundation

class Grass: WorldObject {
    /// Initialize a grass object and it's respective model
    /// - Parameters:
    ///   - fileName: name of asset
    ///   - fileType: inherits scenekit accepted filetypes
    ///   - dir: directory path from project root
    init(fileName:String, fileType:String, dir:String){
        super.init()
        try? loadModel(fileName: fileName, fileType: fileType, dir: dir)
        isOverlappable = true
    }
}

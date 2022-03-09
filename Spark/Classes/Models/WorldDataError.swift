//
//  WorldDataError.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation

public enum WorldDataError: Error {
    case nilNode
    case invalidModel
    case spawnGeneration
    case spawnOutOfBounds
    case spawnInObjectBounds
}

extension WorldDataError: LocalizedError {
    public var errorDescription: String?{
        switch self{
        case .invalidModel:
            return NSLocalizedString("The model is invalid", comment: "An error when an invalid model is encountered")
        case .spawnGeneration:
            return NSLocalizedString("There was an error loading or spawing the object", comment: "An error when spawing an object encountered an error")
        
        case .spawnOutOfBounds:
            return NSLocalizedString("The object spawned outside valid bounds", comment: "")
        case .spawnInObjectBounds:
            return NSLocalizedString("The object spawned inside the bounding box of another object", comment: "The error is thrown when the spawn is uninteded behvaior.")
      
        case .nilNode:
            return NSLocalizedString("The node or reference node was found nil", comment: "")
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .invalidModel:
            return NSLocalizedString("The target model could not be found or does not exist", comment: "")
        case .spawnGeneration:
                return NSLocalizedString("A vaild spawn point could not be retrieved as one may not exist", comment: "")
        case .spawnOutOfBounds:
                return NSLocalizedString("The spawn point was out of the map bounds on the an axis", comment: "")
        case .spawnInObjectBounds:
            return NSLocalizedString("The spawn coordinates are withing the bounding box of another object", comment: "")
        case .nilNode:
            return NSLocalizedString("The node was not initialized", comment: "")
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .invalidModel:
            return NSLocalizedString("Ensure the model exist or use a different model", comment: "")
        case .spawnGeneration:
            return NSLocalizedString("Use a valid geomtry source or abort the spawn procedure", comment: "")
        case .spawnOutOfBounds:
            return NSLocalizedString("Attempt to respawn or bound the the object to the super object borders", comment: "")
        case .spawnInObjectBounds:
            return NSLocalizedString("Transform objects aways or despawn an object", comment: "")
        case .nilNode:
            return NSLocalizedString("Initialize the node with a model", comment: "")
        }
    }
}

extension WorldDataError: CustomNSError {
    public static var errorDomain: String = "com.server.spark.WorldDataError"
    
    public var errorCode: Int {
        switch self {
        case .invalidModel:
            return 1000
        case .spawnGeneration:
            return 1010
        case .spawnOutOfBounds:
            return 1020
        case .spawnInObjectBounds:
            return 1030
        case .nilNode:
            return 1040
        }
        
        
        var errorUserInfo: [String:Any] {
            switch self {
            case .invalidModel:
                return ["Model Loading Failed": "World Object"]
            case .spawnGeneration:
                return ["Spawning generation failed": "World Object"]
                
            case .spawnOutOfBounds:
                return ["Out of Bounds Spawn" : "World State"]
            case .spawnInObjectBounds:
                return ["Object Spawn Clips Neighbor Object" : "World State"]
            case .nilNode:
                return ["Nil Node": "Terrain"]
            }
        }
        
        
    }
}

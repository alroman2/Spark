//
//  WorldDataError.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation

public enum WorldDataError: Error {
    case invalidModel
    case spawnGeneration
}

extension WorldDataError: LocalizedError {
    public var errorDescription: String?{
        switch self{
        case .invalidModel:
            return NSLocalizedString("The model is invalid", comment: "An error when an invalid model is encountered")
        case .spawnGeneration:
            return NSLocalizedString("There was an error loading or spawing the object", comment: "An error when spawing an object encountered an error")
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .invalidModel:
            return NSLocalizedString("The target model could not be found or does not exist", comment: "")
        case .spawnGeneration:
                return NSLocalizedString("A vaild spawn point could not be retrieved as one may not exist", comment: "")
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .invalidModel:
            return NSLocalizedString("Ensure the model exist or use a different model", comment: "")
        case .spawnGeneration:
            return NSLocalizedString("Use a valid geomtry source or abort the spawn procedure", comment: "")
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
        }
        
        var errorUserInfo: [String:Any] {
            switch self {
            case .invalidModel:
                return ["Model Loading Failed": "World Object"]
            case .spawnGeneration:
                return ["Spawning xor generation failed": "World Object"]
                
            }
        }
        
        
    }
}

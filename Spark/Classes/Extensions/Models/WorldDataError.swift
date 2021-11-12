//
//  WorldDataError.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation

public enum WorldDataError: Error {
    case invalidModel
}

extension WorldDataError: LocalizedError {
    public var errorDescription: String?{
        switch self{
        case .invalidModel:
            return NSLocalizedString("The model is invalid or could not be found", comment: "An error when an invalid model is encountered")
        }
    }
}

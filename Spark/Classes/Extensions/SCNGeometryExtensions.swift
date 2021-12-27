//
//  SCNGeometryExtensions.swift
//  Spark
//
//  Created by Alex Roman on 11/11/21.
//

import Foundation
import SceneKit

extension SCNGeometry {
    
    ///   Calculates a the corresponding vertex data points that make up the SCNGeometry
    /// - Returns: A list of SCNVector3
    func vertices() -> [SCNVector3]? {
        let sources = self.sources(for: .vertex)
        
        guard let source = sources.first else {
            print("Unable get the first geometry element")
            return nil
        }
        
        let stride = source.dataStride / source.bytesPerComponent
        let offset = source.dataOffset / source.bytesPerComponent
        
        let vectorCount = source.vectorCount
        
        print("stride: \(stride)")
        print("offset: \(offset)")
        print("vectorCount: \(vectorCount)")
        return source.data.withUnsafeBytes { (buffer: UnsafePointer<Float>) -> [SCNVector3] in
            var result = Array<SCNVector3>()
            
            for i in 0...vectorCount - 1 {
                let start = i * stride + offset
                let x = buffer[start]
                let y = buffer[start + 1]
                let z = buffer[start + 2]
                
                
                result.append(SCNVector3(x,y,z))
            }
            
            return result
        }
    }
    
}


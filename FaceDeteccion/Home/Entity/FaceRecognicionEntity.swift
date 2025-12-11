//
//  FaceRecognicionEntity.swift
//  FaceDeteccion
//
//  Created by jhonatan on 25/11/25.
//

import Vision


struct FaceRecognicionEntity {
    let uuid: String
    let x: Double
    let y: Double
    let width: Double
    let height: Double
    
    init(_ vnFaceObservation:  VNFaceObservation) {
        self.uuid = UUID().uuidString
        self.x = Double(vnFaceObservation.boundingBox.origin.x)
        self.y = Double(vnFaceObservation.boundingBox.minY)
        self.width = Double(vnFaceObservation.boundingBox.width)
        self.height = Double(vnFaceObservation.boundingBox.height)
    }
}

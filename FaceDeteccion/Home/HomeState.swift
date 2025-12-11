//
//  HomeState.swift
//  FaceDeteccion
//
//  Created by jhonatan on 11/12/25.
//

import UIKit
import Vision

struct HomeViewState {
    var pickerSource: ImagePickerRepresentable.SourceType?
    var image: UIImage = .imagePlaceholder
    var faces: [VNFaceObservation] = []
    var isDetecting: Bool = false
    var canDetectFaces: Bool { image != .placeholder && !isDetecting }

}

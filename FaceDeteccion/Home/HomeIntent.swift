//
//  HomeIntent.swift
//  FaceDeteccion
//
//  Created by jhonatan on 11/12/25.
//

import UIKit

enum HomeIntent {
    case detectFaces
    case selectImage(UIImage?)
    case openCamera(ImagePickerRepresentable.SourceType?)
}

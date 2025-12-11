//
//  ImagePicker.swift
//  FaceDeteccion
//
//  Created by jhonatan on 25/11/25.
//

import SwiftUI

struct ImagePickerRepresentable {
    
    let sourceType: SourceType
    let onImagePicked: (UIImage?) -> Void
    
}

// MARK: UIViewControllerRepresentable

extension ImagePickerRepresentable: UIViewControllerRepresentable {
    
    func makeCoordinator() -> ImagePickerRepresentable.Coordinator {
        Coordinator(onImagePicked: onImagePicked)
    }
    
    func makeUIViewController(context: Context)
    -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = sourceType.uiKitSourceType
        return imagePickerController
    }
    
    func updateUIViewController(
        _ uiViewController: UIImagePickerController
        , context: Context)
    {
    }
    
}

// MARK: SourceType

extension ImagePickerRepresentable {
    
    enum SourceType {
        case camera
        case photoLibrary
        
        var uiKitSourceType: UIImagePickerController.SourceType {
            switch self {
            case .camera: return .camera
            case .photoLibrary: return .photoLibrary
            }
        }
    }
    
}

// MARK: Coordinator

extension ImagePickerRepresentable {
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        private let onImagePicked: (UIImage?) -> Void
        
        init(onImagePicked: @escaping (UIImage?) -> Void) {
            self.onImagePicked = onImagePicked
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            let image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
            onImagePicked(image)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
            onImagePicked(nil)
        }
        
    }
    
}

extension ImagePickerRepresentable.SourceType: Identifiable {
    var id: Int {
        switch self {
        case .camera: return 0
        case .photoLibrary: return 1
        }
    }
}

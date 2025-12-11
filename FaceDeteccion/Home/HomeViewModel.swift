//
//  HomeViewModel.swift
//  FaceDeteccion
//
//  Created by jhonatan on 25/11/25.
//

import Combine
import UIKit

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var state = HomeViewState()

    func send(_ intent: HomeIntent) {
        switch intent {
        case .detectFaces:
            detectFaces()
        case .selectImage(let image):
            selectImage(image)
        case .openCamera(let source):
            selctPickSource(source)
        }
    }
    
    private func selctPickSource(_ source: ImagePickerRepresentable.SourceType?) {
        self.state.pickerSource = source
    }
    
    private func selectImage(_ image: UIImage?) {
        guard let image else { return }
        self.state.image = image
        state.faces = []
        detectFaces()
    }
    
    private func detectFaces() {
        state.isDetecting = true
        Task {
            await state.image.detectFaces { result in
                self.state.faces = result ?? []
                self.state.isDetecting = false
                self.state.image = result?.drawnOn(self.state.image) ?? self.state.image
            }
        }
        
    }
    
}




//
//  HomView.swift
//  FaceDeteccion
//
//  Created by jhonatan on 25/11/25.
//
import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            MainView(
                image: viewModel.state.image,
                text: "\(viewModel.state.faces.count) faces",
                button: {
                    TwoStateButton(
                        text: "Detect Faces",
                        disabled: !viewModel.state.canDetectFaces,
                        action: {viewModel.send(.detectFaces)}
                    )
                }
            )
            .padding()
            .navigationTitle("FDDemo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Select") { viewModel.send(.openCamera(.photoLibrary)) }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { viewModel.send(.openCamera(.camera))}) {
                        Image(systemName: "camera")
                    }.disabled(!UIImagePickerController.isSourceTypeAvailable(.camera))
                }
            }
            .fullScreenCover(item: $viewModel.state.pickerSource) { source in
                ImagePickerRepresentable(sourceType: source) { image in
                    viewModel.send(.selectImage(image))
                }
            }
        }
        .showLoading(viewModel.state.isDetecting)
        
    }
}



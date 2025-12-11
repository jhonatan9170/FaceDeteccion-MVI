//
//  LoadingModifier.swift
//  FaceDeteccion
//
//  Created by jhonatan on 11/12/25.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .allowsHitTesting(!isLoading)
            
            if isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                ProgressView() {
                    Text("Cargando...")
                        .foregroundColor(.white)
                        
                }
                    .scaleEffect(1.3)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.2), value: isLoading)
                    .progressViewStyle(.automatic)
            }
        }
    }
}

#Preview {
    VStack {
        Text("Contenido de ejemplo")
            .padding()
            .showLoading(true)
    }
}
